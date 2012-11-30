<%@ page import="exp.Survey" %>



<div class="fieldcontain ${hasErrors(bean: surveyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="survey.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${surveyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: surveyInstance, field: 'questions', 'error')} ">
	<label for="questions">
		<g:message code="survey.questions.label" default="Questions" />
		
	</label>
	<g:select name="questions" from="${exp.Question.list()}" multiple="multiple" optionKey="id" size="5" value="${surveyInstance?.questions*.id}" class="many-to-many"/>
</div>

