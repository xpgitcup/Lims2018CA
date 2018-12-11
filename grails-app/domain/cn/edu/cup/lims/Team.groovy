package cn.edu.cup.lims

class Team {

    String name

    static belongsTo = [project: Project]   // 属于某个项目
    static hasMany = [teamMember: Student, director: Teacher]   // 队员，指导教师

    static constraints = {
        name(unique: true)
    }

    String toString() {
        return name
    }
}
