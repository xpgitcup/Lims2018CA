package cn.edu.cup.lims

class Course extends Project{

    String gradeList
    static hasMany = [studentTypes: StudentType]    //那些学生可以选

    static constraints = {
        name(unique: true)
        gradeList(nullable: true)
        startDate(nullable: true)
        stopDate(nullable: true)
    }

}
