<%@page language="java" contentType="text/html"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="eshop.beans.Book"%>
<jsp:useBean id="dataManager" scope="application"
  class="eshop.model.DataManager"/>
<% String base = (String)application.getAttribute("base"); %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Buscar Resultado</title>
  <link rel="stylesheet" href="/eshop/css/eshop.css" type="text/css"/>
  </head>
<body>
<jsp:include page="TopMenu.jsp" flush="true"/>
<jsp:include page="LeftMenu.jsp" flush="true"/>
<%
  String keyword = request.getParameter("keyword");
  if (keyword != null && !keyword.trim().equals("")) {
  %>
    <div class="content">
      <h2>Buscar Resultado</h2>
      <table>
        <tr>
          <th>Titulo</th>
          <th>Autor</th>
          <th>Precio</th>
          <th>Detalle</th>
          </tr>
<%
        ArrayList<Book> books = dataManager.getSearchResults(keyword);
        Iterator<Book> iterator = books.iterator();
        while (iterator.hasNext()) {
          Book book = (Book)iterator.next();
          String pId = book.getId();
  %>
          <tr>
            <td><%=book.getTitle()%></td>
            <td><%=book.getAuthor()%></td>
            <td><%=book.getPrice()%></td>
            <td>
            <a class="link1"href="<%=base%>?action=bookDetails&bookId=<%=pId%>"> Detalles</a>
            </td>
	        </tr>
<%
          }
  %>
          </table>
        </div>
<%
    }
  else {
    %><p class="error">Invalida clave a Buscar!</p><%
    }
  %>
</body>
</html>
