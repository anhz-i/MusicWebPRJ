<%-- 
    Document   : Home.jsp
    Created on : Jun 20, 2022, 5:37:25 PM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="controller.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HotSound - Website nghe nhạc miễn phí dành cho bạn</title>
        <link href="<c:url value="/CSS/HomeStyle.css"/>" rel="stylesheet">

        <script src="https://kit.fontawesome.com/b40c975c82.js" crossorigin="anonymous"></script>



    </head>

    <body class="">
        
        <c:set var="ses" value="${sessionScope.loginUser}"/>
        <c:if test="${ses == null}">       
            <%@include file="Guest/Header.jsp" %>
        </c:if>
        <c:if test="${ses != null}">         
            <%@include file="User/Header.jsp" %>
        </c:if>


        <%@include file="Menu-Slide.jsp" %>

        <%@include file="Body.jsp" %>
        <%@include file="Footer.jsp" %>


    </body>
</html>
