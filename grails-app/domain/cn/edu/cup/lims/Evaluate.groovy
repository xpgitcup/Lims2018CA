package cn.edu.cup.lims

class Evaluate {

    Progress progress
    Double score
    String comment
    Person evaluator

    static constraints = {
        progress()
        comment()
        evaluator()
        score()
    }

}
