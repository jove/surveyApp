
<%@ page import="exp.Survey" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="row-fluid">

   			<div class="span3">
   				<div class="well">
   					<ul class="nav nav-list">
   						<li class="nav-header">${entityName}</li>
   						<li>
   							<g:link class="list" action="list">
   								<i class="icon-list"></i>
   								<g:message code="default.list.label" args="[entityName]" />
   							</g:link>
   						</li>
   						<li>
   							<g:link class="create" action="create">
   								<i class="icon-plus"></i>
   								<g:message code="default.create.label" args="[entityName]" />
   							</g:link>
   						</li>
   					</ul>
   				</div>
   			</div>

   			<div class="span9">

   				<div class="page-header">
   					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
   				</div>

   				<g:if test="${flash.message}">
   				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
   				</g:if>

   				<dl>
   					<g:if test="${surveyInstance?.name}">
   						<dt><g:message code="survey.name.label" default="Name" /></dt>

   							<dd><g:fieldValue bean="${surveyInstance}" field="name"/></dd>

   					</g:if>

                  <g:if test="${surveyInstance?.shortname}">
                     <dt><g:message code="survey.shortname.label" default="Short Name" /></dt>

                        <dd><g:fieldValue bean="${surveyInstance}" field="shortname"/></dd>

                  </g:if>

                   <g:if test="${surveyInstance?.questions}">
               				<li class="fieldcontain">
               					<span id="questions-label" class="property-label"><g:message code="survey.questions.label" default="Questions" /></span>

               						<g:each in="${surveyInstance.questions}" var="q">
               							<span class="property-value" aria-labelledby="questions-label">
               							<g:link controller="question" action="show" id="${q.id}">${q?.text.encodeAsHTML()}</g:link>
               							</span>
               							<g:each in="${opinions}" var="userOpinion">
               								<g:each in="${userOpinion.answers}" var="a">
               									<g:if test="${a.question==q}">
               										<span class="property-value">${a.text}</span>
               									</g:if>
               								</g:each>
               							</g:each>
               							<br>
               						</g:each>

               				</li>
               		</g:if>

   				</dl>

   				<g:form>
   					<g:hiddenField name="id" value="${surveyInstance?.id}" />
   					<div class="form-actions">
   						<g:link class="btn" action="edit" id="${surveyInstance?.id}">
   							<i class="icon-pencil"></i>
   							<g:message code="default.button.edit.label" default="Edit" />
   						</g:link>
   						<button class="btn btn-danger" type="submit" name="_action_delete">
   							<i class="icon-trash icon-white"></i>
   							<g:message code="default.button.delete.label" default="Delete" />
   						</button>
   					</div>
   				</g:form>

   			</div>

   		</div>
	</body>
</html>
