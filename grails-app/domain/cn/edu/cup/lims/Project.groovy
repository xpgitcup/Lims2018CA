package cn.edu.cup.lims

class Project extends Thing {

    String companyA

    static constraints = {
        name(unique: true)
        thingType()
        companyA(nullable: true)
        startDate(nullable: true)
        stopDate(nullable: true)
    }

    @Override
    String[] dataSheetTitles() {
        def head = ["名称", "甲方公司", "项目类型"]
        return head
    }

    @Override
    Map importFromDataSheet(Object dataSheet) {
        println("开始导入：${dataSheet}")
        def result = ""
        if (dataSheet.size() > 2) {
            def n = dataSheet[0]
            def c = dataSheet[1]
            def t = dataSheet[2]
            def tt = ThingType.findByName(t)
            if (cn.edu.cup.lims.Project.findByName(n)) {
                result += "${n} 重复了！"
            } else {
                if (tt) {
                    name = n
                    companyA = c
                    thingType = tt
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
