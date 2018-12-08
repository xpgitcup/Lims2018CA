package cn.edu.cup.lims

class Student extends Personnel {

    String gradeName    //年级
    StudentType studentType //
    Teacher supervisor  //导师

    static hasMany = [project: Project]

    static constraints = {
        gradeName()
        studentType()
        supervisor(nullable: true)
    }
}
