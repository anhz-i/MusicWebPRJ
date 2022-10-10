<%-- 
    Document   : AllAlbums
    Created on : Jun 23, 2022, 8:02:50 AM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <script>
            function deleteAlbum(id)
            {
                var result = confirm("Are you sure?");
                if (result)
                {
                    window.location.href = "UpdateAlbum?id=" + id + "&value=1";
                }
            }

        </script>

        <script src="https://kit.fontawesome.com/b40c975c82.js" crossorigin="anonymous"></script>

        <style>
            *{
                color: white;
            }
            img{
                width:100px;
                height:100px;
                border-radius: 10px;
                z-index:100;
                border: 1px white solid;
            }
            body, table{
                margin-top: 20px;
                text-align: center;
            }
        </style>

    </head>
    <body>

    <center>
        <h1>List of Albums</h1>
        <h3><a href="AddAlbum">Add an album</a></h3>
        <table border="1px solid white" width="70%" >
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Image</th>
                <th>Describe</th>
                <th>Action</th>
            </tr>

            <c:forEach items="${albumList}" var="i">
                <c:set var="id" value="${i.id}"/>
                <tr>
                    <td>${id}</td>
                    <td><a href="${pageContext.request.contextPath}/Songs_Album?albumId=${id}" style="text-decoration: none; font-weight: bold; color: purple">${i.name}</a></td>
                    <td><img src="${pageContext.request.contextPath}/Images/${i.imgUrl}" alt="NotUpdate"/></td>
                    <td>${i.describe}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/UpdateAlbum?id=${i.id}&value=0">Update</a> &nbsp;
                        <a href="#" onclick="deleteAlbum(${i.id});">Delete</a>

                    </td>
                </tr>
            </c:forEach>
        </table>
    </center>
</body>
</html>
