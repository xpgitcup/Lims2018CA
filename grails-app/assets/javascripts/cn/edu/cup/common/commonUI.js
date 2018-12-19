/**
 * Created by LiXiaoping on 2018/8/25.
 */

var pageSize = 10

function getCurrentTabTitle(tabsDiv) {
    var tab = getCurrentTab(tabsDiv)
    return tab.panel("options").title;
}

function getCurrentTab(tabsDiv) {
    var tab = tabsDiv.tabs('getSelected');
    return tab;
}

/*
* 说明：
*     listFunction -- 数据列表函数，用户自定义的
*     countFunction --- 数据统计函数，用户自定义
*     tabNameList --- 标签页的标题数组
*     idList ---- 对应的一系列div指示的id -- 这些div不一定存在 --- 这是一个可能的bug
* */

function addNewPaginationDiv(title, tab) {
//分页Div------加入到标签中
    var paginationDiv = $('<div class="easyui-pagination"></div>');
    paginationDiv.attr('id', 'pagination' + title + 'Div');
    paginationDiv.appendTo(tab)
    return paginationDiv;
}

function addNewTreeView(title, listDiv) {
//树形显示页面
    var treeViewUl = $('<ul class="easyui-tree"></ul>');
    treeViewUl.attr('id', 'treeView' + title + 'Ul');
    treeViewUl.appendTo(listDiv)
    return treeViewUl;
}

function addNewListDiv(title, tab) {
    //显示页面
    var listDiv = $('<div></div>');
    listDiv.attr('id', 'list' + title + 'Div');
    listDiv.appendTo(tab)
    return listDiv;
}

function setupTabsWithDivAndPaginationAndTreeview(tabsDiv, tabNameList) {
    for (x in tabNameList) {
        console.info("创建：" + x);
        var title = tabNameList[x];

        tabsDiv.tabs('add', {
            title: title,
            closable: false
        })

        //插入到tab中
        tabsDiv.tabs('select', x)
        var tab = tabsDiv.tabs('getSelected');

        var listDiv = addNewListDiv(title, tab);
        var treeViewUl = addNewTreeView(title, listDiv);
        var paginationDiv = addNewPaginationDiv(title, tab);
    }
}

function setupTabsWithDivAndPagination(tabsDiv, tabNameList) {
    for (x in tabNameList) {
        console.info("创建：" + x);
        var title = tabNameList[x];

        tabsDiv.tabs('add', {
            title: title,
            closable: false
        })

        //插入到tab中
        tabsDiv.tabs('select', x)
        var tab = tabsDiv.tabs('getSelected');
        var listDiv = addNewListDiv(title, tab);
        var paginationDiv = addNewPaginationDiv(title, tab);
    }
}

function setupTabsDivParams4TreeView(tabsName, tabNameList, urlList) {
    // 当前页
    var defaultTab = tabNameList[0];
    var currentTab = readCookie("current" + tabsName, defaultTab);
    var tabsDiv = $("#" + tabsName);
    var treeviewDiv

    // 设置标签管理函数
    tabsDiv.tabs({
            onSelect: function (title, index) {
                //记录tabs的缺省页面，所以采用tabsName
                console.info(tabsName + "--选择标签：" + title + "--" + index);
                $.cookie("current" + tabsName, title, {path: '/'});
                //------------------------------------------------------------------------------------------------------
                console.info("调入数据：" + title)
                treeViewUl = $("#treeView" + title + "Ul")
                console.info(treeViewUl)
                console.info(urlList[index])
                treeViewUl.tree({url: urlList[index]})
            }
        }
    );

    // 打开缺省的标签
    tabsDiv.tabs("select", currentTab);
    //loadFirstData(currentTab, listFunction);
}

function setupPaginationParams4TreeView(tabNameList, aCountFunction, urlList) {
    var title
    var total = 0
    var countFunction = eval(aCountFunction)
    var paginationDiv
    var treeViewUl
    for (x in tabNameList) {
        title = tabNameList[x];
        total = countFunction(title)
        paginationDiv = $("#pagination" + title + "Div")
        treeViewUl = $("#treeView" + title + "Div")
        paginationDiv.pagination({
            pageSize: pageSize,
            total: total,
            onSelectPage: function (pageName, pageSize) {
                treeViewUl.tree({url: urlList[x]})
            }
        })
    }
}

function setupTreeviewNodeSelectFunction(tabNameList, doSomeThing) {
    console.info("设置树形结构节点选择动作...")
    var title
    var afunction = eval(doSomeThing)
    var treeViewUl
    for (x in tabNameList) {
        title = tabNameList[x];
        treeViewUl = $("#treeView" + title + "Ul")
        treeViewUl.tree({
            onSelect: function (node) {
                console.info("选择了：" + node)
                doSomeThing(node)
            }
        })
    }
}

/*
* 整体管理函数==========================================================================================================
* */

/*
* 通用的tab页管理函数---包括翻页控制 ---- 取消当前标志控制---因为不合理
* */
function tabPagesManagerWithTreeViewA(tabsName, tabNameList, listFunction, countFunction) {

    // 初始设置
    var defaultTab = tabNameList[0];
    var currentTab = readCookie("current" + tabsName, defaultTab);
    var tabsDiv = $("#" + tabsName);

    var countFunction = eval(countFunction);
    var listFunction = eval(listFunction);

    //动态创建各个标签页
    console.info(tabNameList);
    var paginationDiv = createTabpageAndTreeView4Tabs(tabNameList, tabsDiv, countFunction);

    // 设置标签管理函数
    tabsDiv.tabs({
            onSelect: function (title, index) {
                //记录tabs的缺省页面，所以采用tabsName
                console.info(tabsName + "--选择标签：" + title + "--" + index);
                $.cookie("current" + tabsName, title, {path: '/'});
                //------------------------------------------------------------------------------------------------------
                //loadFirstData(title, listFunction);
                $("#tree" + title + "Ul").tree({url: loadFirstData(title, listFunction)})
                setupPaginationDiv(paginationDiv, title, countFunction);      //切换到某一页的时候，需要更新分页机制。
            }
        }
    );

    // 打开缺省的标签
    tabsDiv.tabs("select", currentTab);
    loadFirstData(currentTab, listFunction);
}

/*
* 通用的tab页管理函数---包括翻页控制 ---- 取消当前标志控制---因为不合理
* */
function tabPagesManagerB(tabsName, tabNameList, listFunction, countFunction) {

    // 初始设置
    var defaultTab = tabNameList[0];
    var currentTab = readCookie("current" + tabsName, defaultTab);
    var tabsDiv = $("#" + tabsName);

    var countFunction = eval(countFunction);
    var listFunction = eval(listFunction);

    //动态创建各个标签页
    console.info(tabNameList);

    // 创建各个标签页
    for (x in tabNameList) {
        console.info("创建：" + x);
        var title = tabNameList[x];

        tabsDiv.tabs('add', {
            title: title,
            closable: false
        })

        //插入到tab中
        tabsDiv.tabs('select', x)
        var tab = tabsDiv.tabs('getSelected');
        //显示页面
        var listDiv = $('<div>' + title + '</div>');
        listDiv.attr('id', 'list' + title + 'Div');
        listDiv.appendTo(tab)
        //分页Div
        var paginationDiv = $('<div class="easyui-pagination"></div>');
        paginationDiv.attr('id', 'pagination' + title + 'Div');
        paginationDiv.appendTo(tab)
        var __ret = setupPaginationDiv(paginationDiv, title);
        var total = __ret.total;
        var currentPage = __ret.currentPage;
    }

    // 设置标签管理函数
    tabsDiv.tabs({
            onSelect: function (title, index) {
                //记录tabs的缺省页面，所以采用tabsName
                console.info(tabsName + "--选择标签：" + title + "--" + index);
                $.cookie("current" + tabsName, title, {path: '/'});
                //------------------------------------------------------------------------------------------------------
                loadFirstData(title, listFunction);
                setupPaginationDiv(paginationDiv, title);      //切换到某一页的时候，需要更新分页机制。
            }
        }
    );

    // 打开缺省的标签
    tabsDiv.tabs("select", currentTab);
    loadFirstData(currentTab, listFunction);
}


/*
* 通用的tab页管理函数---包括翻页控制--包括当前记录指示
* */
function tabPagesManagerA(tabsName, tabNameList, idList, listFunction, countFunction) {

    // 初始设置
    var defaultTab = tabNameList[0];
    var currentTab = readCookie("current" + tabsName, defaultTab);
    var tabsDiv = $("#" + tabsName);

    var countFunction = eval(countFunction);
    var listFunction = eval(listFunction);

    //动态创建各个标签页
    console.info(tabNameList);
    var paginationDiv = createTabsDivA(tabNameList, tabsDiv);

    // 设置标签管理函数
    tabsDiv.tabs({
            onSelect: function (title, index) {
                //记录tabs的缺省页面，所以采用tabsName
                console.info(tabsName + "--选择标签：" + title + "--" + index);
                $.cookie("current" + tabsName, title, {path: '/'});
                //------------------------------------------------------------------------------------------------------
                loadFirstData(title, listFunction);
                setupPaginationDiv(paginationDiv, title);      //切换到某一页的时候，需要更新分页机制。
                //------------------------------------------------------------------------------------------------------
                var id = readCookie("currentKey" + title, "0")
                $("#" + idList[index]).html(id)                 // 只是切换到这一页的时候，是不够的！！
            }
        }
    );

    // 打开缺省的标签
    tabsDiv.tabs("select", currentTab);
    loadFirstData(currentTab, listFunction);
}

function tabPagesManagerWithPagination(tabsName, tabNameList, listFunction, countFunction) {

    // 初始设置
    var defaultTab = tabNameList[0];
    var currentTab = readCookie("current" + tabsName, defaultTab);
    var tabsDiv = $("#" + tabsName);

    var countFunction = eval(countFunction);
    var listFunction = eval(listFunction);

    //动态创建各个标签页
    console.info(tabNameList);
    var paginationDiv = createTabs4Div(tabNameList, tabsDiv);

    // 设置标签管理函数
    tabsDiv.tabs({
            onSelect: function (title, index) {
                //记录tabs的缺省页面，所以采用tabsName
                console.info(tabsName + "--选择标签：" + title + "--" + index);
                $.cookie("current" + tabsName, title, {path: '/'});
                //------------------------------------------------------------------------------------------------------
                loadFirstData(title, listFunction);
                setupPaginationDiv(paginationDiv, title);      //切换到某一页的时候，需要更新分页机制。
            }
        }
    );

    // 打开缺省的标签
    tabsDiv.tabs("select", currentTab);
    loadFirstData(currentTab, listFunction);
}

/*
* 通用的tab页管理函数---不包括翻页控制
* */

function tabPagesManager(tabsName, tabNameList, listFunction) {
    // 初始设置
    var defaultTab = tabNameList[0];
    var currentTab = readCookie("current" + tabsName, defaultTab);
    var tabsDiv = $("#" + tabsName);

    // 设置标签管理函数
    tabsDiv.tabs({
            onSelect: function (title, index) {
                //记录tabs的缺省页面，所以采用tabsName
                console.info(tabsName + "--选择标签：" + title + "--" + index);
                $.cookie("current" + tabsName, title, {path: '/'});
                //------------------------------------------------------------------------------------------------------
                loadFirstData(title, listFunction);
            }
        }
    );

    // 打开缺省的标签
    tabsDiv.tabs("select", currentTab);
    loadFirstData(currentTab, listFunction);
}

/*
* 基础函数==============================================================================================================
* */

function createTabpageAndTreeView4Tabs(tabNameList, tabsDiv, listFunction, countFunction) {
// 创建各个标签页
    for (x in tabNameList) {
        console.info("创建：" + x);
        var title = tabNameList[x];

        tabsDiv.tabs('add', {
            title: title,
            closable: false
        })

        //插入到tab中
        tabsDiv.tabs('select', x)
        var tab = tabsDiv.tabs('getSelected');
        //显示页面
        var listDiv = $('<div>' + title + '</div>');
        listDiv.attr('id', 'list' + title + 'Div');
        listDiv.appendTo(tab)

        //设置树型显示
        var treeUl = $('<ul class="easyui-tree"></ul>');
        treeUl.attr('id', 'tree' + title + 'Ul');
        treeUl.appendTo(listDiv)

        //分页Div
        var paginationDiv = $('<div class="easyui-pagination"></div>');
        paginationDiv.attr('id', 'pagination' + title + 'Div');
        paginationDiv.appendTo(tab)
        var __ret = setupPaginationDiv(paginationDiv, title, listFunction, countFunction);
        var total = __ret.total;
        var currentPage = __ret.currentPage;
    }
    return paginationDiv;
}

function createTabsDivA(tabNameList, tabsDiv) {
// 创建各个标签页
    for (x in tabNameList) {
        console.info("创建：" + x);
        var title = tabNameList[x];

        tabsDiv.tabs('add', {
            title: title,
            closable: false
        })

        //插入到tab中
        tabsDiv.tabs('select', x)
        var tab = tabsDiv.tabs('getSelected');
        //显示页面
        var listDiv = $('<div>' + title + '</div>');
        listDiv.attr('id', 'list' + title + 'Div');
        listDiv.appendTo(tab)
        //分页Div
        var paginationDiv = $('<div class="easyui-pagination"></div>');
        paginationDiv.attr('id', 'pagination' + title + 'Div');
        paginationDiv.appendTo(tab)
        var __ret = setupPaginationDiv(paginationDiv, title);
        var total = __ret.total;
        var currentPage = __ret.currentPage;
    }
    return paginationDiv;
}

/*
* 创建tab标签
* */
function createTabs4Div(tabNameList, tabsDiv) {
// 创建各个标签页
    for (x in tabNameList) {
        console.info("创建：" + x);
        var title = tabNameList[x];

        tabsDiv.tabs('add', {
            title: title,
            closable: false
        })

        //插入到tab中
        tabsDiv.tabs('select', x)
        var tab = tabsDiv.tabs('getSelected');
        //显示页面--加入到标签中---这里设置成树型显示
        //显示页面
        var listDiv = $('<div>' + title + '</div>');
        listDiv.attr('id', 'list' + title + 'Div');
        listDiv.appendTo(tab)

        //分页Div------加入到标签中
        var paginationDiv = $('<div class="easyui-pagination"></div>');
        paginationDiv.attr('id', 'pagination' + title + 'Div');
        paginationDiv.appendTo(tab)
        var __ret = setupPaginationDiv(paginationDiv, title);
        var total = __ret.total;
        var currentPage = __ret.currentPage;
    }
    return paginationDiv;
}


function loadFirstData(title, listFunction) {
    console.info("第一次加载tab...");
    var page = readCookie("currentPage" + title, 1);
    console.info("当前：" + title + "   -->页码：" + page);
    var listFunction = eval(listFunction);
    listFunction(title, page, pageSize);
}

/*
* 加载页面的数据
* */
function loadTabPageDefaultData(title, listFunction, countFunction) {
    console.info("加载缺省页面数据...");

    var countFunction = eval(countFunction);
    var listFunction = eval(listFunction);

    //首先获取缺省的页面，获取页大小，获取总数
    var currentPage = readCookie("currentPage" + title, 1);
    var cpageSize = readCookie("pageSize" + title, pageSize);
    var totalCount = countFunction(title);
    console.info("当前页：" + title + ":" + currentPage + "总数：" + totalCount);
    listFunction(title, currentPage, cpageSize)
}


/*
* 抽象出来的设置分页的代码
* */
function setupPaginationDiv(paginationDiv, title, listFunction, countFunction) {
    console.info("设置分页处理代码..." + title);
    var countFunction = eval(countFunction);
    var listFunction = eval(listFunction);
    //分页设置
    var total = countFunction(title)
    var currentPage = readCookie("currentPage" + title, 1);
    paginationDiv.pagination({
        pagesize: pageSize,
        total: total,
        pageNumber: currentPage,  // 这一参数很关键啊-- 不是当前页面的意思。-- 创建分页（pagination）时显示的页码。
        onSelectPage: function (pageNumber, pageSize) {
            var ct = tabsDiv.tabs('getSelected').panel('options').title;    //这一句是关键啊
            console.info("翻页：" + ct + "页码：" + pageNumber);
            listFunction(ct, pageNumber, pageSize)
        }
    })
    console.info("当前页：" + currentPage + ",   总数：" + total);
    return {total: total, currentPage: currentPage};
}
