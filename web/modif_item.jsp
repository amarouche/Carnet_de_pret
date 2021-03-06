<%@ page import="org.jdom2.input.SAXBuilder" %>
<%@ page import="org.jdom2.Document" %>
<%@ page import="org.jdom2.Element" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ouahab
  Date: 16/03/2017
  Time: 13:15
  To change this template use File | Settings | File Templates.
  <a href="action/save.jsp?ids=<%=id%>&nom=<%=nom%>&prenom=<%=prenom%>" class="btn waves-effect waves-light">Enregistrer
                <i class="material-icons right">send</i></a>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <h3 class="panel-title">Modification de l'item</h3>
            </div>
            <%
                SAXBuilder builder = new SAXBuilder();
                Document document = (Document) builder.build("carnet.xml");
                Element rootNode = document.getRootElement();
                List<Element> list = rootNode.getChildren("personne");
                String id = request.getParameter("ids");
                String objet = request.getParameter("objet");
                int idd = Integer.parseInt(id);
                String nbr = null;
                int ids = 0;
                for (int i = 0; i < list.size(); i++) {
                    List<Element> list2 = list.get(i).getChild("Items").getChildren();
                    nbr = list.get(i).getAttribute("id").getValue();
                   ids = Integer.parseInt(nbr);
                    if (idd == ids)
                    {
                       for (int z = 0; z < list2.size(); z++)
                        {
                            String ob = list2.get(z).getChild("objet").getText();
                                if (ob.equals(objet)){
                                    String obj = list2.get(z).getChild("objet").getText();
                                    String ty = list2.get(z).getChild("type").getText();
                                    String date = list2.get(z).getChild("Date").getText();
                %>
                                        <form  action="action/save.jsp" method="GET">
                                            <div class="row">
                                                <div class="col-sm-3"></div>
                                                <div class="col-sm-6">
                                                    <div class="form-group"><br>
                                                        <label>Objet</label>
                                                        <input type="text" class="form-control" name="objet" value="<%=obj%>" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Type</label>
                                                        <input type="text" class="form-control" name="type" value="<%=ty%>" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Date</label>
                                                        <input type="date" class="form-control" name="date" value="<%=date%>" >
                                                        <input type="hidden" name="ids" value="<%=idd%>">
                                                        <input type="hidden" name="ancien" value="<%=obj%>">
                                                    </div>
                                                </div>
                                            </div>
                                            <button class="waves-effect green darken-3 btn " style="left: 40%;" type="submit">Enregistrer</button>
                                        </form>
                <%
                                }
                            }
                    }
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
