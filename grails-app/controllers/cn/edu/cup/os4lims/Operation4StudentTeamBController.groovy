package cn.edu.cup.os4lims

import cn.edu.cup.lims.Person
import cn.edu.cup.lims.RelatedPersonAndProject
import cn.edu.cup.lims.Student
import cn.edu.cup.lims.Team
import cn.edu.cup.lims.Thing
import grails.converters.JSON

class Operation4StudentTeamBController {

    def commonLimsAService
    def cookieService
    def teamService
    def relatedPersonAndProjectService

    def disband(Team team) {
        teamService.delete(team.id)
        redirect(action: "index")
    }

    def enlistStudent() {
        println("${params} ....")
        def team = Team.get(params.team)
        if (team) {
            def student = Student.findByName(params.name)
            if (student && (!team.isMember(student))) {
                team.students.add(student)
                teamService.save(team)
                flash.message = "招募${student}."
            } else {
                println("找不到人...")
            }
        } else {
            println("找不到团队...")
        }
        redirect(action: "index")
    }

    def selectAndCreateTeam(Thing thing) {
        def myself = Person.get(session.realId)
        println("${myself}开始组队...${thing} - ${thing.id}")
        if (myself) {
            if (Team.countByLeaderAndThing(myself, thing) < 1) {
                def team = new Team(
                        name: "${thing}.${myself}-小组",
                        thing: thing,
                        leader: myself,
                        createdDate: new Date()
                )
                teamService.save(team)
                flash.message = "组队成功！"
                println("${thing.id} -- 团队创建成功...")
            } else {
                println("${thing.id} -- 团队重复...")
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
        def (view, objectList) = commonLimsAService.list(params)
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
