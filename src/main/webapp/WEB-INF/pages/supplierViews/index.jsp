<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<t:general>
    <jsp:attribute name="title">I nostri Fornitori</jsp:attribute>
    <jsp:attribute name="yield">

    <head>
        <link href="../../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="../../../bootstrap/css/business-casual.css" rel="stylesheet" type="text/css">
    </head>

        <sec:authorize access = "hasRole('ROLE_ADMIN')">
      <div class="row">
             <div class="box">
                 <div class="col-lg-12">

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
                </div>
            </div>
        </div>
        </sec:authorize>


        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                      <c:if test="${!empty suppliers}">
                          <h3>Fornitori</h3>
                          <table class="table table-bordered table-striped"> <!--intabellamento-->
                              <thead>
                              <tr>
                                  <th>&nbsp&nbspFornitore&nbsp&nbsp</th>
                                  <th>&nbsp&nbspIva&nbsp&nbsp</th>
                                  <th>&nbsp&nbspEmail&nbsp&nbsp</th>
                                  <th>&nbsp&nbspNumero di telefono&nbsp&nbsp</th>
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
                                          <sec:authorize access = "hasRole('ROLE_ADMIN')">
                                          <form action="/administrator/supplier/delete/${supplier.id}" method="post"><input type="submit" class="btn btn-danger btn-mini" value="Rimuovi"/></form>
                                          </sec:authorize>
                                      </td>
                                  </tr>
                              </c:forEach>
                              </tbody>
                          </table>
                      </c:if>
                </div>
            </div>
        </div>
        
    </jsp:attribute>

</t:general>