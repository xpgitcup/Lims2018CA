package cn.edu.cup.os4lims

import cn.edu.cup.lims.Person
import cn.edu.cup.lims.PersonTitle
import grails.converters.JSON

class Operation4ManageTeamAController {

    def commonLimsService

    def count() {
        def personTitle = PersonTitle.get(session.realTitle)
        params.personTitle = personTitle
        println("${params}")
        def count = 0
        count = commonLimsService.countObject(params)
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    def list() {
        def personTitle = PersonTitle.get(session.realTitle)
        params.personTitle = personTitle

        def (String view, List<? extends GroovyObject> objectList) = commonLimsService.listObject(params)

        if (request.xhr) {
            render(template: view, model: [objectList: objectList])
        } else {
            respond objectList
        }
    }

    def index() { }
}
