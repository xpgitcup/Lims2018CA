package cn.edu.cup.lims

class Thing extends Matter {

    ThingType thingType
    Date startDate = new Date()
    Double duration = 1

    static constraints = {
        name()
        thingType()
        startDate(nullable: true)
        duration(nullable: true)
    }

    static mapping = {
        sort('thingType')
    }
}
