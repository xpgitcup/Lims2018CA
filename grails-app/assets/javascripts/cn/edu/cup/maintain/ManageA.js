var operation4ManageADiv;
var tabList4ManageA = ["项目列表", "参与团队", "所带学生"];
var idList4ManageA = ["currentTeacher", "currentStudent", "currentProject"];

$(function () {
    console.info("教师登录 项目、团队 信息维护...");

    operation4ManageADiv = $("#operation4ManageADiv");

    tabPagesManagerA("operation4ManageADiv", tabList4ManageA, idList4ManageA, loadManageA, countManageA);

});

function createItem(id) {
    var title = $("#currentTitle").html()
    console.info("创建..." + title)
    switch (title) {
        case "项目列表":
            ajaxRun("operation4ManageA/create?key=team&project=" + id, 0, "list" + title + "Div");
            break
        case "学生":
            ajaxRun("operation4ManageA/create?key=student", 0, "list" + title + "Div");
            break
        case  "项目":
            ajaxRun("operation4ManageA/create?key=project", 0, "list" + title + "Div");
            break
        case "教师职称":
            ajaxRun("operation4ManageA/create?key=teacherTitle", 0, "list" + title + "Div");
            break
        case "学生类别":
            ajaxRun("operation4ManageA/create?key=studentType", 0, "list" + title + "Div");
            break
        case "项目类型":
            ajaxRun("operation4ManageA/create?key=projectType", 0, "list" + title + "Div");
            break
    }
}

function getCurrentKey() {
    var tab = operation4ManageADiv.tabs('getSelected');
    var index = operation4ManageADiv.tabs('getTabIndex', tab);
    var currentKey = tabList4ManageA[index]
    return currentKey;
}


function showCurrent(title) {
    $("#currentTitle").html(title);
    switch (title) {
        case "教师":
            $("#currentTemplate").attr('href','operation4ManageA/downloadTemplate/?key=teacher');
            $("#importKey").attr('value', 'teacher')
            break
        case "学生":
            $("#currentTemplate").attr('href','operation4ManageA/downloadTemplate/?key=student');
            $("#importKey").attr('value', 'student')
            break
        case "项目":
            $("#currentTemplate").attr('href','operation4ManageA/downloadTemplate/?key=project');
            $("#importKey").attr('value', 'project')
            break
        case "教师职称":
            $("#currentTemplate").attr('href','operation4ManageA/downloadTemplate/?key=teacherTitle');
            $("#importKey").attr('value', 'teacherTitle')
            break
        case "学生类别":
            $("#currentTemplate").attr('href','operation4ManageA/downloadTemplate/?key=studentType');
            $("#importKey").attr('value', 'studentType')
            break
        case "项目类型":
            $("#currentTemplate").attr('href','operation4ManageA/downloadTemplate/?key=projectType');
            $("#importKey").attr('value', 'projectType')
            break
    }
}

function countManageA(title) {
    console.info("统计基础数据..." + title);

    showCurrent(title);

    var total = 0;
    switch (title) {
        case "项目列表":
            total = ajaxCalculate("operation4ManageA/count?key=project");
            break
        case "参与团队":
            total = ajaxCalculate("operation4ManageA/count?key=team");
            break
        case "所带学生":
            total = ajaxCalculate("operation4ManageA/count?key=student");
            break
    }
    return total;
}

function loadManageA(title, page, pageSize) {
    console.info("调入基础数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    console.info(params)
    switch (title) {
        case "项目列表":
            ajaxRun("operation4ManageA/list" + params + "&key=project", 0, "list" + title + "Div");
            break
        case "参与团队":
            ajaxRun("operation4ManageA/list" + params + "&key=team", 0, "list" + title + "Div");
            break
        case  "所带学生":
            ajaxRun("operation4ManageA/list" + params + "&key=student", 0, "list" + title + "Div");
            break
    }
    $.cookie("currentPage" + title, page);
}

