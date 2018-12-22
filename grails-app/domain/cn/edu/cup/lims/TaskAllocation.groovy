package cn.edu.cup.lims

class TaskAllocation {

    String name
    ThingType thingType
    String appendFilter

    static hasMany = [personTitles: PersonTitle]

    static constraints = {
        name(unique: true)
        thingType()
        appendFilter(nullable: true)
    }

    String toString() {
        return "${name}"
    }

}
