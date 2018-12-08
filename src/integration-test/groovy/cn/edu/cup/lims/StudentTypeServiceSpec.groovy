package cn.edu.cup.lims

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class StudentTypeServiceSpec extends Specification {

    StudentTypeService studentTypeService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new StudentType(...).save(flush: true, failOnError: true)
        //new StudentType(...).save(flush: true, failOnError: true)
        //StudentType studentType = new StudentType(...).save(flush: true, failOnError: true)
        //new StudentType(...).save(flush: true, failOnError: true)
        //new StudentType(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //studentType.id
    }

    void "test get"() {
        setupData()

        expect:
        studentTypeService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<StudentType> studentTypeList = studentTypeService.list(max: 2, offset: 2)

        then:
        studentTypeList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        studentTypeService.count() == 5
    }

    void "test delete"() {
        Long studentTypeId = setupData()

        expect:
        studentTypeService.count() == 5

        when:
        studentTypeService.delete(studentTypeId)
        sessionFactory.currentSession.flush()

        then:
        studentTypeService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        StudentType studentType = new StudentType()
        studentTypeService.save(studentType)

        then:
        studentType.id != null
    }
}
