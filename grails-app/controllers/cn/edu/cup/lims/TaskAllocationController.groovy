package cn.edu.cup.lims

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class TaskAllocationController {

    TaskAllocationService taskAllocationService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond taskAllocationService.list(params), model:[taskAllocationCount: taskAllocationService.count()]
    }

    def show(Long id) {
        respond taskAllocationService.get(id)
    }

    def create() {
        respond new TaskAllocation(params)
    }

    def save(TaskAllocation taskAllocation) {
        if (taskAllocation == null) {
            notFound()
            return
        }

        try {
            taskAllocationService.save(taskAllocation)
        } catch (ValidationException e) {
            respond taskAllocation.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'taskAllocation.label', default: 'TaskAllocation'), taskAllocation.id])
                redirect taskAllocation
            }
            '*' { respond taskAllocation, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond taskAllocationService.get(id)
    }

    def update(TaskAllocation taskAllocation) {
        if (taskAllocation == null) {
            notFound()
            return
        }

        try {
            taskAllocationService.save(taskAllocation)
        } catch (ValidationException e) {
            respond taskAllocation.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'taskAllocation.label', default: 'TaskAllocation'), taskAllocation.id])
                redirect taskAllocation
            }
            '*'{ respond taskAllocation, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        taskAllocationService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'taskAllocation.label', default: 'TaskAllocation'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'taskAllocation.label', default: 'TaskAllocation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
