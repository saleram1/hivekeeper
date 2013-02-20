
<%@ page import="hivekeeper.Inspection" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inspection.label', default: 'Inspection')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-inspection" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-inspection" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list inspection">
			
				<g:if test="${inspectionInstance?.site}">
				<li class="fieldcontain">
					<span id="site-label" class="property-label"><g:message code="inspection.site.label" default="Site" /></span>
					
						<span class="property-value" aria-labelledby="site-label"><g:fieldValue bean="${inspectionInstance}" field="site"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectionInstance?.hiveActivity}">
				<li class="fieldcontain">
					<span id="hiveActivity-label" class="property-label"><g:message code="inspection.hiveActivity.label" default="Hive Activity" /></span>
					
						<span class="property-value" aria-labelledby="hiveActivity-label"><g:fieldValue bean="${inspectionInstance}" field="hiveActivity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectionInstance?.weather}">
				<li class="fieldcontain">
					<span id="weather-label" class="property-label"><g:message code="inspection.weather.label" default="Weather" /></span>
					
						<span class="property-value" aria-labelledby="weather-label"><g:fieldValue bean="${inspectionInstance}" field="weather"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectionInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="inspection.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${inspectionInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectionInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="inspection.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${inspectionInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectionInstance?.siteCity}">
				<li class="fieldcontain">
					<span id="siteCity-label" class="property-label"><g:message code="inspection.siteCity.label" default="Site City" /></span>
					
						<span class="property-value" aria-labelledby="siteCity-label"><g:fieldValue bean="${inspectionInstance}" field="siteCity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectionInstance?.siteState}">
				<li class="fieldcontain">
					<span id="siteState-label" class="property-label"><g:message code="inspection.siteState.label" default="Site State" /></span>
					
						<span class="property-value" aria-labelledby="siteState-label"><g:fieldValue bean="${inspectionInstance}" field="siteState"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${inspectionInstance?.id}" />
					<g:link class="edit" action="edit" id="${inspectionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
