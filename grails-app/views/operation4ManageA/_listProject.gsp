<%@ page import="cn.edu.cup.lims.Project; cn.edu.cup.lims.Person; cn.edu.cup.lims.Team" %>
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
        <th>团队</th>
        <th>所领导的团队</th>
        </thead>
        <tbody>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>
                    <a href="javascript: selectAndTurnToNextManagerA(${item.id})">
                        ${item.name}
                    </a>
                </td>
                <td>
                    <a href="javascript: createItem(${item.id})">创建团队</a>
                </td>
                <td>${item.projectType}</td>
                <td>${item.team?.size()}</td>
                <td>${cn.edu.cup.lims.Team.countByLeaderAndProject(cn.edu.cup.lims.Person.get(session.realId), cn.edu.cup.lims.Project.get(item.id))}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>