<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <!--meta name="layout" content="main"/-->
<!-- 实现可定制的布局 -->
    <g:if test="${layout}">
        <meta name="layout" content="${layout}"/>
    </g:if>
    <g:else>
        <g:if test="${session.layout}">
            <meta name="layout" content="${session.layout}"/>
        </g:if>
        <g:else>
            <meta name="layout" content="main"/>
        </g:else>
    </g:else>
<!-- end 实现可定制的布局 -->
    <g:set var="entityName" value="ManageA"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}维护</title>
    <asset:javascript src="cn/edu/cup/maintain/${entityName}.js"/>
</head>

<body>
<div class="nav">
    <ul>
        <li><a>当前项目：</a></li>
        <li><div id="currentProject"></div></li>
        <li><a>当前团队：</a></li>
        <li><a id="currentTeam"></a></li>
        <li><a>当前教师：</a></li>
        <li><a id="currentTeacher"></a></li>
    </ul>
</div>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<div id="operation4ManageADiv" class="easyui-tabs">
</div>
</body>
</html>
