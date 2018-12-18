package cn.edu.cup.lims

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class MatterTypeController {

    MatterTypeService matterTypeService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond matterTypeService.list(params), model:[matterTypeCount: matterTypeService.count()]
    }

    def show(Long id) {
        respond matterTypeService.get(id)
    }

    def create() {
        respond new MatterType(params)
    }

    def save(MatterType matterType) {
        if (matterType == null) {
            notFound()
            return
        }

        try {
            matterTypeService.save(matterType)
        } catch (ValidationException e) {
            respond matterType.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'matterType.label', default: 'MatterType'), matterType.id])
                redirect matterType
            }
            '*' { respond matterType, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond matterTypeService.get(id)
    }

    def update(MatterType matterType) {
        if (matterType == null) {
            notFound()
            return
        }

        try {
            matterTypeService.save(matterType)
        } catch (ValidationException e) {
            respond matterType.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'matterType.label', default: 'MatterType'), matterType.id])
                redirect matterType
            }
            '*'{ respond matterType, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        matterTypeService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'matterType.label', default: 'MatterType'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'matterType.label', default: 'MatterType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
