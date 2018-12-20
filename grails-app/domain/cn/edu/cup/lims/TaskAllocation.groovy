package cn.edu.cup.lims

class TaskAllocation {

    String name
    PersonTitle personTitle
    ThingType thingType
    String appendFilter

    static constraints = {
        name(unique: true)
        thingType()
        personTitle()
        appendFilter(nullable: true)
    }

    String toString() {
        return "${name}"
    }

}
