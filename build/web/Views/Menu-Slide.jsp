<%-- 
    Document   : Menu
    Created on : Jun 20, 2022, 11:34:43 PM
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
        <link href="<c:url value="/styles.css"/>" rel="stylesheet">

        <style>
            .menu-slide{
                background-image: url(${pageContext.request.contextPath}/Images/Untitled.jpg);
                background-repeat: no-repeat;
                background-size: contain;
            }
        </style>
    </head>
    <body>
        <hr>
        <div class="menu-slide">
            <%@include file="Menu.jsp" %>
            <div id="slideshow">
                <div class="slide-wrapper">
                    <div class="slide">
                        <img src="${pageContext.request.contextPath}/Images/maxresdefault.jpg">
                    </div>
                    <div class="slide">
                        <img src="${pageContext.request.contextPath}/Images/evening-concert-landing.jpg">
                    </div>
                    <div class="slide">
                        <img src="${pageContext.request.contextPath}/Images/attendees-at-an-edm-concert.webp">
                    </div>
                    <div class="slide">
                        <img src="${pageContext.request.contextPath}/Images/music-collection.avif">
                    </div>
                </div>
            </div>
        </div>
        <hr>
    </body>
</html>
