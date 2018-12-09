package cn.edu.cup.common

import grails.gorm.transactions.Transactional

@Transactional
class CommonDataService {

    /*
    * 获取对象的-数据模板-标题
    * */

    def dataSheetHead(Object object) {
        def h = []
        object.properties.each { e ->
            println("${e.metaClass}")
            h.add("${e.key}")
        }
        return h
    }

    /*
    * 导出数据
    * */

    def object2DataSheet(Object object) {
        def ds = []
        // 首先输出标题
        ds.add(dataSheetHead(object))
        // 然后输出数据
        def data = []
        object.class.fields.each { e ->
            data.add("${e}")
        }
        ds.add(data)
        return ds
    }
}
