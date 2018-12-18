package cn.edu.cup.lims

import grails.gorm.services.Service

@Service(Matter)
interface MatterService {

    Matter get(Serializable id)

    List<Matter> list(Map args)

    Long count()

    void delete(Serializable id)

    Matter save(Matter matter)

}