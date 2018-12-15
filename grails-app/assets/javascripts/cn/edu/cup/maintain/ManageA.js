var operation4ManageADiv;
var tabList4ManageA = ["项目列表", "团队", "队员", "人力资源"];
var idList4ManageA = ["currentProject", "currentTeam", "currentMember", "currentPerson"];

$(function () {
    console.info("以项目为主线的管理...");
    operation4ManageADiv = $("#operation4ManageADiv");
    tabPagesManagerB("operation4ManageADiv", tabList4ManageA, loadManageA, countManageA);
});

function selectAndTurnToNextManagerA(id) {
    var currentKey = getCurrentKey();
    var title = getCurrentTitle();
    console.info("点击当前：" + currentKey);
    $("#" + currentKey).html(id);
    switch (title) {
        case "项目列表":
            operation4ManageADiv.tabs("select", "团队");
            break
        case "团队":
            break
        case "队员":
            break
        case "人力资源":
            break
    }
}

function createItem(id) {
    var title = getCurrentTitle()
    console.info("创建..." + title)
    switch (title) {
        case "项目列表":
            ajaxRun("operation4ManageA/create?key=team&project=" + id, 0, "list" + title + "Div");
            break
    }
}

function enlist(id) {
    console.info("招募...")
    operation4ManageADiv.tabs("select", "人力资源");
}

function getCurrentTab() {
    var tab = operation4ManageADiv.tabs('getSelected');
    return tab;
}

function getCurrentTitle() {
    var tab = getCurrentTab();
    return tab.panel('options').title;
}

function getCurrentKey() {
    var tab = getCurrentTab();
    var index = operation4ManageADiv.tabs('getTabIndex', tab);
    var currentKey = idList4ManageA[index]
    return currentKey;
}


function countManageA(title) {
    console.info("统计基础数据..." + title);
    var total = 0;
    switch (title) {
        case "项目列表":
            total = ajaxCalculate("operation4ManageA/count?key=project");
            break
        case "队员":
            break
        case "人力资源":
            break
    }
    return total;
}

function loadManageA(title, page, pageSize) {
    console.info("调入基础数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var personId = $("#currentPersonId").text()
    var id = 0
    console.info(params)
    switch (title) {
        case "项目列表":
            ajaxRun("operation4ManageA/list" + params + "&key=project", 0, "list" + title + "Div");
            break
        case "团队":
            id = $("#currentProject").text()
            console.info("当前项目:" + id)
            ajaxRun("operation4ManageA/list" + params + "&key=team&leader=" + personId + "&projectId=" + id, 0, "list" + title + "Div");
            break
        case "队员":
            id = $("#currentProject").text()
            console.info("当前项目:" + id)
            ajaxRun("operation4ManageA/list" + params + "&key=team&leader=" + personId + "&projectId=" + id, 0, "list" + title + "Div");
            break
        case  "人力资源":
            id = $("#currentProject").text()
            console.info("当前项目:" + id)
            ajaxRun("operation4ManageA/list" + params + "&key=team&leader=" + personId + "&projectId=" + id, 0, "list" + title + "Div");
            break
    }
    $.cookie("currentPage" + title, page);
}

