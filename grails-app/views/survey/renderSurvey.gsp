<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <title>Survey questions list</title>
      <meta name="layout" content="main"/>
      <style media="screen" type="text/css">
          span {
              display: block;
              clear: both;
          }
          .answerList {
              padding-left: 20px;
          }
          dl dt{
              margin-bottom: 10px;
          }
          .errorMsg {
              color: red;
              font: 14px sans-serif;
              margin-bottom: 10px;
          }
      </style>
  </head>
  <body>
        <span class="lead">${grailsApplication.config.survey_renderSurvey_lead} ${survey?.name}</span>
        <p><br/>
        <span>${grailsApplication.config.survey_renderSurvey_note}</span>
        </p>
        <g:if test="${flash.message}">
            <p class="errorMsg">${flash.message}</p>
        </g:if>
        <g:form action="saveUserOpinion">
                <g:hiddenField name="surveyId" value="${survey?.id}"/>
                <g:each in="${survey?.questions}" var="question" status="num">
                        <span style="margin-top:10px">${num + 1}. ${question?.text}</span>
                        <g:if test="${question?.options}">
                            <g:set var="optionList" value="${question.options}"/>
                            <div class="answerList">
                                <g:radioGroup name="answer_${question?.id}"
                                              values="${optionList}"
                                              value="${question?.defaultValue}"
                                              labels="${optionList}">
                                    <span class="radio">${it?.radio} ${it?.label}</span>
                                </g:radioGroup>
                            </div>
                        </g:if>
                        <g:else>
                            <g:if test="${'short'==question?.type}">
                                <g:textField name="answer_${question.id}" rows="4" value="${question?.defaultValue}" />
                            </g:if>
                            <g:else>
                                <g:textArea name="answer_${question.id}" rows="4" value="${question?.defaultValue}"/>
                            </g:else>
                        </g:else>
                </g:each>     
            <div style="margin-top:10px">
                <input type="submit" value="Submit your feedback" class="btn btn-primary">
            </div>
        </g:form>
  </body>
</html>