package cn.edu.cup.lims

class Project {

    String name
    ProjectType projectType

    static hasMany = [participatingTeacher: Teacher, participatingStudent: Student]

    static constraints = {
        name(unique: true)
    }

    String toString() {
        return name
    }
}
