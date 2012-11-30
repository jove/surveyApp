import exp.Survey
import exp.Question

def rates=['Strong','Normal+','Normal','Normal-','Weak','No opinion']
def aspects=['Tech Skill','Initiative','Result Driven','Teamwork','Communication','Influence','Leadership','Work Hard','Work Smart']

def targets=['Member A','Member B','Member C']
def genders=['M','F','M']
def questionArray=[]	
fixture{
    n(Question, options:[], type:'short', defaultValue:'anonymous',text:"Your name (optional)")
    questionArray.add n

	aspects.eachWithIndex{a,aIdx ->
		"q_${aIdx}"(Question){
			text=a
			options=rates
            defaultValue='No opinion'
		}
		questionArray.add ref("q_${aIdx}")
	}
	s(Question, options:[],defaultValue:'N/A', text:'Please list 1-3 most strong points for him/her: (optional)')
	w(Question, options:[],defaultValue:'N/A', text:'Please list 1-3 areas that he/she need improvement: (optional)')
	questionArray.add s
	questionArray.add w

	targets.eachWithIndex{p,idx->
    	"survey${idx}"(Survey) {
    		name="360-degree survey for $p."
    		questions=questionArray
    	}
    }
}
