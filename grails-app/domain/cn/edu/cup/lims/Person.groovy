package cn.edu.cup.lims

class Person extends Matter{

    String code

    static constraints = {
        code(unique: true)
        name()
    }

}


