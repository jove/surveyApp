package grails.plugin.fixtures

import grails.plugin.fixtures.files.FixtureFileLoader
import grails.plugin.fixtures.exception.FixtureException
import grails.plugin.fixtures.builder.FixtureBuilder
import org.springframework.context.ApplicationContext

class FixtureStringLoader extends FixtureFileLoader{

	FixtureStringLoader(fixture){
		super(fixture,[],new FixtureBuilder(fixture))
	}

	ApplicationContext loadDsl(String dsl) {
		loading = true
		doLoadDsl(dsl)
		loading = false		
		builder.createApplicationContext()
	}

	protected doLoadDsl(String dsl) {
		try {
			shell.evaluate(dsl)
		} catch (Throwable e) {
			throw new FixtureException("Failed to evaluate the DSL ${dsl}", e)
		}
	}

}