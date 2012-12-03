Basic user stories
==================
As developer, you can folk, customize, and deploy this app to [CloudFoundry][1] or your own server, so that you create your own survey and securly maintain the database. 

>SaaS offerings like [surveymonkey][2] only supports 10 questions for one survey, or 100 responsers per survey

As admin, you can login as admin, load some predefined surveys, then share the generated survey URLs to your teammember/friends.

As responser, you can fill the survey in browser with links as following:

* <http://apple.cloudfoundry.com/survey/for/steve.jobs>  or 
* <http://mylocalhost:8080/surveyApp/survey/renderSurvey/101>

Myself(Jove) has been developing and using this webapp to conduct [360 degree employee survey][3] in 2011 and 2012.

[1]:http://www.cloudfoundry.com
[2]:http://www.surveymonkey.com/pricing/upgrade/quickview/
[3]:http://en.wikipedia.org/wiki/360-degree_feedback

Run the app in development mode
===============================
To load the sample data(fixtures), please use the following command line:
	grails -DtestData=<fixtureName> run-app
e.g.
	grails -DtestData=simpleSurvey run-app
	
	
How to open pages as admin
==========================
Please open url at <http://localhost:8080/surveyApp/survey/login?pwd=>password
You can get the inital password in surveyApp-config.properties, and update it at runtime, by login first, then
go <http://localhost:8080/surveyApp/settings> page.

To logout, go <http://localhost:8080/surveyApp/survey/logout>

This is different than the initial accessToken based auth design.
The flag is put in HTTP session, so you don't have to pass the token everywhere.


Load initital data
==================
<http://localhost:8080/surveyApp/survey/login?pwd=>password
then
<http://localhost:8080/surveyApp/survey/load/>fileName

How to customize the app
==========================
Surely you can folk this and change any groovy/gsp page.

But if you just want to change the labels and other settings like initial passsword, banner, footer messages,
you can just change the surveyApp-config.properties

The current surveyApp-config.properties looks like this

    survey_admin_key=210787
    survey_footer_msg=&copy; Company 2012
    survey_redirect_url=http://google.com
    survey_redirect_text=We are about to move you from this site to the google search page
    survey_renderSurvey_lead=Your are taking a survey:
    survey_brand=SurveyApp