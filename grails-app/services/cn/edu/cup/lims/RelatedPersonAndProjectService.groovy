package cn.edu.cup.lims

import grails.gorm.services.Service

@Service(RelatedPersonAndProject)
interface RelatedPersonAndProjectService {

    RelatedPersonAndProject get(Serializable id)

    List<RelatedPersonAndProject> list(Map args)

    Long count()

    void delete(Serializable id)

    RelatedPersonAndProject save(RelatedPersonAndProject relatedPersonAndProject)

}