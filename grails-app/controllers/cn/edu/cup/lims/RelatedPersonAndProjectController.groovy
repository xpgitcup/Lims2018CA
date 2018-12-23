package cn.edu.cup.lims

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class RelatedPersonAndProjectController {

    RelatedPersonAndProjectService relatedPersonAndProjectService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond relatedPersonAndProjectService.list(params), model:[relatedPersonAndProjectCount: relatedPersonAndProjectService.count()]
    }

    def show(Long id) {
        respond relatedPersonAndProjectService.get(id)
    }

    def create() {
        respond new RelatedPersonAndProject(params)
    }

    def save(RelatedPersonAndProject relatedPersonAndProject) {
        if (relatedPersonAndProject == null) {
            notFound()
            return
        }

        try {
            relatedPersonAndProjectService.save(relatedPersonAndProject)
        } catch (ValidationException e) {
            respond relatedPersonAndProject.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'relatedPersonAndProject.label', default: 'RelatedPersonAndProject'), relatedPersonAndProject.id])
                redirect relatedPersonAndProject
            }
            '*' { respond relatedPersonAndProject, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond relatedPersonAndProjectService.get(id)
    }

    def update(RelatedPersonAndProject relatedPersonAndProject) {
        if (relatedPersonAndProject == null) {
            notFound()
            return
        }

        try {
            relatedPersonAndProjectService.save(relatedPersonAndProject)
        } catch (ValidationException e) {
            respond relatedPersonAndProject.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'relatedPersonAndProject.label', default: 'RelatedPersonAndProject'), relatedPersonAndProject.id])
                redirect relatedPersonAndProject
            }
            '*'{ respond relatedPersonAndProject, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        relatedPersonAndProjectService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'relatedPersonAndProject.label', default: 'RelatedPersonAndProject'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'relatedPersonAndProject.label', default: 'RelatedPersonAndProject'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
