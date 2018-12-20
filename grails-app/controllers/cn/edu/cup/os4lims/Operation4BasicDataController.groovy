package cn.edu.cup.os4lims

import cn.edu.cup.lims.Project
import cn.edu.cup.lims.Student
import cn.edu.cup.lims.Teacher
import grails.converters.JSON
import grails.validation.ValidationException

class Operation4BasicDataController {

    def commonDataService
    def commonService
    def excelByJxlService
    def teacherService
    def studentService
    def projectService

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
        def key = params.key
        def head = []
        def fileName
        switch (key) {
            case "teacher":
                head.add(Teacher.dataSheetTitles())
                fileName = commonService.webRootPath + "templates/teacher.xls"
                break
            case "student":
                head.add(Student.dataSheetTitles())
                fileName = commonService.webRootPath + "templates/student.xls"
                break
            case "project":
                head.add(Project.dataSheetTitles())
                fileName = commonService.webRootPath + "templates/project.xls"
                break
            case "major":
                break
        }
        excelByJxlService.exportDataTable2ExcelFile(head, fileName)
        params.downLoadFileName = fileName
        commonService.downLoadFile(params)
    }

    def save() {
        println("${params}")
        try {
            commonDataService.saveInstance(params)
        } catch (ValidationException e) {
            flash.message = "出错了!" + e.message
        }
        redirect(action: "index")
    }

    def create() {
        println("createDataItem ${params}")
        // 缺省的情况
        def newInstance
        def view
        def options
        (view, newInstance, options) = commonDataService.createInstance(params)

        if (request.xhr) {
            render(template: view, model: [newInstance: newInstance, options: options])
        } else {
            respond newInstance
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

    def list() {
        println("${params}")
        def (String view, List<? extends GroovyObject> objectList) = commonDataService.listObjectList(params)

        if (request.xhr) {
            render(template: view, model: [objectList: objectList])
        } else {
            respond objectList
        }
    }

    def index() {}
}
