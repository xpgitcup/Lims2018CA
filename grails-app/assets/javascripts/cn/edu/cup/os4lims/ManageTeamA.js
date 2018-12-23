var operation4ManageTeamADiv;
var tabList4ManageTeamA = ["可选课题", "相关课题", "我的团队", "参与团队"];
var idList4ManageTeamA = ["currentThing", "currentRElatedThing", "currentTeamLeader", "currentTeamJoin"];

$(function () {
    console.info("课题选择...");

    operation4ManageTeamADiv = $("#operation4ManageTeamADiv");
    setupTabsWithDivAndPagination(operation4ManageTeamADiv, tabList4ManageTeamA);
    setupTabPageParams("operation4ManageTeamADiv", countManageTeamA, loadManageTeamA);

});

function countManageTeamA(title) {
    console.info("统计基础数据..." + title);
    var ids = loadAllDisplayTitleId(idList4ManageTeamA)

    switch (title) {
        case "可选课题":
            total = ajaxCalculate("operation4ManageTeamA/count?key=thing4Choice");
            break
        case "相关课题":
            total = ajaxCalculate("operation4ManageTeamA/count?key=thingRelated");
            break
        case "我的团队":
            total = ajaxCalculate("operation4ManageTeamA/count?key=myTeam");
            break
        case "参与团队":
            total = ajaxCalculate("operation4ManageTeamA/count?key=teamJoin");
            break
    }
    return total;
}

function loadManageTeamA(title, page, pageSize) {
    console.info("调入基础数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    switch (title) {
        case "可选课题":
            ajaxRun("operation4ManageTeamA/list" + params + "&key=thing4Choice", 0, "list" + title + "Div");
            break
        case "相关课题":
            ajaxRun("operation4ManageTeamA/list" + params + "&key=thingRelated", 0, "list" + title + "Div");
            break
        case "我的团队":
            ajaxRun("operation4ManageTeamA/list" + params + "&key=myTeam" + currentThingTypeClassify, 0, "list" + title + "Div");
            break
        case "参与团队":
            ajaxRun("operation4ManageTeamA/list" + params + "&key=teamJoin&thingType=" + currentThingType, 0, "list" + title + "Div");
            break
    }
    $.cookie("currentPage" + title, page);
}