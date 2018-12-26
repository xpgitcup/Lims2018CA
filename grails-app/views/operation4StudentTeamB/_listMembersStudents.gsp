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
        <g:each in="${objectList[0]?.students}" var="item" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${item.name}</td>
                <td>
                    ${item.code}
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

    <div class="nav">
        <g:form controller="operation4StudentTeamB" action="enlistStudent" method="POST">
            <g:hiddenField name="team" value="${objectList[0].id}"/>
            <ul>
                <li>学号(优先)</li>
                <li><g:textField name="code"/></li>
                <li>姓名</li>
                <li><g:textField name="name"/></li>
                <li>
                    <input type="submit" value="招募"/>
                </li>
            </ul>
        </g:form>
    </div>
</div>
</body>
</html>