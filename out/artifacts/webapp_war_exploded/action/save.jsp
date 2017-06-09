<%--
  Created by IntelliJ IDEA.
  User: ouahab
  Date: 16/03/2017
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="projet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("ids");
    String nom = request.getParameter("nom");
    String prenom = request.getParameter("prenom");
    String obj = request.getParameter("objet");
    String type = request.getParameter("type");
    String date = request.getParameter("date");
    String ancien = request.getParameter("ancien");

    if(id != null && nom != null && prenom != null)
    {
        int idd = Integer.parseInt(id);
        save.save_persone(idd,nom,prenom);
        String redirectURL = "../table.jsp";
        response.sendRedirect(redirectURL);
    }

    else
    {
        //System.out.println(obj+ " " +type + " " + date+" "+id );
        int idd = Integer.parseInt(id);
        save.save_items(idd,obj,type,date,ancien);
        String redirectURL = "../items.jsp?ids="+idd+"";
        response.sendRedirect(redirectURL);
    }

%>
