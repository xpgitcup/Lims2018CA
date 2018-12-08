package cn.edu.cup.lims

class Personnel {

    String name
    String code

    static constraints = {
    }

    String toString() {
        return "${name}/${code}"
    }

}
