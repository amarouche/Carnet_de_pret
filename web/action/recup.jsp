<%--
  Created by IntelliJ IDEA.
  User: ouahab
  Date: 15/03/2017
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="projet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String nom = request.getParameter("first_name");
    String prenom = request.getParameter("last_name");
    String Type = request.getParameter("type");
    String date = request.getParameter("date");
    String product_name = request.getParameter("product_name");
    projet.CreatePerso(nom,prenom,Type,date,product_name);
    String redirectURL = "../index.jsp";
    response.sendRedirect(redirectURL);
%>
