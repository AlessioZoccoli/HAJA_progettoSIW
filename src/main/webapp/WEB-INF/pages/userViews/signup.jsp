<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:general>
    <jsp:attribute name="title">signup</jsp:attribute>
    <jsp:attribute name="yield">

        <head>
            <link href="../../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
            <link href="../../../bootstrap/css/business-casual.css" rel="stylesheet" type="text/css">
        </head>

        <div class="row">
             <div class="box">
                 <div class="col-lg-12">
                        <h1>Registrati</h1>

                        <form:form id="form-data" method="post" action="/signup" modelAttribute="user">

                            <form:label path="nickname">Nickname:</form:label>
                            <form:input path="nickname"/>

                            <form:label path="firstName">Nome:</form:label>
                            <form:input path="firstName"/>

                            <form:label path="lastName">Cognome:</form:label>
                            <form:input path="lastName"/>

                            <form:label path="email">Email:</form:label>
                            <form:input path="email"/>

                            <form:label path="password">Password</form:label>
                            <form:input type="password" path="password"/>

                            <form:label path="address.city">Citt&#224:</form:label>
                            <form:input path="address.city"/>

                            <form:label path="address.cap">Cap:</form:label>
                            <form:input path="address.cap"/>

                            <form:label path="address.address_line">Indirizzo:</form:label>
                            <form:input path="address.address_line"/>

                            <form:label path="birthDate">Data di nascita: (dd/MM/yyyy)</form:label>
                            <form:input path="birthDate"/>

                            <input type="submit" value="registrati">

                        </form:form>
                 </div>
             </div>
        </div>

    </jsp:attribute>

</t:general>
