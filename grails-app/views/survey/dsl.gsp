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
                  <div style="margin:12px">
                     <g:submitButton name="Create Survey" class="btn btn-primary"/>
                  </div>
               </g:form>


   			</div>

   		</div>

	</body>
</html>
