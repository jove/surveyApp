package exp

import grails.plugin.fixtures.FixtureStringLoader

class SurveyController {

    static scaffold = true
    def fixtureLoader

    def login = {
    	if(params.pwd==Settings.findByPropKey('adminKey').propValue){
    		flash.message = "login successfully"
    		session.admin=true
    	}else{
    		flash.message = "Invalid passcode"
    		session.admin=false
    	}
    	redirect(uri:"/")
    }
    def logout ={
        flash.message = "Log out"
    	session.admin=false
    	redirect(uri:"/")
    }
    
    def load = {
    	if(params.id&&session.admin)
    		fixtureLoader.load(params.id)
    	redirect(uri:"/")	
    }

    def dsl = {
        if(!session.admin){
            flash.message="Please login first."
            redirect(uri:"/")
        }
    }

    def createByDsl = {
        if(params.dsl&&session.admin){
            new FixtureStringLoader(fixtureLoader.createFixture()).loadDsl(params.dsl)
            redirect(action:'list')
            return
        }
        redirect(uri:"/")   
    }

    def index = {
        redirect(action: 'renderSurvey', id: 1)
    }

    def newSurvey = {
        renderNewSurvey()
    }

    def saveSurvey = {
        def survey = new Survey(params)
        def result = survey.save()
        if(result) {
          flash.message = "A survey whose name is ${params.name} has been saved successfully"
          redirect(action: 'show', id: survey.id)
        }else{
          renderNewSurvey(survey)
        }
    }

    def renderSurvey = {
        def survey = Survey.get(params.id)
        if(!survey){
            //TODO: a candidate for functional testing
            flash.message = "A survey whose id is ${params.id} is not found, please make sure you choose an available survey"
            redirect(uri: '/')
        }else{
            [survey: survey]
        }
    }

    def "for"(){
        def survey = Survey.findByShortname(params.id)
        if(!survey){
            flash.message = "A survey whose id is ${params.id} is not found, please make sure you choose an available survey"
            redirect(uri: '/')
        }else{
            render(view: 'renderSurvey', model: [survey: survey])
        }        
    }

    def saveUserOpinion = {
        def answerMap = extractFromParams(params)
        def survey = Survey.get(params.surveyId)
        def answers = answerMap.collect {k,v->
            def question = Question.get(k)
            new Answer(question: question, text: v)
        }
        def uo = new UserOpinion(submitDate: new Date(), answers: answers, survey: survey)
        try{
            if(!uo.hasErrors()&&uo.save()){
                redirect(action: 'thanks', params: [opinionId: uo.id])
                return
            }
        }catch(Exception e){
            e.printStackTrace()
        }
        
        flash.message = 'Please provide answers for all questions'
        render(view: 'renderSurvey', model: [survey: survey])
    }

    def thanks = {
        render(template: 'thanks')
    }

    private void renderNewSurvey(survey = new Survey()) {
        def questions = Question.list()
        render(view: 'newSurvey', model: [surveyObj: survey, questionList: questions])
    }

    protected extractFromParams(params){
        def prefix = 'answer_'
        def pattern = ~/answer_\d+/
        def notAnswers = params.collect {k, v->
            if(!(pattern.matcher(k).matches())) {
                k
            }
        }
        def allParamNames = params.collect {k, v->
            k
        }
        def answers = allParamNames - notAnswers
        def questionIds = answers.collect {k->
            (k - prefix)
        }
        def result = [:]
        questionIds.each {qid->
            result << [(qid as Integer): params."${prefix}${qid}"]
        }
        result
    }
    
    //overwrite the scaffold actions
    
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def allSurvey=Survey.list(params)
        def inputCounts=allSurvey.collect{
            def userOpinions=UserOpinion.findAllBySurvey(it)
            def count=0
            userOpinions.each{userOpinion->
                if(userOpinion?.answers?.size()==userOpinion?.survey?.questions?.size()){
                    count++
                }
            }
            return count
        }
        [surveyInstanceList: allSurvey, surveyInstanceTotal: Survey.count(), inputCounts:inputCounts]
    }
    
    def show() {
        def surveyInstance = Survey.get(params.id)
        if (!surveyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])
            redirect(action: "list")
            return
        }

        [surveyInstance: surveyInstance, opinions: UserOpinion.findAllBySurvey(surveyInstance)]
    }
}
