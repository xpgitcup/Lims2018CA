package cn.edu.cup.lims

class MatterType {

    String name
    MatterType upType

    static constraints = {
    }

    String toString() {
        return name
    }

    List path() {
        def p = []
        p.add(name)
        def u = upType
        while (u) {
            p.add(u.name)
            u = u.upType
        }
        return p
    }


}
