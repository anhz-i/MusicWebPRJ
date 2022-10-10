<%-- 
    Document   : Update
    Created on : Jul 7, 2022, 3:20:43 PM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                width: 50%;
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
        <%
             songs s = (songs) request.getAttribute("song");
              List<albums> albumList = (List<albums>) request.getAttribute("albumList");

              Date date = new Date();
         SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
         simpleDateFormat.applyPattern("yyyy");
         String format = simpleDateFormat.format(date);
         int curYear = Integer.parseInt(format);
        %>
        <%--<%=al%>--%>
        <h2>Update Song</h2>
        <form action="UpdateSong" method="post">
            <div class="box"> 
                Id: <input type="number" readonly name="id" value="<%=s.getId()%>"  /> <br/>
            </div>
            <div class="box"> 
                Name: <input type="name" name="name" value="<%=s.getName()%>" /> <br/>
            </div>
            <div class="box">  
                Song Url: </br>
            </div>
            <div class="box"> 
                Original file: <input readonly type="text" name="songUrl_rep" value=<%=s.getSongUrl()%> /> &nbsp; 
            </div> 
            <div class="box"> 
                Change file: <input type="file" name="songUrl"/ accept="audio/*"> <br/>
            </div>
            <div class="box"> 
                Public Year: <input type="number" max="<%=curYear%>" min="0" name="pubYear" value="<%=s.getPubYear()%>" /> <br/>
            </div>
            <div class="box"> 
                Author Name: <input type="name" name="authorName" value="<%=s.getAuthorName()%>" /> <br/>
            </div>
            <div class="box"> 
                Lyrics: </br> <textarea type="text"  name="lyrics"><%=s.getLyrics()%></textarea> <br/>
            </div> 
            <div class="box"> 
                Album ID: <select name="albumId">
                    <option>None</option>
                    <%
                    for(albums al: albumList)
                    {
                    %>
                    <option <%=(al.getId()==s.getAlbumId())?"selected":""%>><%=al.getId()%></option>
                    <%}%>
            </div>
        </select> </br>
        <button>Save</button>
    </form>
</body>
</html>
