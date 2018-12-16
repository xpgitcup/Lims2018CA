package cn.edu.cup.lims

import cn.edu.cup.common.DataExchangeInterface

class Thing implements DataExchangeInterface{

    String name
    ThingType thingType
    Date startDate
    Date stopDate

    static hasMany = [team: Team]

    static constraints = {
        name(unique: true)
        thingType()
        startDate(nullable: true)
        stopDate(nullable: true)
    }

    String toString() {
        return name
    }

    @Override
    String[] dataSheetTitles() {
        return new String[0]
    }

    @Override
    Map importFromDataSheet(Object dataSheet) {
        return null
    }

    @Override
    List exportToDataSheet() {
        return null
    }
}
