<%-- 
    Document   : Add
    Created on : Jul 5, 2022, 12:27:50 PM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.*"%>
<%@page import=" java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            textarea {
                width: 40%;
                height: 300px;
                padding: 12px 20px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                background-color: #f8f8f8;
                resize: none;
            }

            body {
                padding: 50px;
                color: white;
                background-color: rgb(26, 27, 58);
                /*display: flex;*/
                /*justify-content: center;*/
                font-family: 'Courier New', Courier, monospace;
                font-size: 30px;
            }

            button{
                height: auto;
                border:none;
                border-radius: 5px;
                border: 1px solid black;
                background-color: rgb(250, 247, 247);
                margin: 10px;
                padding: 10px;
                box-sizing: border-box;
                font-size: 25px;


            }

            button:hover{
                background-color: rgba(0, 0, 0, 0.666);
                color: white;
                border: 1px solid white;
                cursor: pointer;

            }

            input[type="text"], input[type="number"]{
                padding: 0 10px;
                background-color: rgb(250, 247, 247);
                height: 30px;
                border: 1px solid black;
                border-radius: 3px;
                margin-bottom: 10px;
            }
            .box{
                margin: 10px;
            }
            
            select{
                width: auto;
                height: 30px;
            }
        </style>
    </head>
    <body>
        <c:if test="${requestScope.err!=null}"><h4 style="color: red">${requestScope.err}</h4></c:if>
        <c:set var="name" value=""/>
        <c:set var="authorName" value=""/>
        <c:set var="lyrics" value=""/>

        <c:if test="${requestScope.infor!=null}">
            <c:set var="name" value="${requestScope.infor.name}"/>
            <c:set var="pubYear" value="${requestScope.infor.pubYear}"/>
            <c:set var="authorName" value="${requestScope.infor.authorName}"/>
            <c:set var="lyrics" value="${requestScope.infor.lyrics}"/>
        </c:if>

        <%
        int albumId=-1;
        songs s =  (songs) request.getAttribute("infor") ;
                if(s!=null) 
                    albumId=s.getAlbumId();
            
        List<albums> albumList = (List<albums>) request.getAttribute("albumList");
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
        simpleDateFormat.applyPattern("yyyy");
        String format = simpleDateFormat.format(date);
        int curYear = Integer.parseInt(format);
        %>
        <h2>Add new song</h2>
        <form action="${pageContext.request.contextPath}/AddSong" method="post">
            <div class="box"> 
                Id: <input type="number" name="id" required /> <br/>
            </div>
            <div class="box">   
                Name: <input type="text" name="name" value = "${name}" required /> <br/>
            </div>
            <div class="box">  
                Song Url: <input type="file" name="songUrl" accept="audio/*"required /> <br/>
            </div>
            <div class="box">  
                Public Year: <input type="number" max="<%=curYear%>" min="0" name="pubYear" value="${pubYear}"> <br/>
            </div>
            <div class="box">  
                Author Name: <input type="text" name="authorName" value = "${authorName}" /> <br/>
            </div>
            <div class="box">  
                Lyrics: </br> <textarea type="text"  name="lyrics" value = "Not Updated Yet">${lyrics}</textarea> <br/>
            </div>
            <div class="box">   
                Album ID: <select name="albumId">
                    <option  >None</option>
                    <%
                    for(albums al: albumList)
                    {
                    %>
                    <option <%=(al.getId()==albumId)?"selected":""%>><%=al.getId()%></option>
                    <%}%>
            </div>
        </select> </br>
        <button>Add</button>
    </form>
</body>
</html>
