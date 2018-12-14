package cn.edu.cup.lims

import cn.edu.cup.common.DataExchangeInterface

class Teacher extends Person implements DataExchangeInterface {

    TeacherTitle title

    static hasMany = [students: Student]

    static constraints = {
    }

    @Override
    String[] dataSheetTitles() {
        def r = ["姓名", "工号", "职称"]
        return r
    }

    /*
    * 从数据表中导入
    * */

    @Override
    Map importFromDataSheet(dataSheet) {
        println("开始导入：${dataSheet}")
        def result = ""
        if (dataSheet.size() > 2) {
            def n = dataSheet[0]
            def c = dataSheet[1]
            def t = dataSheet[2]
            def tt = TeacherTitle.findByName(t)
            if (Teacher.findByCode(c)) {
                result += "${c} 重复了！"
            } else {
                if (tt) {
                    name = n
                    code = c
                    title = tt
                } else {
                    result += "${t} 职称找不到！"
                }
            }
        } else {
            result += "列数不够！"
        }
        def model = [teacher: this, result: result]
        return model
    }

    /*
    * 导出到数据表中
    * */

    @Override
    List exportToDataSheet() {
        return null
    }
}
