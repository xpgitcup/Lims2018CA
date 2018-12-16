package cn.edu.cup.maintain

import cn.edu.cup.lims.Project
import cn.edu.cup.lims.ProjectType
import cn.edu.cup.lims.Student
import cn.edu.cup.lims.StudentType
import cn.edu.cup.lims.Teacher
import cn.edu.cup.lims.TeacherTitle
import grails.converters.JSON
import grails.validation.ValidationException

class Operation4BasicDataController {

    def commonService
    def commonDataService
    def systemCommonService
    def excelByJxlService
    def teacherService
    def studentService
    def projectService

    def removeFromSystemUserGrade() {
        def k = 0
        def grade = params.grade
        def students = Student.findAllByGradeName(grade)
        students.each { e ->
            if (systemCommonService.removePersonFromUser(e)) {
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
                } else {
                    systemCommonService.removePersonFromUser(student)
                }
                break
            case "teacher":
                def teacher = teacherService.get(params.id)
                if (!teacher) {
                    flash.message = "${params.id} -- 找不到。"
                } else {
                    systemCommonService.removePersonFromUser(teacher)
                }
                break
        }
        redirect(action: "index")
    }


    def addToSystemUserGrade() {
        def k = 0
        def grade = params.grade
        def students = Student.findAllByGradeName(grade)
        students.each { e ->
            if (systemCommonService.addPersonToUser(e)) {
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
                systemCommonService.addPersonToUser(student)
                break
            case "teacher":
                def teacher = teacherService.get(params.id)
                if (!teacher) {
                    flash.message = "${params.id} -- 找不到。"
                }
                systemCommonService.addPersonToUser(teacher)
                break;
        }
        redirect(action: "index")
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
        (view, newInstance) = commonDataService.createInstance(params)

        if (request.xhr) {
            render(template: view, model: [newInstance: newInstance])
        } else {
            respond newInstance
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
        flash.message = "该功能尚未实现..."
        redirect(action: "index")
    }

    def list() {
        println("${params}")
        def (String view, List<? extends GroovyObject> objectList) = commonDataService.listObjectList(params)

        if (request.xhr) {
            render(template: view, model: [objectList: objectList])
        } else {
            respond objectList
        }
    }

    def count() {
        def count = 0
        count = commonDataService.countObject(params)
        def result = [count: count]
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    def index() {}
}
