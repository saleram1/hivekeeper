<%@ page import="hivekeeper.Inspection" %>



<div class="fieldcontain ${hasErrors(bean: inspectionInstance, field: 'site', 'error')} required">
	<label for="site">
		<g:message code="inspection.site.label" default="Site" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="site" required="" value="${inspectionInstance?.site}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectionInstance, field: 'hiveActivity', 'error')} ">
	<label for="hiveActivity">
		<g:message code="inspection.hiveActivity.label" default="Hive Activity" />
		
	</label>
	<g:select name="hiveActivity" from="${inspectionInstance.constraints.hiveActivity.inList}" value="${inspectionInstance?.hiveActivity}" valueMessagePrefix="inspection.hiveActivity" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectionInstance, field: 'weather', 'error')} ">
	<label for="weather">
		<g:message code="inspection.weather.label" default="Weather" />
		
	</label>
	<g:select name="weather" from="${inspectionInstance.constraints.weather.inList}" value="${inspectionInstance?.weather}" valueMessagePrefix="inspection.weather" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectionInstance, field: 'siteCity', 'error')} ">
	<label for="siteCity">
		<g:message code="inspection.siteCity.label" default="Site City" />
		
	</label>
	<g:textField name="siteCity" value="${inspectionInstance?.siteCity}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectionInstance, field: 'siteState', 'error')} ">
	<label for="siteState">
		<g:message code="inspection.siteState.label" default="Site State" />
		
	</label>
	<g:textField name="siteState" value="${inspectionInstance?.siteState}"/>
</div>

