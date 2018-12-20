<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div id="create-student" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.student}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.student}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
<!--g:form resource="${this.student}" method="POST"-->
    <g:form controller="operation4BasicData" action="save" id="${this.newInstance.id}">
        <fieldset class="form">
            <!--f:all bean="newInstance"/-->
            <table>
                <tr>
                    <td>姓名</td>
                    <td>
                        <g:hiddenField name="objectType" value="${newInstance.class.simpleName}"/>
                        <g:hiddenField name="id" value="${this.newInstance.id}"/>
                        <g:textField name="name"/>
                    </td>
                    <td>学号</td>
                    <td>
                        <g:textField name="code"/>
                    </td>
                </tr>
                <tr>
                    <td>年级</td>
                    <td>
                        <g:textField name="gradeName"/>
                    </td>
                    <td>类型</td>
                    <td>
                        <g:select name="studentType" from="${options}"
                                  optionKey="id"
                                  noSelection="['': '-Choose-']">

                        </g:select>
                    </td>
                </tr>
                <tr>
                    <td>专业</td>
                    <td>
                        <g:select name="major" from="${cn.edu.cup.lims.Major.list()}"
                                  optionKey="id"
                                  noSelection="['': '-Choose-']">
                        </g:select>
                    </td>
                    <td>导师</td>
                    <td>
                        <g:select name="supervisor" from="${cn.edu.cup.lims.Teacher.list()}"
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
</div>
</body>
</html>
