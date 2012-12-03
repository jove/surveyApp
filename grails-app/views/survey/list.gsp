
<%@ page import="exp.Survey" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="row-fluid">

    <div class="span3">
        <div class="well">
            <ul class="nav nav-list">
                <li class="nav-header">${entityName}</li>
                <li class="active">
                    <g:link class="list" action="list">
                        <i class="icon-list icon-white"></i>
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
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
        </div>

        <g:if test="${flash.message}">
            <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
        </g:if>

        <table class="table table-striped">
            <thead>
            <tr>
                <g:sortableColumn property="name" title="${message(code: 'survey.name.label', default: 'Name')}" />
                <g:sortableColumn property="shortname" title="${message(code: 'survey.shortname.label', default: 'Short Name')}" />
                <th class="sortable">Input count</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${surveyInstanceList}" var="surveyInstance" status="i">
                <tr>
                    <td><g:link action="show" id="${surveyInstance.id}">${surveyInstance.name.size()>32?surveyInstance.name.substring(0,32)+'...':surveyInstance.name}</g:link></td>
                    <td><g:link action="for" id="${surveyInstance.shortname}">${surveyInstance.shortname}</g:link></td>
                    <td>${inputCounts[i]}</td>
                    <td class="link">
                        <g:link action="show" id="${surveyInstance.id}" class="btn btn-small">Show &raquo;</g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <bootstrap:paginate total="${surveyInstanceTotal}" />
        </div>
    </div>
</body>
</html>
