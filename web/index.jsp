<%--
  Created by IntelliJ IDEA.
  User: ouahab
  Date: 13/03/2017
  Time: 14:45
  To change this template use File | Settings | File Templates.
  Nom: <input type="text" name="first_name"> <br />
  Prenom: <input type="text" name="last_name" /> <br />
  Nom du produit: <input type="text" name="product_name" /> <br />
  Type: <input type="text" name="type" /> <br />
  Date: <input type="text" name="date" /> <br /><br />
--%>


<%@ page import="projet.*" %>
<%@ page import="org.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>$Title$</title>
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
<div class="row" >
  <div class="col-sm-2"></div>
  <div class="col-sm-8">
    <div class="panel panel-success">
      <div class="panel-heading">Ajout des personnes</div>
    <form action="action/recup.jsp" method="GET">
      <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6"><br><br>
          <div class="form-group">
            <label>Nom</label>
            <input type="text" class="form-control" name="first_name" required>
          </div>
          <div class="form-group">
            <label>Prenom</label>
            <input type="text" class="form-control" name="last_name" required>
          </div>
          <div class="alert alert-warning" role="alert">
            <p>Ajoutez l'objet</p>
          </div>
          <div class="form-group">
            <label>Objet</label>
            <input type="text" class="form-control" name="product_name" required>
          </div>
          <div class="form-group">
            <label>Type</label>
            <input type="text"class="form-control" name="type" required>
          </div>
          <div class="form-group">
            <label>Date</label>
            <input type="date" class="form-control" name="date">
          </div>
          <button class="waves-effect light-blue darken-4 btn " type="submit">Ajouter !</button>
          <input type="button"  class="waves-effect light-blue darken-4 btn " onclick="location.href='table.jsp';" value="voir toutes les personnes" />

        </div>
      </div>
      <br>
      <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
            <div class="alert alert-info" role="alert">
              <strong>Important !</strong> Pour ajouter des items à des personnes il vous suffit d'écrire le nom et le prenom de cette personne!
            </div>
            </div>
      </div>
      </form>

    </div>
  </div>
</div>
  </body>
</html>


