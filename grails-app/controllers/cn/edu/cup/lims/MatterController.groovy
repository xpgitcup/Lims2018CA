package cn.edu.cup.lims

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class MatterController {

    MatterService matterService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond matterService.list(params), model:[matterCount: matterService.count()]
    }

    def show(Long id) {
        respond matterService.get(id)
    }

    def create() {
        respond new Matter(params)
    }

    def save(Matter matter) {
        if (matter == null) {
            notFound()
            return
        }

        try {
            matterService.save(matter)
        } catch (ValidationException e) {
            respond matter.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'matter.label', default: 'Matter'), matter.id])
                redirect matter
            }
            '*' { respond matter, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond matterService.get(id)
    }

    def update(Matter matter) {
        if (matter == null) {
            notFound()
            return
        }

        try {
            matterService.save(matter)
        } catch (ValidationException e) {
            respond matter.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'matter.label', default: 'Matter'), matter.id])
                redirect matter
            }
            '*'{ respond matter, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        matterService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'matter.label', default: 'Matter'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'matter.label', default: 'Matter'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
