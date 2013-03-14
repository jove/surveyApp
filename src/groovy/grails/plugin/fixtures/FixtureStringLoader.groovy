package grails.plugin.fixtures

import org.springframework.context.ApplicationContext
import grails.plugin.fixtures.files.FixtureFileLoader
import grails.plugin.fixtures.files.shell.FixtureBuildingShell

class FixtureStringLoader extends FixtureFileLoader{

	FixtureStringLoader(fixture){
		this.fixture = fixture
		this.shell = new FixtureBuildingShell(this)
	}

	ApplicationContext loadDsl(String dsl) {
		loading = true
		doLoadDsl(dsl)
		loading = false		
	}

	protected doLoadDsl(String dsl) {
		try {
			shell.evaluate(dsl)
		} catch (Throwable e) {
			throw new FixtureException("Failed to evaluate ${fixtureName} (pattern: '$locationPattern')", e)
		}
	}

}