package cn.edu.cup.lims

import grails.gorm.services.Service

@Service(MatterType)
interface MatterTypeService {

    MatterType get(Serializable id)

    List<MatterType> list(Map args)

    Long count()

    void delete(Serializable id)

    MatterType save(MatterType matterType)

}