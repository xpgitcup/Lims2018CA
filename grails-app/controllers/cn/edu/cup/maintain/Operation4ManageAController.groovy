package cn.edu.cup.maintain

import cn.edu.cup.lims.Project
import cn.edu.cup.lims.Student
import cn.edu.cup.lims.Teacher
import cn.edu.cup.lims.TeacherTitle
import cn.edu.cup.lims.Team
import grails.converters.JSON

class Operation4ManageAController {

    def teamService
    def commonDataService

    def saveTeam(Team team) {
        teamService.save(team)
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
        println("${params}  ${session.realName}")

        def user = session.realName
        switch (user.class.simpleName) {
            case "Teacher":
                //newInstance.addToDirector(user)
                //user.addToTeam(newInstance)
                params.director = user
                break;
        }

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
