package cn.edu.cup.lims

import grails.gorm.services.Service

@Service(StudentType)
interface StudentTypeService {

    StudentType get(Serializable id)

    List<StudentType> list(Map args)

    Long count()

    void delete(Serializable id)

    StudentType save(StudentType studentType)

}