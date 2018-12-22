package cn.edu.cup.lims

class Person extends Matter{

    String code
    PersonTitle personTitle

    static constraints = {
        code(unique: true)
        name()
        personTitle()
    }

}


