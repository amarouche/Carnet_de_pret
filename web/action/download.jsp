<%--
  Created by IntelliJ IDEA.
  User: ouahab
  Date: 17/03/2017
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String filename = "carnet.xml";
    String filepath = "";
    response.setContentType("APPLICATION/OCTET-STREAM");
    response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");

    java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);

    int i;
    while ((i=fileInputStream.read()) != -1) {
        out.write(i);
    }
    fileInputStream.close();
%>

