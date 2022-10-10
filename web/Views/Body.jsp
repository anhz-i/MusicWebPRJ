<%-- 
    Document   : Home.jsp
    Created on : Jun 20, 2022, 5:37:25 PM
    Author     : Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@page import="dal.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HotSound - Website nghe nhạc miễn phí dành cho bạn</title>
        <link href="<c:url value="/CSS/HomeStyle.css"/>" rel="stylesheet">
        <link href="<c:url value="/CSS/styles.css"/>" rel="stylesheet">

        <!-- Bootstrap icons-->
        <!--        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
                <script src="https://kit.fontawesome.com/b40c975c82.js" crossorigin="anonymous"></script>-->



    </head>

    <body class="">

        <h2 style="margin: 20px 50px">LISTEN MUSIC ONLINE</h2>

        <div class="container">

            <section class="left">

                <div>
                    <img src="${pageContext.request.contextPath}/Images/Live-music-900x479.jpg">
                </div>
                <div>
                    <img src="${pageContext.request.contextPath}/Images\robot-music-800x450.jpg">
                </div>
                <div>
                    <img src="${pageContext.request.contextPath}/Images\default.jpg">
                </div>

                <div>
                    <img src="${pageContext.request.contextPath}/Images\482216347x.jpg">
                </div>
                <div>
                    <img src="${pageContext.request.contextPath}/Images\Banner.jpg">
                </div>  
            </section>



            <section class="right">
                <c:set var="page" value="${requestScope.page}"/>
                <div class="pagination">

                    <c:forEach begin="${1}" end="${requestScope.np}" var="i">
                        <a style="color: white" class="${(i==page)?"active":""}" href="Home?page=${i}">${i}</a>
                    </c:forEach>
                </div>   

                <section class="py-5">
                    <div class="container px-4 px-lg-5 mt-5">
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                            <!-- 1 -->
                            <%
                            List<songs> songList = (List<songs>)request.getAttribute("songList");
                            for(songs s : songList)
                            {
                            %>
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Song image-->
                                    <img style="width: 100%; height: 150px" class="card-img-top" src="https://source.unsplash.com/random" alt="..." />
                                    <!--Song detail-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h6 class="fw-bolder"><%=s.getName()%></h6>
                                            <!-- Product price-->
                                            <%
                                            MyConnect mycon = new MyConnect();
                                            HashMap<Integer, String> hmSinger_Song = mycon.getHmSinger_Song(s.getId());
                                            for (Map.Entry<Integer, String> entry : hmSinger_Song.entrySet()) {
                                                int key = entry.getKey();
                                                String val = entry.getValue();
                                            %>
                                            <p style="font-size: 10px"> <%=val%></p> 
                                            <%
                                            }
                                            %>
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center">
                                            <a style="width: 50px; height: 100%; font-size: 10px;" class="btn btn-outline-dark mt-auto" href="PlaySong?id=<%=s.getId()%>">Play</a>
                                            <c:if test="${sessionScope.loginUser!=null}">
                                                <a style="width: 80px; height: 100%; font-size: 10px;" class="btn btn-outline-dark mt-auto" href="${pageContext.request.contextPath}/MP3/<%=s.getSongUrl()%>" download="${i.name}">Download</a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </section>
            </section>
        </div>
        <div style="clear:both"></div>
    </body>
</html>
