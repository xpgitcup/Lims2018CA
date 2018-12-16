<h1>人力资源</h1>
<div class="easyui-tabs" id="operation4ManageAPersonGrade">
    <div title="测试1"></div>
    <div title="测试2"></div>
    <g:each in="${objectList}" var="item" status="i">
        <div title="${item.key}"> ${item.value}
        </div>
    </g:each>
</div>
