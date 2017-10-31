<%@page language="java" contentType="text/html"%>
<%@page import="java.util.Hashtable"%>
<%@page import="eshop.beans.CartItem"%>
<jsp:useBean id="dataManager" scope="application"
  class="eshop.model.DataManager"/>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Order</title>
  <link rel="stylesheet" href="/eshop/css/eshop.css" type="text/css"/>
  </head>
<body>
<jsp:include page="TopMenu.jsp" flush="true"/>
<jsp:include page="LeftMenu.jsp" flush="true"/>
<div class="content">
  <h2>Order</h2>


      <p class="info">
        Gracias por su compra!!.<br/>
       Su numero de orden es: 
       <% Long orderId =(Long) request.getAttribute("id");%>
       
       <%=orderId%>
        </p>
        
  </div>
</body>
</html>
