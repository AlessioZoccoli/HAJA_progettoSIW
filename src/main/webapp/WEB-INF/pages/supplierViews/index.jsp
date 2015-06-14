<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
</head>

<t:general>
    <jsp:attribute name="title">I nostri Fornitori</jsp:attribute>
    <jsp:attribute name="yield">
        <form:form method="post" action="/administrator/supplier/add" commandName="supplier" class="form">

            <form:label path="name">Nome:</form:label>
            <form:input path="name"/>

            <form:label path="iva">Partita IVA:</form:label>
            <form:input path="iva"/>

            <form:label path="email">Email:</form:label>
            <form:input path="email"/>

            <form:label path="phone">Telefono:</form:label>
            <form:input path="phone"/>


            <input type="submit" value="aggiungi fornitore">

        </form:form>

      <c:if test="${!empty suppliers}">
          <h3>Fornitori</h3>
          <table class="table table-bordered table-striped"> <!--intabellamento-->
              <thead>
              <tr>
                  <th>Fornitore</th>
                  <th>Iva</th>
                  <th>Email</th>
                  <th>Numero di telefono</th>
                  <th>&nbsp;</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${suppliers}" var="supplier">
                  <tr>
                      <td>${supplier.name}</td>
                      <td>${supplier.iva}</td>
                      <td>${supplier.email}</td>
                      <td>${supplier.phone}</td>

                      <td>
                          <form action="/administrator/supplier/delete/${supplier.id}" method="post"><input type="submit" class="btn btn-danger btn-mini" value="Rimuovi"/></form>
                      </td>
                  </tr>
              </c:forEach>
              </tbody>
          </table>
      </c:if>

    </jsp:attribute>

</t:general>