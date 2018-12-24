<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}"/>
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
        <th>姓名</th>
        <th>学号</th>
        <th>年级</th>
        <th>类型</th>
        <th>导师</th>
        <th>专业</th>
        </thead>
        <tbody>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${item.name}</td>
                <td>
                    ${item.code}
                    <a href="operation4ManageTeamA/enlistStudent?student=${item.id}&team=${params.teamLeader}">招聘</a>
                </td>
                <td>
                    ${item.gradeName}
                </td>
                <td>${item.personTitle}</td>
                <td>${item.supervisor}</td>
                <td>${item?.major}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>