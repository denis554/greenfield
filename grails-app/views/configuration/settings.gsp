<%@ page import="org.greenfield.Catalog" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="admin">
	<g:set var="entityName" value="${message(code: 'catalog.label', default: 'Catalog')}" />
	<title>Greenfield : Settings</title>
	<style type="text/css">
		.section{
			margin:10px 20px 30px 0px;
		}
	</style>
		
	<link rel="stylesheet" href="${resource(dir:'js/lib/ckeditor/4.4.0', file:'contents.css')}" />	
	<script type="text/javascript" src="${resource(dir:'js/lib/ckeditor/4.4.0/ckeditor.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/ckeditor/4.4.0/styles.js')}"></script>
</head>
<body>

	<h2>Store Settings</h2>
	
	<g:if test="${flash.message}">
		<div class="alert alert-info" role="status">${flash.message}</div>
	</g:if>
	
	
	<ul class="nav nav-tabs" style="margin-bottom:30px;">
		<li class="active"><g:link uri="/configuration/settings" class="btn btn-default">Store Settings</g:link></li>
		<li class="inactive"><g:link uri="/configuration/email_settings" class="btn btn-default">Email Settings</g:link></li>
		<li class="inactive"><g:link uri="/configuration/stripe_settings" class="btn btn-default">Stripe/Payment Settings</g:link></li>
		<li class="inactive"><g:link uri="/configuration/shipping_settings" class="btn btn-default">Shipping Settings</g:link></li>
	</ul>
	
	
	
	<form action="save_settings" class="form-horizontal">
	
	
		<div class="form-row">
			<span class="form-label twohundred">Company Name
				<br/>
				<span class="information secondary">Important, required for page titles etc.</span>
			</span>
			<span class="input-container">
				<input type="text" class="form-control threehundred" name="storeName" value="${settings?.storeName}"/>
			</span>
			<br class="clear"/>
		</div>



		<div class="form-row">
			<span class="form-label twohundred">Tax Rate %
				<p class="information secondary">example : 7.5% enter 7.5</p>
			</span>
			<span class="input-container">
				<input type="text" class="onefifty form-control" name="taxRate" value="${settings?.taxRate}"/>
			</span>
			<br class="clear"/>
		</div>



		<div class="form-row">
			<span class="form-label twohundred">Shipping $
			</span>
			<span class="input-container">
				<input type="text" class="form-control onehundred" name="shipping" value="${settings?.shipping}"/>
			</span>
			<br class="clear"/>
		</div>



		<div class="form-row">
			<span class="form-label twohundred">Meta Keywords
			</span>
			<span class="input-container">
				<input type="text" class="form-control threehundred" name="keywords" value="${settings?.keywords}"/>
			</span>
			<br class="clear"/>
		</div>



		<div class="form-row">
			<span class="form-label twohundred">Meta Description
			</span>
			<span class="input-container">
				<textarea class="form-control threehundred" name="description"  style="height:100px;">${settings?.description}</textarea>
			</span>
			<br class="clear"/>
		</div>



		<div class="form-row">
			<span class="form-label twohundred">Google Analytics
				<br/>
				<span class="information secondary">UA # from code. e.g. UA-87654321-0</span>
			</span>
			<span class="input-container">
				<input type="text" class="form-control" name="googleAnalytics" value="${settings?.googleAnalytics}"/>
			</span>
			<br class="clear"/>
		</div>
		
		
		
		<div class="buttons-container">
			<g:link controller="configuration" action="index" class="btn btn-default">Cancel</g:link>
			<g:submitButton value="Save Settings" name="submit" class="btn btn-primary"/>
		</div>
		
	</form>
</body>
</html>