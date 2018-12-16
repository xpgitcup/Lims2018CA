package cn.edu.cup.common

import cn.edu.cup.lims.Person
import cn.edu.cup.lims.Project
import cn.edu.cup.lims.ProjectType
import cn.edu.cup.lims.Student
import cn.edu.cup.lims.StudentType
import cn.edu.cup.lims.Teacher
import cn.edu.cup.lims.TeacherTitle
import cn.edu.cup.lims.Team
import grails.gorm.transactions.Transactional

@Transactional
class CommonDataService {

    def teacherService
    def teamService

    int countObject(params) {
        def key = params.key
        def count = 0
        switch (key) {
            case "person":
                def team = teamService.get(params.team)
                count = Person.count()
                if (team) {
                    if (team.members) {
                        count -= team.members.size()
                    }
                }
                count -= 1
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
                count = TeacherTitle.count()
                break;
            case "studentType":
                count = StudentType.count()
                break;
            case "projectType":
                count = ProjectType.count()
                break;
        }
        return count
    }

    def listObjectList(params) {
        def view
        def objectList = []
        switch (params.key) {
            case "person":
                println("寻找人力资源：")
                def team = teamService.get(params.team)
                if (team) {
                    def members = []
                    members.add(team.leader.id)
                    if (team) {
                        if (team.members) {
                            team.members.each { it->
                                members.add(it.id)
                            }
                        }
                    }
                    println("${team} 招人 ${members}")
                    def pg = [:]
                    pg.offset = params.offset
                    pg.max = params.max
                    objectList = Person.findAllByIdNotInList(members, pg)
                } else {
                    objectList = Person.list(params)
                }
                view = "listPerson"
                break
            case "member":
                def team = teamService.get(params.team)
                if (team) {
                    if (team.members) {
                        objectList = team.members
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
                objectList = TeacherTitle.list(params)
                view = "listTeacherTitle"
                break;
            case "studentType":
                objectList = StudentType.list(params)
                view = "listStudentType"
                break;
            case "projectType":
                objectList = ProjectType.list(params)
                view = "listProjectType"
                break;
        }
        return [view, objectList]
    }

    def createInstance(params) {
        println("CommonDataService: ${params}")
        def newInstance
        def view
        switch (params.key) {
            case "team":
                //def teacher = Teacher.get(params.directorId)
                newInstance = new Team(params)
                //teacher.addToTeam(newInstance).save()
                view = "createTeam"
                break
            case "teacher":
                newInstance = new Teacher(params)
                view = "createTeacher"
                break;
            case "student":
                newInstance = new Student(params)
                view = "createStudent"
                break;
            case "project":
                newInstance = new Project(params)
                view = "createProject"
                break;
            case "teacherTitle":
                newInstance = new TeacherTitle(params)
                view = "createTeacherTitle"
                break;
            case "studentType":
                newInstance = new StudentType(params)
                view = "createStudentType"
                break;
            case "projectType":
                newInstance = new ProjectType(params)
                view = "createProjectType"
                break;
        }
        return [view, newInstance]
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
