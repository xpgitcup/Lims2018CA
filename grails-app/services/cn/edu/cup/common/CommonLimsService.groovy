package cn.edu.cup.common

import cn.edu.cup.lims.Course
import cn.edu.cup.lims.Person
import cn.edu.cup.lims.PersonTitle
import cn.edu.cup.lims.RelatedPersonAndProject
import cn.edu.cup.lims.TaskAllocation
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
                if (relatedThingNames) {
                    objectList = Thing.findAllByNameNotInList(relatedThingNames, params)
                } else {
                    def q = Thing.createCriteria()
                    objectList = q.list {

                    }
                }
                view = "listThing"
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
