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

<head>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
</head>


<t:general>

  <jsp:attribute name="title">Prodotti di Haja</jsp:attribute>
    <jsp:attribute name="yield">

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

    <c:if test="${!empty products}">
      <h3>Catalogo Prodotti</h3>
      <table>
        <thead>
        <tr>
          <th>Nome</th>
          <th>Descrizione Prodotto</th>
          <th>Prezzo</th>
          <th>Disponibilit&agrave</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="product">
          <tr>
            <td>${product.name}</td>
            <td>${product.description}</td>
            <td>&euro; ${product.price}</td>
            <td>${product.quantity}</td>
            <td>
              <form action="/administrator/product/delete/${product.id}" method="post"><input type="submit" value="Rimuovi"/></form>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </c:if>

    </jsp:attribute>

</t:general>