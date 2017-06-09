<%--
  Created by IntelliJ IDEA.
  User: ouahab
  Date: 16/03/2017
  Time: 16:15
  To change this template use File | Settings | File Templates.

--%>
<%@ page import="projet.item" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>
</head>
<body>
<nav class="light-blue darken-4" >
    <div class="nav-wrapper">
        <a href="#" class="brand-logo center">Carnet de pret</a>
    </div>
</nav><br><br><br>
<div class="row">
    <div class="col-sm-3"></div>
    <div class="col-sm-6">
        <div class="panel panel-primary filterable">
            <div class="panel-heading">
                <h3 class="panel-title">Items</h3>
            </div>
            <table class="table">
                <thead>
                <tr class="filters">
                    <th>Objet</th>
                    <th>Type</th>
                    <th>Date</th>
                    <th>Modifier</th>
                </tr>
                </thead>
                <tbody>
                <%
                    String id = request.getParameter("ids");
                    int idd = Integer.parseInt(id);
                    //System.out.println(idd);

                %>
                <c:forEach items="<%=item.recup_item(idd)%>" var="personne">
                    <tr>
                        <td>${personne.getChild("objet").getText()}</td>
                        <td>${personne.getChild("type").getText()}</td>
                        <td>${personne.getChild("Date").getValue()}</td>
                        <td>
                            <input type="button"  class="waves-effect  amber accent-4 btn "
                                   onclick="location.href='modif_item.jsp?ids=<%=id%>&objet=${personne.getChild("objet").getText()}';" value="Modifier" />


                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <input type="button"  class="waves-effect grey lighten-1 btn "style="left: 85%;"  onclick="location.href='table.jsp';"value="Retour" />
    </div>
</div>

</body>
</html>
