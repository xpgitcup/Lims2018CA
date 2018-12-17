package cn.edu.cup.lims

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ProjectTypeController {

    ProjectTypeService projectTypeService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond projectTypeService.list(params), model:[projectTypeCount: projectTypeService.count()]
    }

    def show(Long id) {
        respond projectTypeService.get(id)
    }

    def create() {
        respond new ProjectType(params)
    }

    def save(ProjectType projectType) {
        if (projectType == null) {
            notFound()
            return
        }

        try {
            projectTypeService.save(projectType)
        } catch (ValidationException e) {
            respond projectType.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'projectType.label', default: 'ProjectType'), projectType.id])
                redirect projectType
            }
            '*' { respond projectType, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond projectTypeService.get(id)
    }

    def update(ProjectType projectType) {
        if (projectType == null) {
            notFound()
            return
        }

        try {
            projectTypeService.save(projectType)
        } catch (ValidationException e) {
            respond projectType.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'projectType.label', default: 'ProjectType'), projectType.id])
                redirect projectType
            }
            '*'{ respond projectType, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        projectTypeService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectType.label', default: 'ProjectType'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectType.label', default: 'ProjectType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
