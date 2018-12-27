<%@ page import="cn.edu.cup.lims.Student; cn.edu.cup.lims.Team" %>
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
                    <g:if test="${cn.edu.cup.lims.Person.get(session.realId).equals(objectList[0]?.leader)}">
                        <!--如果是队长，可以解聘队员-->
                        <a href="operation4StudentTeamB/dismiss?team=${objectList[0]?.id}&student=${item.id}">解聘</a>
                    </g:if>
                    <g:else>
                        <!--只能决定自己是否退出-->
                        <g:if test="${item.id==session.realId}">
                            <a href="operation4StudentTeamB/dismiss?team=${objectList[0]?.id}&student=${item.id}">退出</a>
                        </g:if>
                    </g:else>
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
    <hr>

    <g:if test="${objectList[0]}">
        <g:if test="${cn.edu.cup.lims.Person.get(session.realId).equals(objectList[0]?.leader)}">
            <g:form controller="operation4StudentTeamB" action="enlistStudent" method="POST">
                <g:hiddenField name="team" value="${objectList[0]?.id}"/>
                <div class="nav">
                    <ul>
                        <li>&nbsp;&nbsp;&nbsp;&nbsp;输入学号或者姓名，招募队员...</li>
                        <li>学号(优先)</li>
                        <li><g:textField name="code"/></li>
                        <li>姓名</li>
                        <li><g:textField name="name"/></li>
                        <li>
                            <input type="submit" value="招募"/>
                        </li>
                    </ul>
                </div>
            </g:form>
        </g:if>
        <g:else>
            <h1>队长可以招募新队员！</h1>
        </g:else>
    </g:if>
    <g:else>
        <h1>还没有建立团队！</h1>
    </g:else>
</div>
</body>
</html>