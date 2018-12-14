package cn.edu.cup.lims

class Progress {

    Personnel contributor       //贡献者
    Date registrationTime       //时间
    String currentStatus        //当前状态
    String problemEncountered   //遇到问题
    String relatedFileName      //相关文件
    Progress upProgress

    static belongsTo = [project: Project]

    static constraints = {
        project()
        contributor()
        registrationTime()
        currentStatus()
        problemEncountered()
        relatedFileName()
        upProgress(nullable: true)
    }

    String toString() {
        return "${project}.${currentStatus}"
    }
}
