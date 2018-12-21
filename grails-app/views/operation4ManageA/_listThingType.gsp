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
        <th>操作</th>
        <th>安排情况</th>
        </thead>
        <tbody>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>
                    <a href="javascript: clickListItem(${item.id})">
                        ${item.name}
                    </a>
                </td>
                <td>
                    <a href="javascript: arrangeIt(${item.id})">安排</a>
                </td>
                <td>
                    ${cn.edu.cup.lims.TaskAllocation.countByThingType(item)}
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>