package cn.edu.cup.os4lims

import cn.edu.cup.lims.MatterType
import cn.edu.cup.lims.Person
import cn.edu.cup.lims.PersonTitle
import cn.edu.cup.system.JsFrame
import grails.converters.JSON
import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.CREATED

class Operation4BasicTypeController {

    def commonDataService
    def treeViewService

    def save() {
        println("save ${params}")

        try {
            commonDataService.saveInstance(params)
        } catch (ValidationException e) {
            flash.message = "出错了!"
        }

        redirect(action: "index")
    }

    def create() {
        def newInstance
        def view
        (view, newInstance) = commonDataService.createInstance(params)
        //println("view: ${view} ${newInstance}")
        if (request.xhr) {
            render(template: view, model: [newInstance: newInstance])
        } else {
            respond newInstance
        }
    }

    def getTreeviewData() {
        def treeviewData = commonDataService.getTreeviewData(params)
        println("树形数据：${treeviewData}")
        if (request.xhr) {
            render treeviewData as JSON
        } else {
            respond treeviewData
        }
    }

    def list() {
        def data = PersonTitle.findAllByUpTypeIsNull(params)
        println("查询---类型信息${data}")
        println("list ${result}")
        if (request.xhr) {
            render result as JSON
        } else {
            result
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

    def index() {}
}
