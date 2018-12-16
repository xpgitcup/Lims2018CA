<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'teacher.label', default: 'Teacher')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-teacherTitle" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>

<div id="list-teacherTitle" class="content scaffold-list" role="main">
    <h1>团队成员</h1>
    <table>
        <thead>
        <th>姓名</th>
        <th>编号</th>
        <th>身份</th>
        </thead>
        <tbody>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>
                    ${item.name}
                    <a href="javascript: dismiss(${item.id})">退出</a>
                </td>
                <td>${item.code}</td>
                <td>${item.personStatus()}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>