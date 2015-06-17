<%--
  Created by IntelliJ IDEA.
  User: alessio
  Date: 22/05/15
  Time: 09:25
  To change this template use File | Settings | File Templates.
--%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<t:general>

  <jsp:attribute name="title">Prodotti di Haja</jsp:attribute>
    <jsp:attribute name="yield">

    <head>
        <link href="../../../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    </head>

        <sec:authorize access="hasRole('ROLE_ADMIN')">
          <head>
             <div class="row">
                 <div class="box">
                     <div class="col-lg-12">

                        <form:form method="post" action="/administrator/product/add" commandName="product">

                        <form:label path="name">Nome:</form:label>
                        <form:input path="name"/>

                        <form:label path="description">Descrizione:</form:label>
                        <form:input path="description"/>

                        <form:label path="price">Prezzo:</form:label>
                        <form:input path="price"/>

                        <form:label path="quantity">Quanit&#224</form:label>
                        <form:input path="quantity"/>

                          <input type="submit" value="inserisci">

                        </form:form>

                     </div>
                 </div>
             </div>
          </head>
        </sec:authorize>

      <div class="row">
      <div class="box">
      <div class="col-lg-12">

      <c:if test="${!empty products}">
        <h3>Catalogo Prodotti</h3>
        <table>
          <thead>
          <tr>
            <th>&nbsp&nbspNome&nbsp&nbsp</th>
            <th>&nbsp&nbspDescrizione Prodotto&nbsp&nbsp</th>
            <th>&nbsp&nbspPrezzo&nbsp&nbsp</th>
            <th>&nbsp&nbspDisponibilit&agrave&nbsp&nbsp</th>
          </tr>
          </thead>
          <tbody>

          <c:forEach items="${products}" var="product">
            <tr>
              <td>${product.name}&nbsp&nbsp</td>
              <td>&nbsp&nbsp${product.description}&nbsp&nbsp</td>
              <td>&nbsp&nbsp&euro; ${product.price}&nbsp&nbsp</td>
              <td>&nbsp&nbsp${product.quantity}&nbsp&nbsp</td>

                <td>
                    <p>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <form action="/administrator/product/delete/${product.id}" method="post">
                        <input type="submit" value="Rimuovi"/></form>
                        </sec:authorize>
                     </p>
                </td>


                <td>
                    <p
                            data-name="${product.name}"
                            data-description="${product.description}"
                            data-price="${product.price}"
                            data-quantity="${product.quantity}"
                            data-id="${product.id}"

                            <sec:authorize access="hasRole('ROLE_USER')">
                            title="acquista ora" class="acquista btn" <input type="submit" value="Acquista ora"/>
                            </sec:authorize>
                    </p>
                </td>

            </tr>
          </c:forEach>
          </tbody>
          </table>
          <sec:authorize access="hasRole('ROLE_USER')"><h1 id="confermaOrdine">Conferma ordine</h1></sec:authorize>

        </c:if>
        </div>
        </div>
        </div>



    </jsp:attribute>

</t:general>