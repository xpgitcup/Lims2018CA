package cn.edu.cup.common

interface DataExchangeInterface {

    String[] dataSheetTitles()

    Map importFromDataSheet(dataSheet)

    List exportToDataSheet()
}