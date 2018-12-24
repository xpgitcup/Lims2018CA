package cn.edu.cup.os4lims

import cn.edu.cup.lims.Person
import cn.edu.cup.lims.RelatedPersonAndProject
import cn.edu.cup.lims.Teacher
import cn.edu.cup.lims.Team
import cn.edu.cup.lims.Thing
import grails.converters.JSON

class Operation4ManageTeamAController {

    def commonLimsService
    def relatedPersonAndProjectService
    def teamService

    def enlistTeacher() {
        def team = Team.get(params.team)
        def teacher = Teacher.get(params.teacher)
        if (team && teacher) {
            team.teachers.add(teacher)
            teamService.save(team)
            flash.message = "成功招聘${teacher}."
        } else {
            flash.message = "信息不全！团队${team}, 教师：${teacher}"
        }
        redirect(action: "index")
    }

    def createTeam(RelatedPersonAndProject relatedPersonAndProject) {
        if (Team.countByThingAndLeader(relatedPersonAndProject.thing, relatedPersonAndProject.person) < 1) {
            def team = new Team(
                    name: "${relatedPersonAndProject}",
                    thing: relatedPersonAndProject.thing,
                    leader: relatedPersonAndProject.person,
                    createdDate: new Date()
            )
            teamService.save(team)
            flash.message = "恭喜队长!"
        } else {
            flash.message = "已经有了!"
        }
        redirect(action: "index")
    }

    def unselectIt(RelatedPersonAndProject relatedPersonAndProject) {
        def p = relatedPersonAndProject
        if (relatedPersonAndProject) {
            relatedPersonAndProjectService.delete(relatedPersonAndProject.id)
        } else {
            flash.message = "找不到！"
        }
        redirect(action: "index")
    }

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
        def count = 0
        def myself = Person.get(session.realId)
        params.myself = myself
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
        params.relatedThingNames = relatedThingNames()
        def myself = Person.get(session.realId)
        params.myself = myself
        def (String view, List<? extends GroovyObject> objectList) = commonLimsService.listObject(params)
        if (request.xhr) {
            render(template: view, model: [objectList: objectList])
        } else {
            respond objectList
        }
    }

    def index() {}

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
