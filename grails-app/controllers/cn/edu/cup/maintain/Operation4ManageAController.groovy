package cn.edu.cup.maintain

class Operation4ManageAController extends Operation4BasicDataController {

    def createTeam() {
        flash.message = "成功创建1个团队。"
        redirect(action: "index")
    }

    def index() {}
}
