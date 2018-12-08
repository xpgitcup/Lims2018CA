package cn.edu.cup.lims

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class TeacherTitleController {

    TeacherTitleService teacherTitleService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond teacherTitleService.list(params), model:[teacherTitleCount: teacherTitleService.count()]
    }

    def show(Long id) {
        respond teacherTitleService.get(id)
    }

    def create() {
        respond new TeacherTitle(params)
    }

    def save(TeacherTitle teacherTitle) {
        if (teacherTitle == null) {
            notFound()
            return
        }

        try {
            teacherTitleService.save(teacherTitle)
        } catch (ValidationException e) {
            respond teacherTitle.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'teacherTitle.label', default: 'TeacherTitle'), teacherTitle.id])
                redirect teacherTitle
            }
            '*' { respond teacherTitle, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond teacherTitleService.get(id)
    }

    def update(TeacherTitle teacherTitle) {
        if (teacherTitle == null) {
            notFound()
            return
        }

        try {
            teacherTitleService.save(teacherTitle)
        } catch (ValidationException e) {
            respond teacherTitle.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'teacherTitle.label', default: 'TeacherTitle'), teacherTitle.id])
                redirect teacherTitle
            }
            '*'{ respond teacherTitle, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        teacherTitleService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'teacherTitle.label', default: 'TeacherTitle'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'teacherTitle.label', default: 'TeacherTitle'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
