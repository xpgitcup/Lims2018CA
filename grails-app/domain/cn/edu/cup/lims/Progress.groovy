package cn.edu.cup.lims

class Progress {

    Project project
    Personnel contributor
    Date registrationTime
    String currentStatus
    String problemEncountered
    String relatedFileName
    Progress upProgress

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
