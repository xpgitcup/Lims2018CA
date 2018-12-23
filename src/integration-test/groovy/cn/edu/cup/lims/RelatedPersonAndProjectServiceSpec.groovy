package cn.edu.cup.lims

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class RelatedPersonAndProjectServiceSpec extends Specification {

    RelatedPersonAndProjectService relatedPersonAndProjectService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new RelatedPersonAndProject(...).save(flush: true, failOnError: true)
        //new RelatedPersonAndProject(...).save(flush: true, failOnError: true)
        //RelatedPersonAndProject relatedPersonAndProject = new RelatedPersonAndProject(...).save(flush: true, failOnError: true)
        //new RelatedPersonAndProject(...).save(flush: true, failOnError: true)
        //new RelatedPersonAndProject(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //relatedPersonAndProject.id
    }

    void "test get"() {
        setupData()

        expect:
        relatedPersonAndProjectService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<RelatedPersonAndProject> relatedPersonAndProjectList = relatedPersonAndProjectService.list(max: 2, offset: 2)

        then:
        relatedPersonAndProjectList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        relatedPersonAndProjectService.count() == 5
    }

    void "test delete"() {
        Long relatedPersonAndProjectId = setupData()

        expect:
        relatedPersonAndProjectService.count() == 5

        when:
        relatedPersonAndProjectService.delete(relatedPersonAndProjectId)
        sessionFactory.currentSession.flush()

        then:
        relatedPersonAndProjectService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        RelatedPersonAndProject relatedPersonAndProject = new RelatedPersonAndProject()
        relatedPersonAndProjectService.save(relatedPersonAndProject)

        then:
        relatedPersonAndProject.id != null
    }
}
