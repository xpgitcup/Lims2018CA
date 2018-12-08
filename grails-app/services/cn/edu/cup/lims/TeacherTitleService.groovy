package cn.edu.cup.lims

import grails.gorm.services.Service

@Service(TeacherTitle)
interface TeacherTitleService {

    TeacherTitle get(Serializable id)

    List<TeacherTitle> list(Map args)

    Long count()

    void delete(Serializable id)

    TeacherTitle save(TeacherTitle teacherTitle)

}