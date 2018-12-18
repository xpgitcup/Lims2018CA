package cn.edu.cup.lims

import cn.edu.cup.common.DataExchangeInterface

class Matter implements DataExchangeInterface {

    String name

    static constraints = {
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
