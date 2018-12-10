package cn.edu.cup.maintain

import cn.edu.cup.lims.Project
import cn.edu.cup.lims.ProjectType
import cn.edu.cup.lims.Student
import cn.edu.cup.lims.Teacher
import cn.edu.cup.lims.TeacherTitle
import cn.edu.cup.system.SystemAttribute
import cn.edu.cup.system.SystemUser
import grails.converters.JSON
import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.CREATED

class Operation4BasicDataController {

    def commonService
    def commonDataService
    def excelByJxlService
    def teacherService
    def studentService
    def projectService
    def systemUserService

    def removeFromSystemUserGrade() {
        def k = 0
        def grade = params.grade
        def students = Student.findAllByGradeName(grade)
        students.each { e ->
            if (removeFromUser(e)) {
                k++
            }
        }
        flash.message = "毕业${k}名学生。"
        redirect(action: "index")
    }

    def removeFromSystemUser() {
        switch (params.key) {
            case "student":
                def student = studentService.get(params.id)
                if (!student) {
                    flash.message = "${params.id} -- 找不到学生。"
                }
                removeFromUser(student)
                break
        }
        redirect(action: "index")
    }

    private boolean removeFromUser(student) {
        def u = SystemUser.findByUserName(student.code)
        if (u) {
            systemUserService.delete(u.id)
            return true
        } else {
            flash.message = "${student} 不在."
            return false
        }
    }

    def addToSystemUserGrade() {
        def k = 0
        def grade = params.grade
        def students = Student.findAllByGradeName(grade)
        students.each { e ->
            if (addStudentToUser(e)) {
                k++
            }
        }
        flash.message = "新入学${k}名学生。"
        redirect(action: "index")
    }

    def addToSystemUser() {
        switch (params.key) {
            case "student":
                def student = studentService.get(params.id)
                if (!student) {
                    flash.message = "${params.id} -- 找不到学生。"
                }
                addStudentToUser(student)
                break
        }
        redirect(action: "index")
    }

    private boolean addStudentToUser(student) {
        def role = SystemAttribute.findByName("系统操作权限")
        if (SystemUser.countByUserName(student.code) < 1) {
            def u = new SystemUser(
                    userName: student.code,
                    password: "12345678",
                    roleAttribute: role,
                    appendAttribute: "student=${student.id}"
            )
            systemUserService.save(u)
            return true
        } else {
            return false
        }
    }

    def saveProject(Project newInstance) {
        if (newInstance == null) {
            notFound()
            return
        }

        try {
            projectService.save(newInstance)
        } catch (ValidationException e) {
            flash.message = newInstance.errors
        }

        redirect(action: "index")
    }

    def saveTeacher(Teacher newInstance) {
        if (newInstance == null) {
            notFound()
            return
        }

        try {
            teacherService.save(newInstance)
        } catch (ValidationException e) {
            flash.message = newInstance.errors
        }

        redirect(action: "index")
    }

    def create() {
        println("createDataItem ${params}")
        // 缺省的情况
        def newInstance
        def view
        switch (params.key) {
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
                newInstance = new cn.edu.cup.lims.StudentType(params)
                view = "createStudentType"
                break;
            case "projectType":
                newInstance = new cn.edu.cup.lims.ProjectType(params)
                view = "createProjectType"
                break;
        }

        if (request.xhr) {
            render(template: view, model: [newInstance: newInstance])
        } else {
            respond dataItem
        }
    }

    def importFromFile() {
        println("导入...${params}")
        if (!params.uploadedFile.empty) {
            //处理文件上传
            def destDir = commonService.webRootPath + "file4import"
            params.destDir = destDir
            println(destDir)
            def sf = commonService.upload(params)
            println("上传${sf}成功...")
            def data = excelByJxlService.importExcelFileToDataTable(sf)
            println("${data}")
            if (data.size() > 0) {
                def resultstr = ""
                def r
                data.eachWithIndex { e, i ->
                    if (i > 0) {
                        println("当前 ${e}")
                        switch (params.key) {
                            case "teacher":
                                def t = new Teacher()
                                r = t.importFromDataSheet(e)
                                if (r.result.empty) {
                                    teacherService.save(r.teacher)
                                }
                                break
                            case "student":
                                def s = new Student()
                                r = s.importFromDataSheet(e)
                                if (r.result.empty) {
                                    studentService.save(s)
                                }
                                break
                            case "project":
                                def p = new Project()
                                r = p.importFromDataSheet(e)
                                if (r.result.empty) {
                                    projectService.save(p)
                                }
                                break
                        }
                        if (resultstr.empty) {
                            resultstr += r.result
                        } else {
                            resultstr += ","
                            resultstr += r.result
                        }
                    }
                }
                if (resultstr.empty) {
                    flash.message = "导入${data.size()}个记录."
                } else {
                    flash.message += resultstr
                }
            }
        } else {
            flash.message = "空文件！"
        }

        redirect(action: "index")
    }

    def downloadTemplate() {

        def hs = commonDataService.dataSheetHead(new Teacher())
        println("数据模板：")
        println("${hs}")
        redirect(action: "index")
    }

    def list() {
        println("${params}")
        def view
        def objectList
        switch (params.key) {
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
                objectList = cn.edu.cup.lims.StudentType.list(params)
                view = "listStudentType"
                break;
            case "projectType":
                objectList = cn.edu.cup.lims.ProjectType.list(params)
                view = "listProjectType"
                break;
        }

        if (request.xhr) {
            render(template: view, model: [objectList: objectList])
        } else {
            respond objectList
        }
    }

    def count() {
        def count = 0
        switch (params.key) {
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
                count = cn.edu.cup.lims.StudentType.count()
                break;
            case "projectType":
                count = ProjectType.count()
                break;
        }
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    def index() {}
}
