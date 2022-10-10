<%-- 
    Document   : Management
    Created on : Jul 7, 2022, 2:48:56 PM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        <link href="<c:url value="/CSS/HomeStyle.css"/>" rel="stylesheet">
        <script>
            function deleteSong(id)
            {
                var result = confirm("Are you sure?");
                if (result)
                {
                    window.location.href = "UpdateSong?id=" + id + "&value=1";
                }
            }

        </script>
        <script src="https://kit.fontawesome.com/b40c975c82.js" crossorigin="anonymous"></script>

        <style>
            *{
                color: white;
            }
            body, table{
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
    <center>
        <h1>List of Songs</h1>
        <h3><a href="${pageContext.request.contextPath}/AddSong">Add a song</a></h3>
        <table border="1px solid white" width="70%" >
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Action</th>
            </tr>

            <c:forEach items="${songList}" var="i">
                <c:set var="id" value="${i.id}"/>
                <tr>
                    <td>${id}</td>
                    <td>${i.name}</td>

                    <td>
                        <a href="${pageContext.request.contextPath}/PlaySong?id=${i.id}">Play</a> &nbsp;
                        <a href="${pageContext.request.contextPath}/MP3/${i.songUrl}" download="${i.name}">Download</a> &nbsp;
                        
                        <a href="${pageContext.request.contextPath}/UpdateSong?id=${i.id}&value=0">Update</a> &nbsp;
                        <a href="#" onclick="deleteSong(${i.id});">Delete</a>

                    </td>
                </tr>
            </c:forEach>
        </table>
    </center>
</body>
</html>
