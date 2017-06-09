<%@ page import="projet.delete" %><%--
  Created by IntelliJ IDEA.
  User: ouahab
  Date: 15/03/2017
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("ids");
    int idd = Integer.parseInt(id);
    delete.delete_perso(idd);

    String redirectURL = "../table.jsp";
    response.sendRedirect(redirectURL);
%>
