package cn.edu.cup.lims

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class TeacherTitleServiceSpec extends Specification {

    TeacherTitleService teacherTitleService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new TeacherTitle(...).save(flush: true, failOnError: true)
        //new TeacherTitle(...).save(flush: true, failOnError: true)
        //TeacherTitle teacherTitle = new TeacherTitle(...).save(flush: true, failOnError: true)
        //new TeacherTitle(...).save(flush: true, failOnError: true)
        //new TeacherTitle(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //teacherTitle.id
    }

    void "test get"() {
        setupData()

        expect:
        teacherTitleService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<TeacherTitle> teacherTitleList = teacherTitleService.list(max: 2, offset: 2)

        then:
        teacherTitleList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        teacherTitleService.count() == 5
    }

    void "test delete"() {
        Long teacherTitleId = setupData()

        expect:
        teacherTitleService.count() == 5

        when:
        teacherTitleService.delete(teacherTitleId)
        sessionFactory.currentSession.flush()

        then:
        teacherTitleService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        TeacherTitle teacherTitle = new TeacherTitle()
        teacherTitleService.save(teacherTitle)

        then:
        teacherTitle.id != null
    }
}
