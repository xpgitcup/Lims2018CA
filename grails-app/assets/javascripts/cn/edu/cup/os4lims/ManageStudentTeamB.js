var operation4StudentTeamBDiv;
var tabList4ManageTeamB = ["可选题目", "相关团队", "相关队员"];
var operation4StudentTeamUl

$(function () {
    console.info("学生团队管理...");

    operation4StudentTeamUl = $("#operation4StudentTeamUl");
    operation4StudentTeamBDiv = $("#operation4StudentTeamBDiv");
    setupTabsWithDivAndPagination(operation4StudentTeamBDiv, tabList4ManageTeamB);
    setupTabPageParams("operation4StudentTeamBDiv", countManageTeamB, loadManageTeamB);
    setupDisplayUl(operation4StudentTeamUl, tabList4ManageTeamB)
    //var ids = loadAllDisplayTitleIdA(tabList4ManageTeamB);
});

function countManageTeamB(title) {
    console.info("统计数据...");
    var ids = loadAllDisplayTitleIdA(tabList4ManageTeamB);

    switch (title) {
        case "可选题目":
            total = ajaxCalculate("operation4StudentTeamB/count?key=things4StudentToSelect");
            break;
        case "相关团队":
            break;
        case "相关队员":
            break;
    }
}

function loadManageTeamB(title, page, pageSize) {
    console.info("调入数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var ids = reflashDisplayTitleA(operation4StudentTeamUl, tabList4ManageTeamB);

    switch (title) {
        case "可选题目":
            ajaxRun("operation4StudentTeamB/list" + params + "&key=things4StudentToSelect", 0, "list" + title + "Div");
            break;
        case "相关团队":
            ajaxRun("operation4StudentTeamB/list" + params + "&key=relatedTeams&thing=" + ids[0], 0, "list" + title + "Div");
            break;
        case "相关队员":
            break;
    }
}

function selectAndCreateTeam(id) {
    operation4StudentTeamBDiv.tabs("select", "相关团队");
    $.cookie("currentKey" + "可选题目", id);
    ajaxRun("operation4StudentTeamB/selectAndCreateTeam", id, "");
}