package cn.edu.cup.os4lims

import grails.converters.JSON
import grails.validation.ValidationException

class Operation4BasicDataController {

    def commonDataService

    def save() {
        println("${params}")
        try {
            commonDataService.saveInstance(params)
        } catch (ValidationException e) {
            flash.message = "出错了!" + e.message
        }
        redirect(action: "index")
    }

    def create() {
        println("createDataItem ${params}")
        // 缺省的情况
        def newInstance
        def view
        def options
        (view, newInstance, options) = commonDataService.createInstance(params)

        if (request.xhr) {
            render(template: view, model: [newInstance: newInstance, options: options])
        } else {
            respond newInstance
        }
    }

    def count() {
        def count = 0
        count = commonDataService.countObject(params)
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    def list() {
        println("${params}")
        def (String view, List<? extends GroovyObject> objectList) = commonDataService.listObjectList(params)

        if (request.xhr) {
            render(template: view, model: [objectList: objectList])
        } else {
            respond objectList
        }
    }

    def index() {}
}
