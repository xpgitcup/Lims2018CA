var operation4ManageADiv;
var tabList4BasicData = ["教师", "学生", "项目","教师职称","学生类别","项目类型"];
var idList4BasicData = ["currentTeacher", "currentStudent", "currentProject"];

$(function () {
    console.info("教师、学生、项目 信息维护...");

    operation4ManageADiv = $("#operation4ManageADiv");

    tabPagesManagerA("operation4ManageADiv", tabList4BasicData, idList4BasicData, loadBasicData, countBasicData);

});

function createItem() {
    var title = $("#currentTitle").html()
    console.info("创建..." + title)
    switch (title) {
        case "教师":
            ajaxRun("operation4ManageA/create?key=teacher", 0, "list" + title + "Div");
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
    var tab = operation4BasicDataDiv.tabs('getSelected');
    var index = operation4BasicDataDiv.tabs('getTabIndex', tab);
    var currentKey = tabList4BasicData[index]
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

function countBasicData(title) {
    console.info("统计基础数据..." + title);

    showCurrent(title);

    var total = 0;
    switch (title) {
        case "教师":
            total = ajaxCalculate("operation4ManageA/count?key=teacher");
            break
        case "学生":
            total = ajaxCalculate("operation4ManageA/count?key=student");
            break
        case "项目":
            total = ajaxCalculate("operation4ManageA/count?key=project");
            break
        case "教师职称":
            total = ajaxCalculate("operation4ManageA/count?key=teacherTitle");
            break
        case "学生类别":
            total = ajaxCalculate("operation4ManageA/count?key=studentType");
            break
        case "项目类型":
            total = ajaxCalculate("operation4ManageA/count?key=projectType");
            break
    }
    return total;
}

function loadBasicData(title, page, pageSize) {
    console.info("调入基础数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    console.info(params)
    switch (title) {
        case "教师":
            ajaxRun("operation4ManageA/list" + params + "&key=teacher", 0, "list" + title + "Div");
            break
        case "学生":
            currentKey = readCookie("currentKey" + "用户自定义功能", "0");
            ajaxRun("operation4ManageA/list" + params + "&key=student", 0, "list" + title + "Div");
            break
        case  "项目":
            ajaxRun("operation4ManageA/list" + params + "&key=project", 0, "list" + title + "Div");
            break
        case "教师职称":
            ajaxRun("operation4ManageA/list" + params + "&key=teacherTitle", 0, "list" + title + "Div");
            break
        case "学生类别":
            ajaxRun("operation4ManageA/list" + params + "&key=studentType", 0, "list" + title + "Div");
            break
        case "项目类型":
            ajaxRun("operation4ManageA/list" + params + "&key=projectType", 0, "list" + title + "Div");
            break
    }
    $.cookie("currentPage" + title, page);
}

