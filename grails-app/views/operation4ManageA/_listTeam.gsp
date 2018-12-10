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
                <th>名称</th>
                <th>项目</th>
                <th>指导教师人数</th>
                <th>学生人数</th>
                </thead>
                <tbody>
                <g:each in="${objectList}" var="item" status="i">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td>
                            ${item.name}
                        </td>
                        <td>${item.project}</td>
                        <td>${item.director?.size()}</td>
                        <td>${item.teamMember?.size()}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </body>
</html>