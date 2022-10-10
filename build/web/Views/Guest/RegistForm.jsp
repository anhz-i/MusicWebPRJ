<%-- 
    Document   : RegistForm
    Created on : Jun 20, 2022, 8:57:47 PM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HotSound - Website nghe nhạc miễn phí dành cho bạn</title>
        <!-- <link rel="stylesheet" href="HomeStyle.css"> -->
        <!-- <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css"> -->
        <script src="https://kit.fontawesome.com/b40c975c82.js" crossorigin="anonymous"></script>

        <style>
            body {
                background-color: rgb(26, 27, 58);
                display: flex;
                justify-content: center;
                font-family: 'Courier New', Courier, monospace;
                font-size: 20px;
            }

            .regist-form {
                width: auto;
                height: auto;
                background-color: white;
                border-radius: 20px;
                padding: 30px;
                margin: 20px;
                margin-top: 5%;
            }

            p {
                font-size: 40px;
                color: black;
                text-align: center;
                font-weight: bold;
            }



            .box {
                margin: 10px;
                /* text-align: center; */
                padding-left: 10px;
            }

            input[type="text"], input[type="password"] {
                padding: 0 10px;
                background-color: rgb(250, 247, 247);
                height: 30px;
                border: 1px solid black;
                border-radius: 3px
            }

            input[type="text"]:hover, input[type="password"]:hover {
                background-color: white;
            }



            .box-1 {
                text-align: center;
            }

            .box-1 a {
                font-size: 13px;
            }

            .box-1 button {
                margin: 10px 0 25px 0;
                background: black;
                color: white;
                border-radius: 10px;
                padding: 10px 60px;
                font-size: 20px;
            }

            .box-1 button:hover {
                background-color: rgba(0, 0, 0, 0.666);
            }

            h6 {
                font-weight: normal;
                color: rgb(29, 29, 197);
                text-align: center
            }
        </style>
    </head>



    <body>
        <div class="regist-form">
            <form action="${pageContext.request.contextPath}/Regist" method="post">
                <p>Registered Form</p>
                <hr>
                <%
                    if(request.getAttribute("error")!=null)
                    {
                        String error = (String)request.getAttribute("error");
                %>
                <h6 style="color:red"><%= error %></h6>
                <%}%>
                <%
                    users u = new users("", "", "", true, "", "", "", "", "", (byte) 0, false);
                    if(session.getAttribute("infor")!=null)
                    {
                        u = (users)session.getAttribute("infor");
                    }
                %>

                <div class="box">
                    First Name: *<br>
                    <div>
                        <input type="text" name="fname" placeholder="First name" value="<%=u.getFname()%>" required>
                    </div>
                </div>

                <div class="box">
                    Last Name: *<br>
                    <div>
                        <input type="text" name="lname" placeholder="Last name" value="<%=u.getLname()%>" required>
                    </div>
                </div>
                <div class="box">
                    Gender: <div>Male<input type="radio" name="gender" value="0" <%=u.isGender()?"checked":""%>>
                        Female<input type="radio" name="gender" value="1" <%=u.isGender()?"":"checked"%>></div>
                </div>

                <div class="box">
                    Email: *<br>
                    <div>
                        <input type="text" name="email" placeholder="Email" value="<%=u.getEmail()%>" required>
                    </div>
                </div>

                <div class="box">
                    Phone: <br>
                    <div>
                        <input type="text" name="phone" placeholder="Phone" value="<%=u.getPhone()%>">
                    </div>
                </div>

                <div class="box">
                    Address: <br>
                    <div>
                        <input type="text" name="address" placeholder="Address" value="<%=u.getAddress()%>">
                    </div>
                </div>

        </div>

        <div class="regist-form">
            <div class="box">
                Choose image: <br>
                <div>
                    <input type="file" name="imgUrl" placeholder="Url" accept="image/*" value="<%=u.getImgUrl()%>" >
                </div>
            </div>
            <div class="box">
                Username: *<br>
                <div>
                    <input type="text" name="username" placeholder="Username" value="<%=u.getUserName()%>" required>
                </div>
            </div>


            <div class="box">
                Password: *<br>
                <input type="password" name="password" placeholder="Password" value="<%=u.getPass()%>" required>
            </div>

            <div class="box">
                Repassword: *<br>
                <input type="password" name="repassword" placeholder="Repassword" required>
            </div>

            <h6>* means required information</h6>
            <div class="box-1">
                <button type="submit" name="login">Register</button>
                <br>
                Or Sign In with
                <br>
                <a href="${pageContext.request.contextPath}/Login">Sign In</a>
            </div>
        </form>
    </div>

</body>

</html>