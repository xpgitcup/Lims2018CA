<!--g:form resource="${this.newInstance}" method="POST"-->
<g:form controller="operation4ManageA" action="saveTeam" method="POST">
    <fieldset class="form">
        <!--f:all bean="newInstance"/-->
        <table>
            <tr>
                <td>团队名称</td>
                <td>
                    <g:hiddenField name="id" value="${this.newInstance.id}"/>
                    <g:textField name="name" value="${this.newInstance.name}" id="teamName"/>
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
                <td>队长</td>
                <td>
                    <g:textField name="leader" value="${params.leader}"/>
                </td>
                <td>
                    <label>
                        ${params.person}
                    </label>
                </td>
            </tr>
            <tr>
                <td>创建时间</td>
                <td>
                    <g:textField name="createDate" value="${new Date()}"/>
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="buttons">
        <g:submitButton name="create" class="save"
                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
    </fieldset>
</g:form>
