package cn.edu.cup.maintain

import cn.edu.cup.lims.Project
import cn.edu.cup.lims.ProjectType
import cn.edu.cup.lims.Student
import cn.edu.cup.lims.Teacher
import cn.edu.cup.lims.TeacherTitle
import grails.converters.JSON

class Operation4BasicDataController {

    def commonService
    def commonDataService
    def excelByJxlService
    def teacherService
    def studentService

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
                    if (i>0) {
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
