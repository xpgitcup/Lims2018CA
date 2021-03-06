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
    <g:set var="entityName" value="BasicType"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}维护</title>
    <asset:javascript src="cn/edu/cup/os4lims/${entityName}.js"/>
</head>

<body>
<div class="nav">
    <ul>
        <li><a>当前</a></li>
        <li><a id="currentTitle"></a></li>
        <li><a>||</a></li>
        <li><a id="createRootItem" href="javascript: createItem(0)">创建根节点</a></li>
        <li><a id="createItem" href="javascript: createItem()">创建</a></li>
        <li><a id="exportMatterType" href="operation4BasicType/exportToJsonFile/0" class="save">导出文件</a></li>
    </ul>
</div>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<div id="operation4BasicTypeDiv" class="easyui-tabs">
</div>
</body>
</html>
