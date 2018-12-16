package cn.edu.cup.lims

import grails.gorm.services.Service

@Service(ThingType)
interface ProjectTypeService {

    ThingType get(Serializable id)

    List<ThingType> list(Map args)

    Long count()

    void delete(Serializable id)

    ThingType save(ThingType projectType)

}