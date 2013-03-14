<%@ page import="exp.Survey" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<title>Add survey by DSL</title>
	</head>
	<body>
    <div class="row-fluid">

   			<div class="span9">

               <g:form class="form-horizontal" action="createByDsl" >
                  <g:textArea name="dsl" style="width:80%;height:500px"/>
                  <br/>
                  <g:submitButton name="Create Survey"/>
               </g:form>


   			</div>

   		</div>

	</body>
</html>
