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

/*
* 设置标签--分页--树形结构显示
* */
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

/*
* 设置标签--分页机制
* */
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

/*
* 设置树形结构显示的数据加载函数
* */
function setupDataExchangeTabsDiv4TreeView(tabsName, tabNameList, urlList) {
    // 当前页
    var defaultTab = tabNameList[0];
    var currentTab = readCookie("current" + tabsName, defaultTab);
    var tabsDiv = $("#" + tabsName);
    var treeviewUl

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

/*
* 设置树形结构显示的--翻页功能的相关参数
* */
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

/*
* 设置树形结构显示--节点选择的操作---点击某个节点后的动作
* */
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
* 设置 标签页的 翻页功能的相关参数
* */
function setupPaginationParams4TabPage(tabNameList, aCountFunction, aLoadFunction) {
    var title;
    var total = 0;
    var countFunction = eval(aCountFunction);
    var loadFunction = eval(aLoadFunction);
    var paginationDiv
    for (x in tabNameList) {
        title = tabNameList[x];
        total = countFunction(title)
        paginationDiv = $("#pagination" + title + "Div")
        paginationDiv.pagination({
            pageSize: pageSize,
            total: total,
            onSelectPage: function (pageNumber, pageSize) {
                loadFunction(title, pageNumber, pageSize);
            }
        })
    }
}

/*
* 设置标签控件的切换
* */
function setupTabPageParams(tabsName, aLoadFunction) {
    var tabsDiv = $("#" + tabsName);
    var loadFunction = eval(aLoadFunction);

    // 当前页
    var defaultTab = tabsDiv.tabs("tabs")[0].panel("options").title
    console.info("缺省标签标题：" + defaultTab);
    var currentTab = readCookie("current" + tabsName, defaultTab);

    tabsDiv.tabs({
        onSelect: function (title, index) {
            //记录tabs的缺省页面，所以采用tabsName
            console.info(tabsName + "--选择标签：" + title + "--" + index);
            $.cookie("current" + tabsName, title, {path: '/'});
            //------------------------------------------------------------------------------------------------------
            var pageNumber = readCookie("currentPage" + title, 1)
            loadFunction(title, pageNumber, pageSize)
        }
    })

    // 打开缺省的标签
    tabsDiv.tabs("select", currentTab);
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
