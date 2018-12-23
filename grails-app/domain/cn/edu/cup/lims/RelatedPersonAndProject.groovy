package cn.edu.cup.lims

class RelatedPersonAndProject {

    Person person
    Thing thing

    static constraints = {
        thing()
        person()
    }

    String toString() {
        return "${thing}.${person}"
    }

}
