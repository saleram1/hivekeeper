
<%@ page import="hivekeeper.Inspection" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inspection.label', default: 'Inspection')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-inspection" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-inspection" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="site" title="${message(code: 'inspection.site.label', default: 'Site')}" />
					
						<g:sortableColumn property="hiveActivity" title="${message(code: 'inspection.hiveActivity.label', default: 'Hive Activity')}" />
					
						<g:sortableColumn property="weather" title="${message(code: 'inspection.weather.label', default: 'Weather')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'inspection.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'inspection.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="siteCity" title="${message(code: 'inspection.siteCity.label', default: 'Site City')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inspectionInstanceList}" status="i" var="inspectionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${inspectionInstance.id}">${fieldValue(bean: inspectionInstance, field: "site")}</g:link></td>
					
						<td>${fieldValue(bean: inspectionInstance, field: "hiveActivity")}</td>
					
						<td>${fieldValue(bean: inspectionInstance, field: "weather")}</td>
					
						<td><g:formatDate date="${inspectionInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${inspectionInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: inspectionInstance, field: "siteCity")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inspectionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
