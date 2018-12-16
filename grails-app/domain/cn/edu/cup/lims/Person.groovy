package cn.edu.cup.lims

class Person {

    String name
    String code

    static constraints = {
    }

    String toString() {
        return "${name}/${code}"
    }

    def personStatus() {
        return this.class.simpleName
    }
}
