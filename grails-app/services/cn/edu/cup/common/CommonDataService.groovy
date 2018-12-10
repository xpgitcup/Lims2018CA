package cn.edu.cup.common

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

    int countObject(key) {
        def count = 0
        switch (key) {
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
        def objectList
        switch (params.key) {
            case "team":
                objectList = Team.list(params)
                view = "listTeam"
                break;
            case "teacher":
                objectList = Teacher.list(params)
                view = "listTeacher"
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
                newInstance = new Team(params)
                if (params.director) {
                    newInstance.director = []
                    newInstance.director.add(params.director)
                }
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
