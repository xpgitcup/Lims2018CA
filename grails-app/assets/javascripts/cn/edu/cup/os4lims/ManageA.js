var operation4ManageADiv;
var tabList4ManageA = ["任务分类", "具体任务", "任务安排"];
var idList4ManageA = ["currentThingType", "currentThing"];

$(function () {
    console.info("给事儿分配人...");
    operation4ManageADiv = $("#operation4ManageADiv");
    setupTabsWithDivAndPagination(operation4ManageADiv, tabList4ManageA);
    setupTabPageParams("operation4ManageADiv", countManageA, loadManageA);
});

function checkThingType(id) {
    $("#currentThingType").html(id);
    $.cookie("currentThingType", id);
    operation4ManageADiv.tabs("select", "具体任务");
}

function countManageA(title) {
    console.info("统计基础数据..." + title);
    var currentThingType = readCookie("currentThingType", 0);
    switch (title) {
        case "任务分类":
            total = ajaxCalculate("operation4ManageA/count?key=thingTypeOnlyType");
            break
        case "具体任务":
            total = ajaxCalculate("operation4ManageA/count?key=thingTypeOnlyThing&upType=" + currentThingType);
            break
    }
    return total;
}

function loadManageA(title, page, pageSize) {
    console.info("调入基础数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var currentThingType = readCookie("currentThingType", 0);
    switch (title) {
        case "任务分类":
            ajaxRun("operation4ManageA/list" + params + "&key=thingTypeOnlyType", 0, "list" + title + "Div");
            break
        case "具体任务":
            ajaxRun("operation4ManageA/list" + params + "&key=thingTypeOnlyThing&upType=" + currentThingType, 0, "list" + title + "Div");
            break
    }
    $.cookie("currentPage" + title, page);
}

