<%-- 
    Document   : Menu
    Created on : Jun 20, 2022, 11:39:21 PM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link href="<c:url value="/CSS/HomeStyle.css"/>" rel="stylesheet">

    </head>
    <body>
         <ul class="menu">
                <li class="op"><a href="${pageContext.request.contextPath}/Home">Home</a></li>
                <li class="op"><a href="${pageContext.request.contextPath}/Views/AboutUs.jsp">About Us</a></li>
                <li class="op"><a href="${pageContext.request.contextPath}/AllAlbums">All Albums</a></li>
                <li class="op"><a href="">Contact us</a></li>
            </ul>
    </body>
</html>
