var operation4BasicTypeDiv;
var tabList4BasicType = ["人员身份", "事情分类"];
var idList4BasicType = ["currentPersonTitle", "currentThingType"];

/*
* 关键函数--初始化页面
* */
$(function () {
    console.info("教师、学生、项目 信息维护...");
    operation4BasicTypeDiv = $("#operation4BasicTypeDiv");
    tabPagesManagerB("operation4BasicTypeDiv", tabList4BasicType, loadBasicType, countBasicType);
});

function loadBasicType(title, page, pageSize) {
    console.info("调入基础数据..." + title);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    console.info(params)
    switch (title) {
        case "人员身份":
            break
        case "事情分类":
            break
    }
}

function countBasicType(title) {
    console.info("统计基础数据..." + title);
    showCurrent(title);
    var total = 0;
    switch (title) {
        case "人员身份":
            total = ajaxCalculate("operation4BasicType/count?key=personTitle");
            break
        case "事情分类":
            total = ajaxCalculate("operation4BasicType/count?key=thingType");
            break
    }
    return total;
}

function showCurrent(title) {

}