<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'teacher.label', default: 'Teacher')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="container-fluid">
    <div class="col-md-6">
        <table>
            <g:each in="${objectList.members}" status="i" var="item">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td>${item.name}</td>
                </tr>
            </g:each>
        </table>
    </div>

    <div class="col-md-6">
        <table>
            <g:each in="${objectList.teachers}" status="i" var="item">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td>${item.name}</td>
                </tr>
            </g:each>
        </table>
    </div>
</div>
</body>
</html>