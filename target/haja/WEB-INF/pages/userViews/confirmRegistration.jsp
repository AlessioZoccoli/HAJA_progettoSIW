<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
</head>

<t:general>

    <jsp:attribute name="title">login</jsp:attribute>
    <jsp:attribute name="yield">
        <body>Registrazione Effettuata con <strong>successo</strong></body>
        <a href="/">Torna alla Home</a>
    </jsp:attribute>

</t:general>
