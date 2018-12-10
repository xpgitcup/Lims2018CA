<!--g:form resource="${this.newInstance}" method="POST"-->
<g:form controller="operation4ManageA" action="saveTeam" method="POST">
    <fieldset class="form">
        <!--f:all bean="newInstance"/-->
        <table>
            <tr>
                <td>团队名称</td>
                <td>
                    <g:hiddenField name="id" value="${this.newInstance.id}"/>
                    <g:textField name="name"/>
                </td>
            </tr>
            <tr>
                <td>
                    项目
                </td>
                <td>
                    <g:select name="project" from="${cn.edu.cup.lims.Project.list()}"
                              noSelection="['': '-Choose-']"
                              value="${params.project}"
                              optionKey="id">
                    </g:select>
                </td>
            </tr>
            <tr>
                <td>指导教师</td>
                <td>
                    <g:select name="director" from="${cn.edu.cup.lims.Teacher.list()}"
                              noSelection="['': '-Choose-']"
                              optionKey="id"
                              value="${params.director}"/>
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="buttons">
        <g:submitButton name="create" class="save"
                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
    </fieldset>
</g:form>
