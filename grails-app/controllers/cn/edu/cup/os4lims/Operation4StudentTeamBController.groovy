package cn.edu.cup.os4lims

import cn.edu.cup.lims.Person
import cn.edu.cup.lims.RelatedPersonAndProject
import cn.edu.cup.lims.Team
import cn.edu.cup.lims.Thing
import grails.converters.JSON

class Operation4StudentTeamBController {

    def commonLimsAService
    def cookieService
    def teamService
    def relatedPersonAndProjectService

    def selectAndCreateTeam(Thing thing) {
        def myself = Person.get(session.realId)
        println("${myself}开始组队...")
        if (myself) {
            if (Team.countByLeader(myself) < 1) {
                def team = new Team(
                        name: "${thing}.${myself}-小组",
                        thing: thing,
                        leader: myself,
                        createdDate: new Date()
                )
                teamService.save(team)
                flash.message = "组队成功！"
            } else {
                flash.message = "已经有了."
            }
        }
        redirect(action: "index")
    }

    def list() {
        //println("${params}")
        params.relatedThingNames = relatedThingNames()
        def myself = Person.get(session.realId)
        //println("当前用户: ${myself}")
        params.myself = myself
        def (String view, List<? extends GroovyObject> objectList) = commonLimsAService.list(params)
        if (request.xhr) {
            render(template: view, model: [objectList: objectList])
        } else {
            respond objectList
        }
    }

    def count() {
        def count = 0
        def myself = Person.get(session.realId)
        params.myself = myself
        params.relatedThingNames = relatedThingNames()
        count = commonLimsAService.count(params)
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    def index() {}

    /*
    * 人员与任务的对应关系---与当前人员相关的事情的列表
    * */

    private def relatedThingNames() {
        def relatedNames = []
        def myself = Person.get(session.realId)
        if (myself) {
            def related = RelatedPersonAndProject.findAllByPerson(myself)
            related.each { e -> relatedNames.add(e.thing.name) }
        }
        //println("相关的: ${relatedNames}")
        return relatedNames
    }

}
