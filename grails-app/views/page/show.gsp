
<%@ page import="org.greenfield.Page" %>
<%@ page import="org.greenfield.ApplicationService" %>
<% def applicationService = grailsApplication.classLoader.loadClass('org.greenfield.ApplicationService').newInstance()
%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'page.label', default: 'Page')}" />
		<title>Show Page</title>
	</head>
	<body>

	<div class="form-outer-container">
	
		<div class="form-container">
		
			<h2>Show Page
				<g:link controller="page" action="list" class="btn btn-default pull-right">Back to Pages</g:link>
				<br class="clear"/>
			</h1>
		
			<br class="clear"/>
		
		
			<div class="messages">
		
				<g:if test="${flash.message}">
					<div class="alert alert-info" role="status">${flash.message}</div>
				</g:if>
		
				<g:if test="${flash.error}">
					<div class="alert alert-danger" role="status">${flash.error}</div>
				</g:if>
				
				<g:hasErrors bean="${pageInstance}">
					<div class="alert alert-danger">
						<ul>
							<g:eachError bean="${pageInstance}" var="error">
								<li><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
					</div>
				</g:hasErrors>
			
			</div>
			
		
			<g:form method="post" >
			

				<g:hiddenField name="id" value="${pageInstance?.id}" />

				<div class="form-row">
					<span class="form-label full secondary">Url</span>
					<span class="input-container">
						<span class="information">
							/${applicationService.getContextName()}/page/store_view/${pageInstance.title} &nbsp;&nbsp;
												<a href="/${applicationService.getContextName()}/page/store_view/${URLEncoder.encode("${pageInstance.title}", "UTF-8")}"  target="_blank">Test</a>
						</span>
					</span>
					<br class="clear"/>
				</div>
			
				
				<div class="form-row">
					<span class="form-label full secondary">Title 
						<span class="information secondary block">Title must be unique</span>
					</span>
					<span class="input-container">
						<input name="title" type="text" class="form-control" value="${pageInstance?.title}" disabled="disabled"/>
					</span>
					<br class="clear"/>
				</div>
				
				
			
				<div class="form-row">
					<span class="form-label full secondary">Description 
					</span>
					<span class="input-container">
						<g:textArea class="form-control" name="content" id="content" cols="40" rows="10" maxlength="65535" value="${pageInstance?.content}"  disabled="disabled"/>
						<br class="clear"/>
					</span>
					<br class="clear"/>
				</div>
			
			
				<div class="form-row">
				</div>
			
			
			
				<div class="buttons-container">

					<g:if test="${pageInstance.title != "Home"}">
						<g:actionSubmit class="btn btn-danger" action="delete" value="Delete" onclick="return confirm('Are you sure?');" />
					</g:if>
					
					<g:link class="btn btn-default" action="edit" id="${pageInstance?.id}">Edit</g:link>
					
					
				</div>
				
			</g:form>
			
		</div>
	</div>
	


	</body>
</html>

