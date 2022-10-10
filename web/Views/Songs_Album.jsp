<%-- 
    Document   : Songs_Album
    Created on : Jun 23, 2022, 3:38:42 PM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="dal.MyConnect" %>
<%@page import="model.songs" %>
<%@page import="java.util.*" %>
<%@page import="java.util.Objects" %>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value="/CSS/HomeStyle.css"/>" rel="stylesheet">

        <script src="https://kit.fontawesome.com/b40c975c82.js" crossorigin="anonymous"></script>
        <style>
            *{
                color: white;
            }
             a{
                color: blue;
                text-decoration: none
            }
            a:hover{
                color: white
            }
            button {
                padding: 5px;
                background-color: rgba(100,100,100,0.5)
            }
            button:hover{
                color: black;
                background-color: rgba(100,100,100,0.8)
            }
            table{
                width: 90%;
                text-align: center
            }
            mark{
                background-color: transparent;
                color: white;
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
        <h2 style="margin:20px 50px">List of songs in album <mark>${requestScope.albumName}</mark></h2>
    <center>
        <table border="1px solid white" width="70%" >
            <tr>
                <th>Name</th>
                <th>Singer</th>
                <th>Musician</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${requestScope.songsInAlbum}" var="song">
                <c:set var="songid" value="${song.id}"/>
                <tr>
                    <td>${song.name}</td>
                    <td>

                        <%
                        MyConnect mycon = new MyConnect();
                        int id = (Integer)pageContext.getAttribute("songid");
                        HashMap<Integer, String> hmSinger_Song = mycon.getHmSinger_Song(id);
//                        String s = hmSing
                       
                        for (Map.Entry<Integer, String> entry : hmSinger_Song.entrySet()) {
                            int key = entry.getKey();
                            String val = entry.getValue();
//                            response.getWriter().println(key +"  "+val);
                        %>
                        <a href="SingerInfor?id=<%=key%>"><%=val%></a><br>
                        <%
                        }
                        %>

                    </td>
                    <td>${song.authorName}</td>
                    <td>

                        <!--<a href="" style="color: blue;"; text-decoration: none ">Play Song</a>-->
                        <button><a href="PlaySong?id=${song.id}">Play</a></button> 
                            <c:if test="${sessionScope.loginUser!=null}">
                            <button type="submit" name="play" style="cursor: pointer"><a href="${pageContext.request.contextPath}/MP3/${song.songUrl}" download="${i.name}">Download</a></button>
                            </c:if>

                    </td>
                </tr>
            </c:forEach>

        </table>
    </center>
</body>
    <%@include file="Footer.jsp" %>

</html>
<%--<c:redirect url="/controller/Singer_Song?songId=${song.id}"></c:redirect>--%>

