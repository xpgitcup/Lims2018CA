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
    List<String> dataSheetTitles() {
        return null
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
