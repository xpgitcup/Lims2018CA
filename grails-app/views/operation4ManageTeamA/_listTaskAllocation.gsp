<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'project.label', default: 'ThingType')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div id="list-teacherTitle" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <table>
        <thead>
        <th>名称</th>
        <th>人员</th>
        <th>任务类型</th>
        <th>附加信息</th>
        </thead>
        <tbody>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>
                    ${item.name}
                </td>
                <td>
                    ${item.personTitle}
                </td>
                <td>${item.thingType}</td>
                <td>${item.appendFilter}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>