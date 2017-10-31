<%@page language="java" contentType="text/html"%>
<%@page import="java.util.Hashtable"%>
<%@page import="eshop.beans.CartItem"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Check Out</title>
  <link rel="stylesheet" href="/eshop/css/eshop.css" type="text/css"/>
  </head>
<body>
<jsp:include page="TopMenu.jsp" flush="true"/>
<jsp:include page="LeftMenu.jsp" flush="true"/>
<div class="content">
  <h2>CheckOut</h2>
<%
  @SuppressWarnings("unchecked")
  Hashtable<String, CartItem> shoppingCart =
      (Hashtable<String, CartItem>)session.getAttribute("shoppingCart");
  if (shoppingCart != null && !shoppingCart.isEmpty()) {
  %>
    <form action="">
      <input type="hidden" name="action" value="orderConfirmation"/>
      <table class="checkout">
        <tr>
          <th colspan="2">Defenir detalle</th>
          </tr>
        <tr>
          <td>Nombre de Contacto:</td>
          <td><input type="text" name="contactName"/></td>
          </tr>
        <tr>
          <td>Dirrecion de envio:</td>
          <td><input type="text" name="deliveryAddress"/></td>
          </tr>
        <tr>
          <th colspan="2">Detalles de la tarjeta de credito</th>
          </tr>
        <tr>
          <td>Nombre de la tarjeta de credito:</td>
          <td><input type="text" name="ccName"/></td>
          </tr>
        <tr>
          <td>Numero de la tarjeta de credito:</td>
          <td><input type="text" name="ccNumber"/></td>
          </tr>
        <tr>
          <td>Fecha de expiracion de la tarjeta de credito:</td>
          <td><input type="text" name="ccExpiryDate"/></td>
          </tr>
        <tr>
          <td>&nbsp;</td>
          <td><input type="submit" value="Confirmar orden"/></td>
          </tr>
        </table>
      </form>
<%
    }
  else {
    %><p class="error">ERROR: Tu compra no ha sido validada!</p><% 
    }
  %>
  </div>
</body>
</html>
