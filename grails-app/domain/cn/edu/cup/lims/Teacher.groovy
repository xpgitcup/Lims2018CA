package cn.edu.cup.lims

class Teacher extends Personnel{

    TeacherTitle title

    static hasMany = [student: Student, project: Project]

    static constraints = {
    }

    String toString() {
        return super.toString() + ",${title}"
    }
}
