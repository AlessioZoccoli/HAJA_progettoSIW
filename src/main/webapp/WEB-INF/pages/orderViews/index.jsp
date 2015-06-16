<%--
  Created by IntelliJ IDEA.
  User: alessio
  Date: 04/06/15
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<t:general>
  <jsp:attribute name="title">Catalogo Prodotti</jsp:attribute>
  <jsp:attribute name="yield">

      <h1>ordini</h1>

        <c:if test="${!empty orders}">
          <table id="test">
            <thead>
            <tr>
              <th>Cliente</th>
              <th>Creazione</th>
              <th>Chiusura</th>
              <th>Evasione</th>
              <th>Cancella</th>
              <th>Evadi</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="order">
              <tr>
                <td>${order.user.firstName} ${order.user.lastName}, ${order.user.email}, ${order.user.address}</td>
                <td>${order.creationDate}</td>
                <td>${order.closingDate}</td>
                <td>${order.evasionDate}</td>
                <td>
                  <form action="/administrator/orders/delete/${order.id}" method="post"><input type="submit" value="Rimuovi"/></form>
                </td>
                <td>
                  <form action="/administrator/orders/evadi/${order.id}" method="post"><input type="submit" value="Evadi ordine"/></form>
                </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </c:if>

    </jsp:attribute>


</t:general>

