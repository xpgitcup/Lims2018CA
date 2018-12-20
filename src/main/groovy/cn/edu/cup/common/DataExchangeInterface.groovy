package cn.edu.cup.common

interface DataExchangeInterface {

    List<String> dataSheetTitles()

    Map importFromDataSheet(dataSheet)

    List exportToDataSheet()
}