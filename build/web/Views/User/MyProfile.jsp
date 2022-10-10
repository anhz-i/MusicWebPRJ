<%-- 
    Document   : MyProfile
    Created on : Jul 9, 2022, 9:18:28 PM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HotSound - Website nghe nhạc miễn phí dành cho bạn</title>
        <!--<link href="<c:url value="/CSS/HomeStyle.css"/>" rel="stylesheet">-->
        <style>
            img{
                width:100px;
                height:100px;
                border-radius: 10px;
                z-index:100;
                border: 1px white solid;
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

                }

                input[type="text"]{
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
            
        </style>
    </head>
    <body>
        <%
           
        users u = (users)request.getAttribute("user");
        %>
        <h2>Change Profile</h2>
        <form action="MyProfile" method="post">

            <div class="box">
                Username: </br>
                <input type="text" readonly name="username" placeholder="Username" value="<%=u.getUserName()%>" required>
            </div>
            <div class="box">
                First Name: </br>
                <input type="text" name="fname" placeholder="First name" value="<%=u.getFname()%>" required>
            </div>

            <div class="box">
                Last Name: </br>
                <input type="text" name="lname" placeholder="Last name" value="<%=u.getLname()%>" required>
            </div>
            <div class="box">
                Gender: </br>
                Male<input type="radio" name="gender" value="0" <%=u.isGender()?"checked":""%>>
                Female<input type="radio" name="gender" value="1" <%=u.isGender()?"":"checked"%>>
            </div>

            <div class="box">
                Email: </br>
                <input type="text" name="email" placeholder="Email" value="<%=u.getEmail()%>" required>
            </div>

            <div class="box">
                Phone:</br>
                <input type="text" name="phone" placeholder="Phone" value="<%=u.getPhone()%>">
            </div>

            <div class="box">
                Address: </br>
                <input type="text" name="address" placeholder="Address" value="<%=u.getAddress()%>">
            </div>

            <div class="box">
                Image:  </br>
                <img src="${pageContext.request.contextPath}/Images/${requestScope.user.imgUrl}" alt="NotUpdated"/>
            </div>

            <div class="box">
                Change image: 
                <input type="file" name="imgUrl" placeholder="Url" accept="image/*" value="<%=u.getImgUrl()%>" >
                <input type="hidden" name="imgUrl1"  value="<%=u.getImgUrl()%>" >
            </div>

            <button>Save</button>

        </form>

    </body>
</html>
