package cn.edu.cup.common

import cn.edu.cup.lims.Course
import cn.edu.cup.lims.PersonTitle
import cn.edu.cup.lims.TaskAllocation
import cn.edu.cup.lims.Team
import grails.gorm.transactions.Transactional

@Transactional
class CommonLimsService {

    /*
    * 相关事情的类型
    * */

    def relatedThingType(PersonTitle personTitle) {
        def tasks = TaskAllocation.findAllByPersonTitle(personTitle)
        if (personTitle.upType) {
            tasks.addAll(TaskAllocation.findAllByPersonTitle(personTitle.upType))
        }
        tasks.unique()
        return tasks
    }

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
            case "relatedThingType":
                objectList = relatedThingType(params.personTitle)
                view = "listThingType"
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
            case "relatedThingType":
                count = relatedThingType(params.personTitle).size()
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
