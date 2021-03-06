<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-teacherTitle" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>

<div id="list-teacherTitle" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <th>名称</th>
        <th>操作</th>
        <th>类型</th>
        <th>起始日期</th>
        <th>期限(年)</th>
        </thead>
        <tbody>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>
                    ${item.name}
                    <a href="">查看团队</a>
                </td>
                <td>
                    <a href="operation4ManageTeamA/selectIt/${item.id}">选择</a>
                </td>
                <td>${item.thingType}</td>
                <td>
                    ${item.startDate}
                </td>
                <td>${item.duration}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>