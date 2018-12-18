package cn.edu.cup.lims

class Teacher extends Person{

    PersonTitle teacherTitle

    static hasMany = [students: Student]

    static constraints = {
        code(unique: true)
        name()
        teacherTitle()
    }

}
