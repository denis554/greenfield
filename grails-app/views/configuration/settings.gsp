<%@ page import="org.greenfield.Catalog" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="admin">
	<g:set var="entityName" value="${message(code: 'catalog.label', default: 'Catalog')}" />
	<title>Greenfield : Settings</title>
	<link rel="stylesheet" href="${resource(dir:'js/lib/ckeditor/4.4.0', file:'contents.css')}" />	
	<script type="text/javascript" src="${resource(dir:'js/lib/ckeditor/4.4.0/ckeditor.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/ckeditor/4.4.0/styles.js')}"></script>

	<style type="text/css">
		.section{
			margin:10px 20px 30px 0px;
		}
	</style>
	
	<link rel="stylesheet" href="${resource(dir:'css', file:'admin.css')}" />
	
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
			<div class="form-label twohundred pull-left" style="display:inline-block">Base Currency</div>
			
			<%
			def usd = settings?.storeCurrency == "USD" ? "selected" : ""
			def gbp = settings?.storeCurrency == "GBP" ? "selected" : ""
			def eur = settings?.storeCurrency == "EUR" ? "selected" : ""
			def brl = settings?.storeCurrency == "BRL" ? "selected" : ""
			def inr = settings?.storeCurrency == "INR" ? "selected" : ""
			%>
			
			<div class="input-container pull-left" style="width:500px;">
				<select name="storeCurrency" class="form-control" style="width:230px;">
					<option value="USD" <%=usd%>>$  USD - US Dollar</option>
					<option value="GBP" <%=gbp%>>£  GBP - United Kingdom</option>
					<option value="EUR" <%=eur%>>€  EUR - France</option>
					<option value="EUR" <%=eur%>>€  EUR - Germany</option>
					<!--<option>€  EUR - The Netherlands</option>
					<option>¥  YEN - Japan</option>
					<option>$  HKD - Hong Kong</option>-->
					<option value="BRL" <%=brl%>>(R$ BRL - Brazil: By invite only)</option>
					<option value="INR" <%=inr%>>(₹ INR - India: By invite only)</option>
				</select>
				<br/>
				<span class="information secondary">Greenfield is configured to handle the country currencies listed.<br/> You can add more by editing CountryStatesHelper and CurrencyService</span>
				<br/>
				<span class="information secondary">Stripe is currently supported in 26 countries. <br/> The currency and country you select should match the country in which your business is located and used when setting up your Stripe account.</span>
				
				<br/>
				<br/>
				<span class="information">
					<a href="https://stripe.com/br/pricing" target="_blank">Stripe: Request an Invite (Brazil)</a><br/>
					<a href="https://stripe.com/global#signup-form" target="_blank">Stripe: Request an Invite (India)</a><br/>
					<!--<a href="https://stripe.com/global#signup-form" target="_blank">Request an Invite (Mexico)</a>-->
				</span>

				<br/>
				<span class="information secondary">No matter what country you’re based in, you can use 
					<a href="https://stripe.com/atlas" target="_blank">Atlas</a> to easily incorporate a U.S. company, set up a U.S. bank account, and start accepting payments with Stripe. <a href="https://stripe.com/atlas" target="_blank">Request an invite</a></span>
				
				<br class="clear"/>
			</div>
			
			<br class="clear"/>
			
		</div>
			
			
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
		
		<div class="form-row">
			<span class="form-label twohundred">Share Social Media Buttons Enabled
				<br/>
				<span class="information secondary">Facebook, Twitter &amp; Google+ on product page. (Only visible in production)</span>
			</span>
			<span class="input-container">
				<input type="checkbox" ${settings?.socialMediaEnabled} name="socialMediaEnabled" id="socialMediaEnabled"/>
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