
<%@ page import="exp.UserOpinion" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'userOpinion.label', default: 'UserOpinion')}" />
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
            <g:if test="${userOpinionInstance?.submitDate}">
                <dt><g:message code="userOpinion.submitDate.label" default="Submit Date" /></dt>
                <dd><g:fieldValue bean="${userOpinionInstance}" field="submitDate"/></dd>
            </g:if>
            <g:if test="${userOpinionInstance?.survey}">
                <dt><g:message code="userOpinion.survey.label" default="Survey" /></dt>
                <dd><g:link controller="survey" action="show" id="${userOpinionInstance?.survey?.id}">${userOpinionInstance?.survey?.name}</g:link></dd>
            </g:if>

            <g:if test="${userOpinionInstance?.answers}">
                <dt><g:message code="userOpinion.answers.label" default="Answers" /></dt>
                <g:each in="${userOpinionInstance.answers}" var="a">
                    <div class="property-value" aria-labelledby="answers-label">
                        <strong>${a?.question.text}</strong><br/>
                        ${a?.text}<br/><br/></div>
                </g:each>

            </g:if>

        </dl>

        <g:form>
            <g:hiddenField name="id" value="${userOpinionInstance?.id}" />
            <div class="form-actions">
                <g:link class="btn" action="edit" id="${userOpinionInstance?.id}">
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
