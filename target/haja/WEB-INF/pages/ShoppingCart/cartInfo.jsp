<%--
  Created by IntelliJ IDEA.
  User: alessio
  Date: 14/06/15
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<head>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
</head>

<t:general>

  <jsp:attribute name="title">Carrello</jsp:attribute>
  <jsp:attribute name="yield">

        <c:>
          ${cart.user.firstName}
        </c:>

    </jsp:attribute>

</t:general>

