<%@page language="java" contentType="text/html"%>
<%
  String base = (String)application.getAttribute("base");
  String imageURL = (String)application.getAttribute("imageURL");
  %>
<div class="header">
  <div class="logo">
    <p>Compre aqu� su libro......</p>
    </div>
  <div class="cart">
    <a class="link2" href="<%=base%>?action=showCart">Mostrar Pedido
      <img src="<%=imageURL%>cart.gif" border="0"/></a>
    </div>
  </div>