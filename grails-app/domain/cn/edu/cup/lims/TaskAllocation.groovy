package cn.edu.cup.lims

class TaskAllocation {

    String name
    PersonTitle personTitle
    ThingType thingType

    static constraints = {
    }

    String toString() {
        return "${name}"
    }

}
