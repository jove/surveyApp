import grails.util.Environment
import exp.Settings

class BootStrap {

    def fixtureLoader
    def grailsApplication

    def init = { servletContext ->
        if(Environment.current == Environment.DEVELOPMENT && System.properties.testData){
            fixtureLoader.load(System.properties.testData)
        }
        if(Settings.count()==0){
    		new Settings(propKey:'adminKey',propValue: grailsApplication.config.survey_admin_key).save(failOnError: true)
    	}
    }
    def destroy = {
    }
}
