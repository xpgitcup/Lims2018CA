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
        <th>队长</th>
        <th>项目</th>
        <th>创建时间</th>
        <th>人员</th>
        <th>操作</th>
        </thead>
        <tbody>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${item.name}</td>
                <td>${item.leader}</td>
                <td>${item.project}</td>
                <td>${item.createdDate}</td>
                <td>${item.members?.size()}</td>
                <td>
                    <a href="javascript: enlistTeacher(${item.id})">招募教师</a>
                    <a href="javascript: enlistStudent(${item.id})">招募学生</a>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>