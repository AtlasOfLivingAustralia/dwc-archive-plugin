<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="page.measurement-terms.title"/></title>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'dwc-archive.css')}" type="text/css">
</head>

<body>
<div id="main-content" class="container-fluid">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div id="headingBar" class="recordHeader heading-bar">
        <h1><g:message code="page.measurement-terms.title"/></h1>

        <h2><g:message code="page.measurement.source" args="${configuration.source}"/></h2>
    </div>
    <g:if test="${configuration.terms.isEmpty()}">
        <div class="measurement-terms.missing">
            <h3><g:message code="page.measurement-terms.noTerms.heading"/></h3>

            <p><g:message code="page.measurement-terms.noTerms"/></p>
        </div>
    </g:if>
    <g:if test="${!configuration.terms.isEmpty()}">
        <div class="term-map">
            <g:form>
                <fieldset>
                    <g:hiddenField name="source" value="${configuration.source}"/>
                    <table class="table table-bordered table-striped table-condensed">
                        <tr>
                            <th><g:message code="page.label.measurementType"/></th>
                            <th><g:message code="page.label.measurementUnit"/></th>
                            <th><g:message code="page.label.matchedUnit"/></th>
                            <th><g:message code="page.label.term"/></th>
                        </tr>
                        <g:each in="${configuration.terms}" var="term" status="ts">
                            <tr>
                                <td><g:fieldValue field="measurementType" bean="${term}"/><g:hiddenField
                                        name="terms[${ts}].measurementType" value="${term.measurementType}"/></td>
                                <td><g:fieldValue field="measurementUnit" bean="${term}"/><g:hiddenField
                                        name="terms[${ts}].measurementUnit" value="${term.measurementUnit}"/></td>
                                <td><g:fieldValue field="unit" bean="${term}"/></td>
                                <td><g:field type="textField" name="terms[${ts}].term" value="${term.simpleName()}"
                                             class="dwca-term" title="${message(code: 'page.label.term.detail')}"/></td>
                            </tr>
                        </g:each>
                    </table>
                </fieldset>

                <div class="form-submit">
                    <g:actionSubmit action="flattenMeasurementArchiveTerms"
                                    value="${message(code: 'page.label.flatten')}"/>
                </div>
            </g:form>
        </div>
    </g:if>
</div>
</body>
</html>