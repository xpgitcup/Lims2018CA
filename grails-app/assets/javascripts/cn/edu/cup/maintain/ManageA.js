var operation4ManageADiv;
var tabList4ManageA = ["项目列表", "团队", "队员", "人力资源","分类浏览"];
var idList4ManageA = ["currentProject", "currentTeam", "currentMember", "currentPerson"];

$(function () {
    console.info("以项目为主线的管理...");
    operation4ManageADiv = $("#operation4ManageADiv");
    tabPagesManagerB("operation4ManageADiv", tabList4ManageA, loadManageA, countManageA);
    //tabPagesManagerA("operation4ManageADiv", tabList4ManageA, idList4ManageA, loadManageA, countManageA);

    // 更新全部当前记录标志
    updatePageIdList(idList4ManageA);
});

function updatePageIdList(idList) {
    var id
    for (e in idList) {
        id = readCookie("currentKey" + idList[e], 0)
        $("#" + idList[e]).html(id)
        //console.info("当前：" + idList[e] + ": " + id);
    }
}

function selectAndTurnToNextManagerA(id) {
    var currentKey = getCurrentKey();
    var title = getCurrentTitle();
    console.info("点击当前：" + currentKey);
    // 显示
    $("#" + currentKey).html(id);
    // 记录
    $.cookie("currentKey" + currentKey, id)

    switch (title) {
        case "项目列表":
            operation4ManageADiv.tabs("select", "团队");
            break
        case "团队":
            operation4ManageADiv.tabs("select", "队员");
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

function dismiss(id) {
    var title = getCurrentTitle()
    console.info("招募...")
    var currentTeam = readCookie("currentKey" + "currentTeam", 0);
    ajaxRun("operation4ManageA/dismiss/?team=" + currentTeam + "&person=" + id, 0, "");  //最后一个参数空置，就能忽略控制器的输出了
    window.location.reload();
}

function enlist(id) {
    var title = getCurrentTitle()
    console.info("招募...")
    var currentTeam = readCookie("currentKey" + "currentTeam", 0);
    ajaxRun("operation4ManageA/enlist/?team=" + currentTeam + "&person=" + id, 0, "");  //最后一个参数空置，就能忽略控制器的输出了
    window.location.reload();
}

/*
* 去招募S
* */
function toEnlist(id) {
    console.info("招募...")
    var currentKey = "currentTeam"
    // 显示
    $("#" + currentKey).html(id);
    // 记录
    $.cookie("currentKey" + currentKey, id)
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
    var currentTeam = readCookie("currentKey" + "currentTeam", 0);
    switch (title) {
        case "项目列表":
            total = ajaxCalculate("operation4ManageA/count?key=project");
            break
        case "队员":
            total = ajaxCalculate("operation4ManageA/count?key=member&team=" + currentTeam);
            break
        case "人力资源":
            total = ajaxCalculate("operation4ManageA/count?key=person&team=" + currentTeam);
            break
    }
    return total;
}

function loadManageA(title, page, pageSize) {
    console.info("调入基础数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var personId = $("#currentPersonId").text()
    var id = readCookie("currentKey" + "currentProject", 0);
    var currentTeam = readCookie("currentKey" + "currentTeam", 0);
    console.info("项目:" + id + "团队：" + currentTeam);
    switch (title) {
        case "项目列表":
            ajaxRun("operation4ManageA/list" + params + "&key=project", 0, "list" + title + "Div");
            break
        case "团队":
            console.info("当前项目:" + id)
            ajaxRun("operation4ManageA/list" + params + "&key=team&leader=" + personId + "&projectId=" + id, 0, "list" + title + "Div");
            break
        case "队员":
            ajaxRun("operation4ManageA/list" + params + "&key=member&team=" + currentTeam, 0, "list" + title + "Div");
            break
        case  "人力资源":
            console.info("招人：" + currentTeam);
            ajaxRun("operation4ManageA/list" + params + "&key=person&team=" + currentTeam, 0, "list" + title + "Div");
            break
        case "分类浏览":
            ajaxRun("operation4ManageA/list" + params + "&key=personGrade&team=" + currentTeam, 0, "list" + title + "Div");
            break
    }
    $.cookie("currentPage" + title, page);
}

