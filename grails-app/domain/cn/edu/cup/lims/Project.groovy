package cn.edu.cup.lims

import cn.edu.cup.common.DataExchangeInterface

class Project implements DataExchangeInterface{

    String name
    ProjectType projectType

    static hasMany = [participatingTeacher: Teacher, participatingStudent: Student]

    static constraints = {
        name(unique: true)
    }

    String toString() {
        return name
    }

    @Override
    String[] dataSheetTitles() {
        def head = ["名称","项目类型"]
        return head
    }

    @Override
    Map importFromDataSheet(Object dataSheet) {
        println("开始导入：${dataSheet}")
        def result = ""
        if (dataSheet.size() > 1) {
            def n = dataSheet[0]
            def t = dataSheet[1]
            def tt = ProjectType.findByName(t)
            if (cn.edu.cup.lims.Project.findByName(n)) {
                result += "${n} 重复了！"
            } else {
                if (tt) {
                    name = n
                    projectType = tt
                } else {
                    result += "${t} 类型找不到！"
                }
            }
        } else {
            result += "列数不够！"
        }
        def model = [project: this, result: result]
        return model
    }

    @Override
    List exportToDataSheet() {
        return null
    }
}
