<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<%@attribute name="title" fragment="true" required="true" %>
<%@attribute name="head" fragment="true" %>
<%@attribute name="yield" fragment="true" required="true" %>
<%@attribute name="footer" fragment="true" %>

<html>
<head>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">

    <meta charset="utf-8">
    <title><jsp:invoke fragment="title"/></title>

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <jsp:invoke fragment="head"/>
</head>

<body>
    <nav id="main-nav">
        <dl>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
<<<<<<< HEAD
                <dt><a href="/">HAJA</a></dt>
                <dt><a href="/administrator/supplier">Fornitori</a></dt>
                <dt><a href="/administrator/user">Utenti</a></dt>
                <dt><a href="/administrator/orders">Ordini </a></dt>
                <dt><a href="/administrator/product">Gestione Catalogo Prodotti</a></dt>
=======
>>>>>>> 47efa2dc6182f569ff2bd376c550b397a04c9bd4

                <dt><a href="/">HAJA</a></dt>
                <dt><a href="/administrator/supplier">Fornitori</a></dt>
                <dt><a href="/administrator/user">Utenti</a></dt>
                <dt><a href="/administrator/orders">Ordini </a></dt>
                <dt><a href="/administrator/product">Prodotti</a></dt>
            </sec:authorize>
<<<<<<< HEAD
=======

            <sec:authorize access="hasRole('ROLE_USER')">

                <dt><a href="/cart"> Carrello </a></dt>
            </sec:authorize>

>>>>>>> 47efa2dc6182f569ff2bd376c550b397a04c9bd4
        </dl>
    </nav>


    <nav id="seconday-nav">
        <dl>
            <dt><a title="registrati" href="/signup">registrati</a></dt>
            <sec:authorize access="isAnonymous()">
                <dt><a title="login" href="/login">login</a></dt>
            </sec:authorize>

            <sec:authorize access="isAuthenticated()">
                <dt><a href="/j_spring_security_logout">logout</a> </dt>
            </sec:authorize>
        </dl>
    </nav>

    <jsp:invoke fragment="yield"/>
    <jsp:invoke fragment="footer"/>
</body>
</html>