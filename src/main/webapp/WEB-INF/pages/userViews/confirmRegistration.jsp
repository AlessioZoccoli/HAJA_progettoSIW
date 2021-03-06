<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:general>
    <jsp:attribute name="title">login</jsp:attribute>
    <jsp:attribute name="yield">

        <head>
            <link href="../../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
            <link href="../../../bootstrap/css/business-casual.css" rel="stylesheet" type="text/css">
        </head>

        <body>Registrazione Effettuata con <strong>successo</strong></body>
        <a href="/">Torna alla Home</a>

        <h3>I tuoti dati</h3>
            <tr>
                <th><strong>Nome:</strong>
                 ${user.firstName} </th>

                <th><strong>Cognome: </strong>
                    ${user.lastName} </th>

                <th><strong> Nickname: </strong>
                    ${user.nickname}</th>

                <th><strong>EMail: </strong>
                    ${user.email}</th>

                <th><strong>Data di nascita: <em>
                ${user.birthDate}</th>

                <th>
                    <form action="/" method="get"><input type="submit" class="btn btn-danger btn-mini" value="Home"/></form>
                </th>
            </tr>


    </jsp:attribute>

</t:general>
