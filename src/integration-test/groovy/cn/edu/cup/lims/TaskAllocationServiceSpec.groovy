package cn.edu.cup.lims

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class TaskAllocationServiceSpec extends Specification {

    TaskAllocationService taskAllocationService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new TaskAllocation(...).save(flush: true, failOnError: true)
        //new TaskAllocation(...).save(flush: true, failOnError: true)
        //TaskAllocation taskAllocation = new TaskAllocation(...).save(flush: true, failOnError: true)
        //new TaskAllocation(...).save(flush: true, failOnError: true)
        //new TaskAllocation(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //taskAllocation.id
    }

    void "test get"() {
        setupData()

        expect:
        taskAllocationService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<TaskAllocation> taskAllocationList = taskAllocationService.list(max: 2, offset: 2)

        then:
        taskAllocationList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        taskAllocationService.count() == 5
    }

    void "test delete"() {
        Long taskAllocationId = setupData()

        expect:
        taskAllocationService.count() == 5

        when:
        taskAllocationService.delete(taskAllocationId)
        sessionFactory.currentSession.flush()

        then:
        taskAllocationService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        TaskAllocation taskAllocation = new TaskAllocation()
        taskAllocationService.save(taskAllocation)

        then:
        taskAllocation.id != null
    }
}
