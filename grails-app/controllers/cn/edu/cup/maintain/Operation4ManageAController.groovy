package cn.edu.cup.maintain

import cn.edu.cup.lims.Person
import cn.edu.cup.lims.Project
import cn.edu.cup.lims.Student
import cn.edu.cup.lims.Teacher
import cn.edu.cup.lims.TeacherTitle
import cn.edu.cup.lims.Team
import grails.converters.JSON
import grails.gorm.transactions.Transactional

@Transactional
class Operation4ManageAController {

    def teamService
    def teacherService
    def commonDataService

    def enlist(Team team) {
        println("${team} 招聘... 队长: ${team.leader}")
        def objectList = [:]
        def teachers = []
        def tt = Teacher.get(team.leader.id)
        if (tt) {
            teachers.add(tt)
        }
        team.members.each { e ->
            def t = Teacher.get(e.id)
            if (t) {
                teachers.add(t)
            }
        }
        objectList.put("members", teachers)

        def eteachers = []
        Teacher.list().each { e->
            if (!teachers.contains(e)) {
                eteachers.add(e)
            }
        }
        objectList.put("teachers", eteachers)

        def view = "enlist"
        if (request.xhr) {
            render(template: view, model: [team: team, objectList: objectList])
        } else {
            respond objectList
        }
    }

    def saveTeam(Team team) {
        if (Team.countByLeaderAndProject(team.leader, team.project) < 1) {
            teamService.save(team)
        } else {
            flash.message = "${team}有了！"
        }
        redirect(action: "index")
    }

    def list() {
        println("${params}")

        def view
        def objectList
        (view, objectList) = commonDataService.listObjectList(params)

        if (request.xhr) {
            render(template: view, model: [objectList: objectList])
        } else {
            respond objectList
        }
    }

    def count() {
        def count = 0
        count = commonDataService.countObject(params.key)
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    def create() {
        println("${params}  ${session.realName} 用户id ${session.readNameId}")

        if (session.realId) {
            def p = Person.get(session.realId)
            params.leader = p.id
            params.person = p
        }
        params.name = "项目_${params.project}.团队_${Team.count() + 1}"
        def newInstance
        def view
        (view, newInstance) = commonDataService.createInstance(params)

        if (request.xhr) {
            render(template: view, model: [newInstance: newInstance])
        } else {
            respond newInstance
        }
    }

    def index() {}
}
