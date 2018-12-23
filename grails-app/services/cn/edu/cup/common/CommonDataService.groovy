package cn.edu.cup.common

import cn.edu.cup.lims.Course
import cn.edu.cup.lims.Major
import cn.edu.cup.lims.Person
import cn.edu.cup.lims.PersonTitle
import cn.edu.cup.lims.Project
import cn.edu.cup.lims.Student
import cn.edu.cup.lims.TaskAllocation
import cn.edu.cup.lims.Teacher
import cn.edu.cup.lims.Team
import cn.edu.cup.lims.Thing
import cn.edu.cup.lims.ThingType
import cn.edu.cup.system.JsFrame
import grails.gorm.transactions.Transactional

@Transactional
class CommonDataService {

    def personTitleService
    def matterTypeService
    def thingTypeService
    def teamService
    def treeViewService
    def teacherService
    def majorService
    def studentService
    def projectService
    def courseService

    def saveInstance(params) {
        def result
        def newInstance
        println("try 保存：${params}")
        switch (params.objectType) {
            case "Course":
                newInstance = new Course(params)
                courseService.save(newInstance)
                break
            case "Project":
                newInstance = new Project(params)
                projectService.save(newInstance)
                break
            case "Student":
                newInstance = new Student(params)
                studentService.save(newInstance)
                break
            case "Major":
                newInstance = new Major(params)
                majorService.save(newInstance)
                break;
            case "Teacher":
                newInstance = new Teacher(params)
                teacherService.save(newInstance)
                break;
            case "MatterType":
                matterTypeService.save(newInstance)
                break;
            case "PersonTitle":
                newInstance = new PersonTitle(params)
                result = personTitleService.save(newInstance)
                break;
            case "ThingType":
                newInstance = new ThingType(params)
                thingTypeService.save(newInstance)
                break;
        }
        println("保存结果：${newInstance}")
        return result
    }

    int countObject(params) {
        def key = params.key
        def count = 0
        switch (key) {
            case "course":
                count = Course.count()
                break
            case "major":
                count = Major.count()
                break
            case "personTitle":
                count = PersonTitle.count()
                break;
            case "person":
                println("招募统计：${params}")
                def team = teamService.get(params.team)
                if (team) {
                    def members = []
                    members.add(team.leader.id)
                    if (team) {
                        if (team.members) {
                            team.members.each { it ->
                                members.add(it.id)
                            }
                        }
                    }
                    println("统计： ${team} ${members}")
                    count = Person.countByIdNotInList(members)
                } else {
                    count = Person.count()
                }
                break;
            case "member":
                def team = teamService.get(params.team)
                if (team) {
                    if (team.members) {
                        count = team.members.size()
                    }
                }
                break
            case "team":
                count = Team.count()
                break;
            case "teacher":
                count = Teacher.count()
                break;
            case "student":
                count = Student.count()
                break;
            case "project":
                count = Project.count()
                break;
            case "teacherTitle":
                def teacherTitle = PersonTitle.findByName("教师")
                count = teacherTitle.subItems.size()
                break;
            case "studentType":
                def studentType = PersonTitle.findByName("学生")
                count = studentType.subItems.size()
                break;
            case "thingType":
                if (params.upType) {
                    def upType = ThingType.get(params.upType)
                    count = ThingType.countByUpType(upType)
                } else {
                    count = ThingType.count()
                }
                break;
            case "thingTypeClassify":
                count = ThingType.countByUpTypeIsNull()
                break
            case "taskAllocation":
                if (params.thingType) {
                    def ty = ThingType.get(params.thingType)
                    count = TaskAllocation.countByThingType(ty)
                } else {
                    count = TaskAllocation.count()
                }
                break;
        }
        return count
    }

    def getTreeviewData(params) {
        println("getTreeviewData: ${params}")
        def treeviewData
        def data
        switch (params.key) {
            case "personTitle":
                data = PersonTitle.findAllByUpTypeIsNull()
                params.context = "name"
                params.subItems = "subItems"
                params.attributes = "id"    //
                params.useMethod = false
                treeviewData = treeViewService.generateNodesString(data, params, JsFrame.EasyUI)
                break
            case "thingType":
                data = ThingType.findAllByUpTypeIsNull()
                params.context = "name"
                params.subItems = "subItems"
                params.attributes = "id"    //
                params.useMethod = false
                treeviewData = treeViewService.generateNodesString(data, params, JsFrame.EasyUI)
                break
        }
        return treeviewData
    }

    def listObject(params) {
        def view
        def objectList = []
        switch (params.key) {
        // 简单对象
            case "course":
                objectList = Course.list(params)
                view = "listCourse"
                break
            case "major":
                objectList = Major.list(params)
                view = "listMajor"
                break
        //复杂对象
            case "personGrade":
                def team = teamService.get(params.team)
                if (team) {
                    List members = getMembersId(team)

                    objectList = [:]

                    def teachers = Teacher.findAllByIdNotInList(members, params)
                    objectList.put("teachers", teachers)

                    def sts = StudentType.list()
                    def gs = Student.executeQuery("select distinct a.gradeName from Student a")
                    println("${gs}")
                    sts.each { e ->
                        gs.each { ee ->
                            def key = "${ee}-${e}"
                            def list = Student.findAllByGradeNameAndStudentTypeAndIdNotInList(ee, e, members, params)
                            if (!list.isEmpty()) {
                                objectList.put(key, list)
                                println("${key}")
                                println("${list}")
                            }
                        }
                    }
                    view = "listPersonGrade"
                } else {
                    objectList = Person.list(params)
                    view = "listPerson"
                }
                break
            case "person":
                //println("寻找人力资源：")
                def team = teamService.get(params.team)
                if (team) {
                    List members = getMembersId(team)
                    //println("${team} 招人 ${members}")
                    objectList = Person.findAllByIdNotInList(members, params)
                } else {
                    objectList = Person.list(params)
                }
                view = "listPerson"
                break
            case "member":
                def team = teamService.get(params.team)
                if (team) {
                    if (team.members) {
                        def ms = []
                        team.members.each { e ->
                            ms.add(e.id)
                        }
                        objectList = Person.findAllByIdInList(ms, params)
                    }
                }
                view = "listMember"
                break
            case "team":
                if (params.leader) {
                    def p = Person.get(params.leader)
                    println("队长：${p}")
                    if (params.projectId) {
                        def project = Project.get(params.projectId)
                        if (project) {
                            println("队长：${p} 项目: ${project}")
                            objectList = Team.findAllByLeaderAndProject(p, project, params)
                        }
                    } else {
                        objectList = Team.findAllByLeader(p, params)
                    }
                } else {
                    objectList = Team.list(params)
                }
                view = "listTeam"
                break;
            case "teacher":
                if (params.teamId) {
                    def t = Team.get(params.teamId) {
                        if (t) {
                            objectList = t.members
                            objectList = Teacher.list(params)
                            view = "listPerson"
                        }
                    }
                } else {
                    objectList = Teacher.list(params)
                    view = "listTeacher"
                }
                break;
            case "student":
                objectList = Student.list(params)
                view = "listStudent"
                break;
            case "project":
                objectList = Project.list(params)
                view = "listProject"
                break;
            case "teacherTitle":
                def teacherTitle = PersonTitle.findByName("教师")
                objectList = PersonTitle.findAllByUpType(teacherTitle, params)
                view = "listTeacherTitle"
                break;
            case "studentType":
                def studentType = PersonTitle.findByName("学生")
                objectList = PersonTitle.findAllByUpType(studentType, params)
                view = "listStudentType"
                break;
            case "projectType":
                def projectType = ThingType.findByName("科研项目")
                objectList = ThingType.findAllByUpType(projectType, params)
                view = "listProjectType"
                break;
            case "thingType":
                if (params.upType) {
                    def upType = ThingType.get(params.upType)
                    if (upType) {
                        objectList = ThingType.findAllByUpType(upType, params)
                    } else {
                        objectList = ThingType.list(params)
                    }
                } else {
                    objectList = ThingType.list(params)
                }
                view = "listThingType"
                break;
            case "thingTypeClassify":
                objectList = ThingType.findAllByUpTypeIsNull(params)
                view = "listThingTypeClassify"
                break;
            case "taskAllocation":
                if (params.thingType) {
                    def ty = ThingType.get(params.thingType)
                    objectList = TaskAllocation.findAllByThingType(ty, params)
                }  else {
                    objectList = TaskAllocation.list(params)
                }
                view = "listTaskAllocation"
                break;
        }
        return [view, objectList]
    }

    private List getMembersId(team) {
        def members = []
        members.add(team.leader.id)
        if (team) {
            if (team.members) {
                team.members.each { it ->
                    members.add(it.id)
                }
            }
        }
        return members
    }

    def createInstance(params) {
        println("CommonDataService: ${params}")
        def newInstance
        def view
        def options
        switch (params.key) {
            case "personTitle":
                if (params.id) {
                    params.upType = params.id
                }
                newInstance = new PersonTitle(params)
                view = "createPersonTitle"
                println("创建：${newInstance.class.simpleName}")
                break
            case "thingType":
                if (params.id) {
                    params.upType = params.id
                }
                newInstance = new ThingType(params)
                view = "createThingType"
                break;
            case "team":
                //def teacher = Teacher.get(params.directorId)
                newInstance = new Team(params)
                //teacher.addToTeam(newInstance).save()
                view = "createTeam"
                break
            case "teacher":
                newInstance = new Teacher(params)
                view = "createTeacher"
                def teacherTitle = PersonTitle.findByName("教师")
                options = teacherTitle.subItems
                break;
            case "student":
                newInstance = new Student(params)
                view = "createStudent"
                def studentType = PersonTitle.findByName("学生")
                options = studentType.subItems
                break;
            case "project":
                newInstance = new Project(params)
                view = "createProject"
                def projectType = ThingType.findByName("科研任务")
                options = projectType.subItems
                break;
            case "major":
                newInstance = new Major(params)
                view = "createMajor"
                break
            case "course":
                newInstance = new Course(params)
                view = "createCourse"
                break
        }
        println("可选项：${options}")
        return [view, newInstance, options]
    }

    /*
    * 获取对象的-数据模板-标题
    * */

    def dataSheetHead(Object object) {
        def h = []
        object.properties.each { e ->
            println("${e.metaClass}")
            h.add("${e.key}")
        }
        return h
    }

    /*
    * 导出数据
    * */

    def object2DataSheet(Object object) {
        def ds = []
        // 首先输出标题
        ds.add(dataSheetHead(object))
        // 然后输出数据
        def data = []
        object.class.fields.each { e ->
            data.add("${e}")
        }
        ds.add(data)
        return ds
    }
}
