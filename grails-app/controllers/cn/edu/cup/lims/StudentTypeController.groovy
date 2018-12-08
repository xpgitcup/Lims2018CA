package cn.edu.cup.lims

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class StudentTypeController {

    StudentTypeService studentTypeService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond studentTypeService.list(params), model:[studentTypeCount: studentTypeService.count()]
    }

    def show(Long id) {
        respond studentTypeService.get(id)
    }

    def create() {
        respond new StudentType(params)
    }

    def save(StudentType studentType) {
        if (studentType == null) {
            notFound()
            return
        }

        try {
            studentTypeService.save(studentType)
        } catch (ValidationException e) {
            respond studentType.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'studentType.label', default: 'StudentType'), studentType.id])
                redirect studentType
            }
            '*' { respond studentType, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond studentTypeService.get(id)
    }

    def update(StudentType studentType) {
        if (studentType == null) {
            notFound()
            return
        }

        try {
            studentTypeService.save(studentType)
        } catch (ValidationException e) {
            respond studentType.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'studentType.label', default: 'StudentType'), studentType.id])
                redirect studentType
            }
            '*'{ respond studentType, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        studentTypeService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'studentType.label', default: 'StudentType'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentType.label', default: 'StudentType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
