package cn.edu.cup.lims

class ObjectType {

    String name

    static constraints = {
        name(unique: true)
    }

    String toString() {
        return name
    }
}
