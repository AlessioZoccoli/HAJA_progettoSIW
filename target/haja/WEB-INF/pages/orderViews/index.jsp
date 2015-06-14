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
        <html>
        <head>
          <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
          <title>ORDINI</title>
        </head>
        <body>

        <c:if test="${!empty orders}">
          <h3>Ordini</h3>
          <table>
            <thead>
            <tr>
              <th>IdOrdine</th>
              <th>creazione</th>
              <th>chiusura</th>
              <th>evasione</th>
              <th>IdUtente</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="order">
              <tr>
                <td>${order.id}</td>
                <td>${order.creationDate}</td>
                <td>${order.closingDate}</td>
                <td>${order.evasionDate}</td>
                <td>${order.user.id}</td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </c:if>

        </body>
        </html>


    </jsp:attribute>

</t:general>
