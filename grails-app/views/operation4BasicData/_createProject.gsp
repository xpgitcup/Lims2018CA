<!--g:form resource="${this.newInstance}" method="POST"-->
<g:form controller="operation4BasicData" action="save" method="POST">
    <fieldset class="form">
        <!--f:all bean="newInstance"/-->
        <table>
            <tr>
                <td>名称</td>
                <td>
                    <g:hiddenField name="objectType" value="${newInstance.class.simpleName}"/>
                    <g:hiddenField name="id" value="${this.newInstance.id}"/>
                    <g:textField name="name"/>
                </td>
            </tr>
            <tr>
                <td>甲方公司</td>
                <td>
                    <g:textField name="companyA"/>
                </td>
            </tr>
            <tr>
                <td>类型</td>
                <td>
                    <g:select name="thingType" from="${options}"
                              optionKey="id"
                              noSelection="['': '-Choose-']">

                    </g:select>
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="buttons">
        <g:submitButton name="create" class="save"
                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
    </fieldset>
</g:form>
