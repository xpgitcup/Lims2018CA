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
    <g:set var="entityName" value="BasicData"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}维护</title>
    <asset:javascript src="cn/edu/cup/maintain/${entityName}.js"/>
</head>

<body>
<div class="nav">
    <ul>
        <li><a>当前</a></li>
        <li><a id="currentTitle"></a></li>
        <li>
            <a id="currentTemplate" href="#">下载模板</a>
        </li>
        <li><a>|</a></li>
        <li><a>导入数据</a></li>
        <li>
            <g:uploadForm method="post" action="importFromFile">
                <ul>
                    <li>
                        <input type="file" name="uploadedFile"/>
                    </li>
                    <li>
                        <input type="hidden" name="key" value="" id="importKey">
                    </li>
                    <li>
                        <input type="submit" value="ok">
                    </li>
                </ul>
            </g:uploadForm>
        </li>
    </ul>
</div>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<div id="operation4BasicDataDiv" class="easyui-tabs">
</div>
</body>
</html>
