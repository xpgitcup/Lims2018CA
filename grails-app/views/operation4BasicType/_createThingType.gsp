<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'personTitle.label', default: 'PersonTitle')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div id="create-personTitle" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
<!--g:form resource="${this.personTitle}" method="POST"-->
    <g:form controller="operation4BasicType" action="save" method="POST" id="${this.newInstance.id}">
        <fieldset class="form">
            <g:textField name="objectType" value="${newInstance.class.simpleName}"/>
            <f:all bean="newInstance"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
