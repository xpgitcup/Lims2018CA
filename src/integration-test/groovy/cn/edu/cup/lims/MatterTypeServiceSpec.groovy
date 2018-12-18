package cn.edu.cup.lims

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class MatterTypeServiceSpec extends Specification {

    MatterTypeService matterTypeService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new MatterType(...).save(flush: true, failOnError: true)
        //new MatterType(...).save(flush: true, failOnError: true)
        //MatterType matterType = new MatterType(...).save(flush: true, failOnError: true)
        //new MatterType(...).save(flush: true, failOnError: true)
        //new MatterType(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //matterType.id
    }

    void "test get"() {
        setupData()

        expect:
        matterTypeService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<MatterType> matterTypeList = matterTypeService.list(max: 2, offset: 2)

        then:
        matterTypeList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        matterTypeService.count() == 5
    }

    void "test delete"() {
        Long matterTypeId = setupData()

        expect:
        matterTypeService.count() == 5

        when:
        matterTypeService.delete(matterTypeId)
        sessionFactory.currentSession.flush()

        then:
        matterTypeService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        MatterType matterType = new MatterType()
        matterTypeService.save(matterType)

        then:
        matterType.id != null
    }
}
