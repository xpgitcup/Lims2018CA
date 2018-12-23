package cn.edu.cup.lims

class RelatedPersonAndProject {

    Person person
    Thing thing

    static mapping = {

    }

    static constraints = {
        thing()
        person()
    }

    String toString() {
        return "${thing}.${person}"
    }

    static boolean exists(Person person, Thing thing) {
        RelatedPersonAndProject.countByPersonAndThing(person, thing) > 0
    }

}
