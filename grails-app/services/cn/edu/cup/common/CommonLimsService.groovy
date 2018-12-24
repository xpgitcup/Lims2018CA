package cn.edu.cup.common

import cn.edu.cup.lims.Person
import cn.edu.cup.lims.PersonTitle
import cn.edu.cup.lims.RelatedPersonAndProject
import cn.edu.cup.lims.Student
import cn.edu.cup.lims.Teacher
import cn.edu.cup.lims.Team
import cn.edu.cup.lims.Thing
import cn.edu.cup.lims.ThingType
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
            case "operation4StudentTeamA":
                objectList = listObject4ManageTeamA(params)
                break;
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
            case "thing4ChoiceStudent":
                def relatedThingNames = params.relatedThingNames
                params.sort = 'thingType'
                def studentThing = ThingType.findByName("教学任务")
                if (relatedThingNames) {
                    println("只统计 ${studentThing}")
                    objectList = Thing.findAllByThingTypeAndNameNotInList(studentThing, relatedThingNames, params)
                } else {
                    objectList = Thing.findAllByThingType(studentThing, params)
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
                println("招聘本科生...")
                if (params.teamLeader) {
                    def team = Team.get(params.teamLeader)
                    println("${team} 正在招聘")
                    def members = []
                    if (team) {
                        members.add(team.leader.id)
                        team.students.each { e -> members.add(e.id) }
                    }
                    def studentType = PersonTitle.findByName("本科")
                    println("只要${studentType}")
                    objectList = Student.findAllByPersonTitleAndIdNotInList(studentType, members, params)
                } else {
                    objectList = Student.list(params)
                }
                view = "listCall4Student"
                break
            case "teamJoinStudent":
                def student = params.myself
                def thing = Thing.get(params.thing)
                if (thing && student) {
                    objectList = Team.findAllByThingAndLeaderNotEqual(thing, student, params)
                } else {
                    println("参数不全：${thing}, ${student}")
                }
                view = "listTeam"
                break;
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
            case "operation4StudentTeamA":
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
            case "thing4ChoiceStudent":
                def relatedThingNames = params.relatedThingNames
                def studentThing = ThingType.findByName("教学任务")
                if (relatedThingNames) {
                    count = Thing.countByThingTypeAndNameNotInList(studentThing, relatedThingNames)
                } else {
                    count = Thing.countByThingType(studentThing)
                }
                break
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
            case "call4Student":
                println("招聘本科生...")
                if (params.teamLeader) {
                    def team = Team.get(params.teamLeader)
                    println("${team} 正在招聘")
                    def members = []
                    if (team) {
                        members.add(team.leader.id)
                        team.students.each { e -> members.add(e.id) }
                    }
                    def studentType = PersonTitle.findByName("本科")
                    println("只要${studentType}")
                    count = Student.countByPersonTitleAndIdNotInList(studentType, members)
                } else {
                    count = Student.count()
                }
                break
            case "teamJoinStudent":
                def student = params.myself
                def thing = Thing.get(params.thing)
                if (thing && student) {
                    count = Team.countByThingAndLeaderNotEqual(thing, student)
                } else {
                    println("参数不全：${thing}, ${student}")
                }
                break;
        }
        return count
    }
}
