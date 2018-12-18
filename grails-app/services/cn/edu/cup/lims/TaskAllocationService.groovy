package cn.edu.cup.lims

import grails.gorm.services.Service

@Service(TaskAllocation)
interface TaskAllocationService {

    TaskAllocation get(Serializable id)

    List<TaskAllocation> list(Map args)

    Long count()

    void delete(Serializable id)

    TaskAllocation save(TaskAllocation taskAllocation)

}