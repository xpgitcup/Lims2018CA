package cn.edu.cup.os4lims

import cn.edu.cup.lims.Person
import cn.edu.cup.lims.PersonTitle
import cn.edu.cup.lims.RelatedPersonAndProject
import cn.edu.cup.lims.Thing
import grails.converters.JSON

class Operation4ManageTeamAController {

    def commonLimsService
    def relatedPersonAndProjectService

    def selectIt(Thing thing) {
        def myself = Person.get(session.realId)
        if (myself) {
            def newRelation = new RelatedPersonAndProject(
                    person: myself,
                    thing: thing
            )
            relatedPersonAndProjectService.save(newRelation)
            flash.message = "${newRelation} 保存成功。"
        } else {
            flash.message = "当前用户不在人员名单中。"
        }
        redirect(action: "index")
    }

    def count() {
        def personTitle = PersonTitle.get(session.realTitle)
        params.personTitle = personTitle
        println("${params}")
        def count = 0
        params.relatedThingNames = relatedThingNames()
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
        params.relatedThingNames = relatedThingNames()
        def (String view, List<? extends GroovyObject> objectList) = commonLimsService.listObject(params)

        if (request.xhr) {
            render(template: view, model: [objectList: objectList])
        } else {
            respond objectList
        }
    }

    def index() { }

    private def relatedThingNames() {
        def relatedNames = []
        def myself = Person.get(session.realId)
        if (myself) {
            def related = RelatedPersonAndProject.findAllByPerson(myself)
            related.each { e -> relatedNames.add(e.thing.name) }
        }
        println("相关的: ${relatedNames}")
        return relatedNames
    }
}
