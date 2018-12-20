var operation4BasicDataDiv;
var tabList4BasicData = ["教师", "学生", "项目","专业"];
var idList4BasicData = ["currentTeacher", "currentStudent", "currentMajor"];

$(function () {
    console.info("教师、学生、项目 信息维护...");
    operation4BasicDataDiv = $("#operation4BasicDataDiv");

    setupTabsWithDivAndPagination(operation4BasicDataDiv, tabList4BasicData);
    setupPaginationParams4TabPage(tabList4BasicData, countBasicData, loadBasicData);
    setupTabPageParams("operation4BasicDataDiv", loadBasicData);
    //tabPagesManagerA("operation4BasicDataDiv", tabList4BasicData, idList4BasicData, loadBasicData, countBasicData);

});

function createItem() {
    var title = getCurrentTabTitle(operation4BasicDataDiv);
    console.info("创建..." + title)
    switch (title) {
        case "教师":
            ajaxRun("operation4BasicData/create?key=teacher", 0, "list" + title + "Div");
            break
        case "学生":
            ajaxRun("operation4BasicData/create?key=student", 0, "list" + title + "Div");
            break
        case  "项目":
            ajaxRun("operation4BasicData/create?key=project", 0, "list" + title + "Div");
            break
        case "专业":
            ajaxRun("operation4BasicData/create?key=major", 0, "list" + title + "Div");
            break
    }
}

function countBasicData(title) {
    console.info("统计基础数据..." + title);
    var total = 0;
    switch (title) {
        case "教师":
            total = ajaxCalculate("operation4BasicData/count?key=teacher");
            break
        case "学生":
            total = ajaxCalculate("operation4BasicData/count?key=student");
            break
        case "项目":
            total = ajaxCalculate("operation4BasicData/count?key=project");
            break
        case "专业":
            total = ajaxCalculate("operation4BasicData/count?key=major");
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
            ajaxRun("operation4BasicData/list" + params + "&key=teacher", 0, "list" + title + "Div");
            break
        case "学生":
            currentKey = readCookie("currentKey" + "用户自定义功能", "0");
            ajaxRun("operation4BasicData/list" + params + "&key=student", 0, "list" + title + "Div");
            break
        case  "项目":
            ajaxRun("operation4BasicData/list" + params + "&key=project", 0, "list" + title + "Div");
            break
        case "专业":
            ajaxRun("operation4BasicData/list" + params + "&key=major", 0, "list" + title + "Div");
            break
    }
    $.cookie("currentPage" + title, page);
}
