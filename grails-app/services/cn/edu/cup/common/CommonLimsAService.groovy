package cn.edu.cup.common

import cn.edu.cup.lims.PersonTitle
import cn.edu.cup.lims.RelatedPersonAndProject
import cn.edu.cup.lims.Student
import cn.edu.cup.lims.Teacher
import cn.edu.cup.lims.Team
import cn.edu.cup.lims.Thing
import cn.edu.cup.lims.ThingType
import grails.gorm.transactions.Transactional

@Transactional
class CommonLimsAService {

    def list(params) {
        def controller = params.controller
        def objectList
        switch (controller) {
            case "operation4ManageTeamA":
                objectList = listObject4ManageTeamA(params)
                break
            case "operation4StudentTeamB":
                objectList = listObject4ManageTeamA(params)
                break;
        }
        return objectList
    }

    def listObject4ManageTeamA(params) {
        println("${params}")
        def view
        def objectList = []
        switch (params.key) {
            case "things4StudentToSelect":
                params.sort = 'thingType'
                def studentThing = ThingType.findByName("教学任务")
                println("只统计 ${studentThing}")
                objectList = Thing.findAllByThingType(studentThing, params)
                view = "listThing"
                break
            case "relatedTeams":
                def thing = Thing.get(params.thing)
                println("相关${thing?.id}的团队...")
                objectList = Team.findAllByThing(thing, params)
                view = "listTeam"
                break;
            case "teamMembersStudent":
                def team = Team.get(params.team)
                println("返回团队：${team}")
                objectList.add(team)
                view = "listMembersStudents"
                break;
        }
        return [view, objectList]
    }

    def count(params) {
        def controller = params.controller
        def count = 0
        switch (controller) {
            case "operation4ManageTeamA":
                count = countObject4ManageTeamA(params)
                break
            case "operation4StudentTeamB":
                count = countObject4ManageTeamA(params)
                break
        }
        return count
    }

    def countObject4ManageTeamA(params) {
        def key = params.key
        def count = 0
        switch (key) {
            case "thing4ChoiceStudent":
                def relatedThingNames = params.relatedThingNames
                def studentThing = ThingType.findByName("教学任务")
                if (relatedThingNames) {
                    count = Thing.countByThingTypeAndNameNotInList(studentThing, relatedThingNames)
                } else {
                    count = Thing.countByThingType(studentThing)
                }
                break
            case "teamMembersStudent":
                def team = Team.get(params.team)
                if (team) {
                    count = team?.students?.size()
                }
                break
        }
        return count
    }

}
