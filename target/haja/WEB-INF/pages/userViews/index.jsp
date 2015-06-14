<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
</head>

<t:general>


    <jsp:attribute name="title">Lista degli utenti</jsp:attribute>
    <jsp:attribute name="yield">

        <c:if test="${!empty users}">
            <h3>Clienti</h3>
            <table class="table table-bordered table-striped"> <!--intabellamento-->
                <thead>
                <tr>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Nickname</th>
                    <th>Email</th>
                    <th>Iscritto/a dal</th>
                    <th>Nato/a il</th>
                    <th>&nbsp;</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.firstName} </td>
                        <td>${user.lastName} </td>
                        <td>${user.nickname}</td>
                        <td>${user.email}</td>
                        <td>${user.registrationDate}</td>
                        <td>${user.birthDate} dd/MM/yyyy</td>
                        <td>
                            <form action="/administrator/user/delete/${user.id}" method="post"><input type="submit" class="btn btn-danger btn-mini" value="Rimuovi"/></form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>

    </jsp:attribute>

</t:general>