package cn.edu.cup.lims

class Progress {

    Thing thing
    Person contributor   //贡献者
    Date recordDate   //时间
    String currentStatus    //当前状态
    String problemEncountered   //遇到问题
    String relatedFileName      //相关文件
    Progress upProgress

    static constraints = {
        thing()
        contributor()
        recordDate(nullable: true)
        currentStatus()
        problemEncountered(nullable: true)
        relatedFileName(nullable: true)
        upProgress(nullable: true)
    }

    String toString() {
        return "${thing}.${recordDate}"
    }

    def beforeInsert() {
        recordDate = new Date()
    }
}
