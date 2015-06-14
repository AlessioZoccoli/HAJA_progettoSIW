<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
</head>


<t:general>


    <jsp:attribute name="title">login</jsp:attribute>


    <jsp:attribute name="yield">

        <h1>Effettua il login</h1>

        <form name="f" id="form-data" action="/j_spring_security_check" method="POST">

            <label>Nickname</label>
            <input type='text' name='j_username' />

            <label>Password</label>
            <input type='password' name='j_password'>

            <input name="submit" type="submit">
        </form>

    </jsp:attribute>

</t:general>
