<%--
  Created by IntelliJ IDEA.
  User: ouahab
  Date: 15/03/2017
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="projet.projet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>
<style>
    filterable {
        margin-top: 15px;
    }
    .filterable .panel-heading .pull-right {
        margin-top: -20px;
    }
    .filterable .filters input[disabled] {
        background-color: transparent;
        border: none;
        cursor: auto;
        box-shadow: none;
        padding: 0;
        height: auto;
    }
    .filterable .filters input[disabled]::-webkit-input-placeholder {
        color: #333;
    }
    .filterable .filters input[disabled]::-moz-placeholder {
        color: #333;
    }
    .filterable .filters input[disabled]:-ms-input-placeholder {
        color: #333;
    }
</style>
    <title>Title</title>
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
                <h3 class="panel-title">Tableau des personnes</h3>
            </div>
            <table class="table">
                <thead>
                <tr class="filters">
                    <th>Nom</th>
                    <th>Prenom</th>
                    <th>Items</th>
                    <th>Modifier</th>
                    <th>Supprimer</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${projet.returnList()}" var="personne">
                <tr>
                    <td>${personne.getChild("nom").getText()}</td>
                    <td>${personne.getChild("prenom").getText()}</td>
                    <td>
                        <input type="button"  class="waves-effect light-blue darken-4 btn " onclick="location.href='items.jsp?ids=${personne.getAttribute("id").getValue()}';" value="Voir les items" />
                    </td>
                    <td>
                        <input type="button"  class="waves-effect  amber accent-4 btn " onclick="location.href='modifier.jsp?ids=${personne.getAttribute("id").getValue()}';" value="Modifier" />
                    </td>
                    <td>
                        <input type="button"  class="waves-effect deep-orange darken-4 btn " onclick="location.href='action/delete.jsp?ids=${personne.getAttribute("id").getValue()}';" value="Supprimer" />
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <input type="button"  class="waves-effect grey lighten-1 btn " style="left: 65%;" onclick="location.href='index.jsp';"value="Retour" />
        <input type="button"  class="waves-effect green darken-3 btn " style="left: 65%;" onclick="location.href='action/download.jsp';"value="Télécharger"/>


    </div>
</div>
</body>
</html>
