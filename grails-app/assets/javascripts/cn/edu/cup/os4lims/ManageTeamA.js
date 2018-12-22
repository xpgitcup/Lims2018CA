var operation4ManageTeamADiv;
var tabList4ManageTeamA = ["相关项目类型", "项目", "领导的", "参与的"];
var idList4ManageTeamA = ["currentProject", "currentTeamLeader", "currentTeamJoin"];

$(function () {
    console.info("团队管理...");

    operation4ManageTeamADiv = $("#operation4ManageTeamADiv");
    setupTabsWithDivAndPagination(operation4ManageTeamADiv, tabList4ManageTeamA);
    setupTabPageParams("operation4ManageTeamADiv", countManageTeamA, loadManageTeamA);

});

function countManageTeamA(title) {
    console.info("统计基础数据..." + title);
    var ids = loadAllDisplayTitleId(idList4ManageTeamA)

    switch (title) {
        case "相关项目类型":
            total = ajaxCalculate("operation4ManageTeamA/count?key=relatedThingType");
            break
        case "项目":
            total = ajaxCalculate("operation4ManageTeamA/count?key=project");
            break
        case "领导的":
            total = ajaxCalculate("operation4ManageTeamA/count?key=leader");
            break
        case "参与的":
            total = ajaxCalculate("operation4ManageTeamA/count?key=thingType&upType=" + currentThingTypeClassify);
            break
    }
    return total;
}

function loadManageTeamA(title, page, pageSize) {
    console.info("调入基础数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    switch (title) {
        case "相关项目类型":
            ajaxRun("operation4ManageTeamA/list" + params + "&key=relatedThingType", 0, "list" + title + "Div");
            break
        case "具体任务":
            ajaxRun("operation4ManageTeamA/list" + params + "&key=thingType&upType=" + currentThingTypeClassify, 0, "list" + title + "Div");
            break
        case "任务安排":
            ajaxRun("operation4ManageTeamA/list" + params + "&key=taskAllocation&thingType=" + currentThingType, 0, "list" + title + "Div");
            break
    }
    $.cookie("currentPage" + title, page);
}