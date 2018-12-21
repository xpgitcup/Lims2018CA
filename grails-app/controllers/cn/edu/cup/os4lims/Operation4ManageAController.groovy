package cn.edu.cup.os4lims

import cn.edu.cup.lims.TaskAllocation
import cn.edu.cup.lims.ThingType
import grails.converters.JSON
import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.CREATED

class Operation4ManageAController {

    def commonDataService
    def taskAllocationService

    def saveTaskAllocation(TaskAllocation taskAllocation) {
        if (taskAllocation == null) {
            notFound()
            return
        }

        try {
            taskAllocationService.save(taskAllocation)
            flash.message = "${taskAllocation}安排好了！"
        } catch (ValidationException e) {
            flash.message = taskAllocation.errors.toString()
        }

        redirect(action: "index")
    }

    def createTaskAllocation() {
        def thingType = ThingType.get(params.thingType)
        def taskAllocation = new TaskAllocation(
                thingType: thingType
        )
        def view = "createTaskAllocation"
        if (request.xhr) {
            render(template: view, model: [taskAllocation: taskAllocation])
        } else {
            respond objectList
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

    def index() { }
}
