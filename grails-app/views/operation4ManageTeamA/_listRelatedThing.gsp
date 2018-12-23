<%@ page import="cn.edu.cup.lims.Thing; cn.edu.cup.lims.Person; cn.edu.cup.lims.Team" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-teacherTitle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="list-teacherTitle" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                <th>人员</th>
                <th>课题</th>
                <th>课题类型</th>
                <th>相关团队</th>
                <th>领导团队</th>
                </thead>
                <tbody>
                <g:each in="${objectList}" var="item" status="i">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td>
                            ${item.person}
                            <a href="operation4ManageTeamA/unselectIt/${item.id}">退选</a>
                            <a href="operation4ManageTeamA/createTeam/${item.id}">创建团队</a>
                        </td>
                        <td>${item.thing}</td>
                        <td>${item.thing.thingType}</td>
                        <td>
                            ${Team.countByThing(item.thing)}
                        </td>
                        <td>${Team.countByLeader(cn.edu.cup.lims.Person.get(session.realId))}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </body>
</html>