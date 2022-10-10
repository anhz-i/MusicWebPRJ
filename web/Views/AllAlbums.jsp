<%-- 
    Document   : AllAlbums
    Created on : Jun 23, 2022, 8:02:50 AM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="controller.*" %>

<%--<%@page import="java.util.List" %>
<%@page import="model.albums" %>--%>


<!DOCTYPE html>
<html>


    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        <link href="<c:url value="/CSS/HomeStyle.css"/>" rel="stylesheet">
        <link href="<c:url value="/CSS/styles.css"/>" rel="stylesheet">

        <script src="https://kit.fontawesome.com/b40c975c82.js" crossorigin="anonymous"></script>

        <style>
            *{
                color: white;
            }

            p {
                margin: auto;
                color: black;
                width: 80%;
                overflow: hidden;
                text-overflow: ellipsis;
                line-height: 25px;
                -webkit-line-clamp: 2;
                display: -webkit-box;
                -webkit-box-orient: vertical;
            }
        </style>

    </head>
    <body>

        <c:set var="ses" value="${sessionScope.loginUser}"/>
        <c:if test="${ses == null}">       
            <%@include file="Guest/Header.jsp" %>
        </c:if>
        <c:if test="${ses != null}">         
            <%@include file="User/Header.jsp" %>
        </c:if>

        <%@include file="Menu-Slide.jsp" %>


        <h2 style="margin: 20px 50px;">All Albums</h2>

        <c:set var="page" value="${requestScope.page}"/>
        <div style="margin-left:50px" class="pagination">

            <c:forEach begin="${1}" end="${requestScope.np}" var="i">
                <a style="color: white" class="${(i==page)?"active":""}" href="AllAlbums?page=${i}">${i}</a>
            </c:forEach>
        </div>   

        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <!-- 1 -->
                    <c:forEach items="${requestScope.albumList}" var="al">

                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Product image-->
                                <img style="width: 100%; height: 200px" src="${pageContext.request.contextPath}/Images/${al.imgUrl}" alt="NotUpdate"/>
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h6 style="color:black" class="fw-bolder">${al.name}</h6>
                                        <!-- Product price-->
                                        <p style="font-size: 10px">${al.describe}</p>
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center">
                                        <a style="width: 50px; height: 100%; font-size: 10px;" class="btn btn-outline-dark mt-auto" href="Songs_Album?albumId=${al.id}">View</a>
                                        <a style="width: 50px; height: 100%; font-size: 10px;" class="btn btn-outline-dark mt-auto" href="PlayAlbum?albumId=${al.id}">Play</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
         <%@include file="Footer.jsp" %>
    </body>
</html>
