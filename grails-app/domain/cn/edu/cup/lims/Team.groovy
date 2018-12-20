package cn.edu.cup.lims

class Team {

    String name
    Person leader
    Thing thing         //针对某个项目创建
    Date createdDate    //应该是自动赋值

    static hasMany = [teachers: Teacher, students: Student]

    static constraints = {
        name(unique: true)
        leader()
        thing()
        createdDate(nullable: true)
    }

    String toString() {
        return name
    }

    def beforeInsert() {
        createdDate = new Date()
    }

}
