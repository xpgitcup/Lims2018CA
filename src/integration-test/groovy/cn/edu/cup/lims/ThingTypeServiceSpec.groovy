package cn.edu.cup.lims

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ThingTypeServiceSpec extends Specification {

    ProjectTypeService projectTypeService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new ThingType(...).save(flush: true, failOnError: true)
        //new ThingType(...).save(flush: true, failOnError: true)
        //ThingType thingType = new ThingType(...).save(flush: true, failOnError: true)
        //new ThingType(...).save(flush: true, failOnError: true)
        //new ThingType(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //thingType.id
    }

    void "test get"() {
        setupData()

        expect:
        projectTypeService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<ThingType> projectTypeList = projectTypeService.list(max: 2, offset: 2)

        then:
        projectTypeList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        projectTypeService.count() == 5
    }

    void "test delete"() {
        Long projectTypeId = setupData()

        expect:
        projectTypeService.count() == 5

        when:
        projectTypeService.delete(projectTypeId)
        sessionFactory.currentSession.flush()

        then:
        projectTypeService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        ThingType projectType = new ThingType()
        projectTypeService.save(projectType)

        then:
        projectType.id != null
    }
}
