package cn.edu.cup.common

import cn.edu.cup.lims.Person
import cn.edu.cup.lims.PersonTitle
import cn.edu.cup.lims.RelatedPersonAndProject
import cn.edu.cup.lims.Student
import cn.edu.cup.lims.Teacher
import cn.edu.cup.lims.Team
import cn.edu.cup.lims.Thing
import grails.gorm.transactions.Transactional

@Transactional
class CommonLimsService {

    /*
    * 相关事情的类型
    * */

    def listObject(params) {
        def controller = params.controller
        def objectList
        switch (controller) {
            case "operation4ManageTeamA":
                objectList = listObject4ManageTeamA(params)
                break
        }
        return objectList
    }

    def listObject4ManageTeamA(params) {
        def view
        def objectList = []
        switch (params.key) {
            case "thing4Choice":
                def relatedThingNames = params.relatedThingNames
                params.sort = 'thingType'
                if (relatedThingNames) {
                    objectList = Thing.findAllByNameNotInList(relatedThingNames, params)
                } else {
                    params.sort = 'thingType'
                    objectList = Thing.list(params)
                }
                view = "listThing"
                break
            case "thingRelated":
                if (params.myself) {
                    objectList = RelatedPersonAndProject.findAllByPerson(params.myself, params)
                } else {
                    objectList = Thing.list(params)
                }
                view = "listRelatedThing"
                break;
            case "myTeam":
                if (params.myself) {
                    objectList = Team.findAllByLeader(params.myself, params)
                } else {
                    objectList = Team.list(params)
                }
                view = "listTeam"
                break
            case "call4Teacher":
                //println("招聘教师...")
                if (params.teamLeader) {
                    def team = Team.get(params.teamLeader)
                    //println("${team} 正在招聘")
                    def members = []
                    if (team) {
                        members.add(team.leader.id)
                        team.teachers.each { e -> members.add(e.id) }
                    }
                    objectList = Teacher.findAllByIdNotInList(members, params)
                } else {
                    objectList = Teacher.list(params)
                }
                view = "listCall4Teacher"
                break
            case "call4Student":
                //println("招聘本科生...")
                if (params.teamLeader) {
                    def team = Team.get(params.teamLeader)
                    //println("${team} 正在招聘")
                    def members = []
                    if (team) {
                        members.add(team.leader.id)
                        team.students.each { e -> members.add(e.id) }
                    }
                    def studentType = PersonTitle.get("本科")
                    objectList = Student.findAllByPersonTitleAndIdNotInList(studentType, members, params)
                } else {
                    objectList = Student.list(params)
                }
                view = "listCall4Student"
                break
        }
        return [view, objectList]
    }

    def countObject(params) {
        def controller = params.controller
        def count = 0
        switch (controller) {
            case "operation4ManageTeamA":
                count = countObject4ManageTeamA(params)
                break
        }
        return count
    }

    def countObject4ManageTeamA(params) {
        def key = params.key
        def count = 0
        switch (key) {
            case "thing4Choice":
                def relatedThingNames = params.relatedThingNames
                if (relatedThingNames) {
                    count = Thing.countByNameNotInList(relatedThingNames)
                } else {
                    count = Thing.count()
                }
                break;
            case "thingRelated":
                if (params.myself) {
                    count = RelatedPersonAndProject.countByPerson(params.myself)
                } else {
                    count = RelatedPersonAndProject.count()
                }
                break;
            case "leader":
                if (params.myself) {
                    count = Team.countByLeader(params.myself)
                } else {
                    count = Team.count()
                }
                break
        }
        return count
    }
}
