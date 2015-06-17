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
  <jsp:attribute name="title">Ordini</jsp:attribute>
  <jsp:attribute name="yield">
    
     <head>
       <link href="../../../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
       <link href="../../../bootstrap/css/business-casual.css" rel="stylesheet" type="text/css">
     </head>

       <div class="row">
         <div class="box">
           <div class="col-lg-12">
             <title>ORDINI</title>

             <body>


             <c:if test="${!empty orders}">
               <h3>Ordini</h3>
               <table class="table table-bordered table-striped"> <!--intabellamento-->
                 <thead>
                 <tr>
                   <th>ID ordine</th>
                 </tr>
                 </thead>
                 <tbody>
                 <c:forEach items="${orders}" var="order">
                   <tr>
                     <td>${order.id} </td>
                   </tr>
                 </c:forEach>
                 </tbody>
               </table>
             </c:if>
             <sec:authorize access="isAuthenticated()">
               <sec:authorize access="hasRole('ROLE_USER')">
                 <div class="widget">
                   <h3>Il tuo carrello ${sessionScope['scopedTarget.currentOrder'].id}</h3>
                   <ul id="currentCart">
                   </ul>
                   <div class="total" id="totalCart"></div>
                   <a id="confermaOrdine" class="btn" href="#">Conferma ordine <i class="fa fa-shopping-cart"></i></a><br/>
                   <a id="svuotaCarrello" class="btn" href="#">Annulla ordine <i class="fa fa-trash"></i></a>
                 </div>
               </sec:authorize>
             </sec:authorize>
             </body>
           </div>
         </div>
       </div>
     </head>

     </html>


    </jsp:attribute>


</t:general>

