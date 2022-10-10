<%-- 
    Document   : PlaySong
    Created on : Jul 4, 2022, 11:09:26 AM
    Author     : Mai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>MP3 Player</title>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap"
            rel="stylesheet"
            />
        <script
            type="module"
            src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"
        ></script>
        <script
            nomodule
            src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"
        ></script>

        <style>
            html {
                box-sizing: border-box;
            }
            * {
                margin: 0;
                padding: 0;
            }
            *,
            *:before,
            *:after {
                box-sizing: border-box;
            }
            input,
            textarea,
            select,
            button {
                outline: none;
            }
            input {
                line-height: normal;
            }
            label,
            button {
                cursor: pointer;
            }
            a {
                text-decoration: none;
            }
            img {
                display: block;
                max-width: 100%;
            }
            body {
                font-family: "Poppins", sans-serif;
                padding: 20px;
            }
            .music {
                max-width: 500px;
                margin: 0 auto;
                border-radius: 12px;
                background-color: white;
                box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
                padding: 35px 15px 30px;
            }
            .music-thumb {
                width: 100px;
                height: 100px;
                margin: 0 auto 25px;
            }
            .music-thumb.is-playing {
                animation: spinner 5s infinite linear;
            }
            .music-thumb img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                border-radius: 100rem;
                box-shadow: 0 0 0 3px #ffb86c, 0 0 0 6px white, 0 0 0 9px #ff6bcb;
            }
            .music-name {
                font-size: 18px;
                font-weight: 500;
                text-align: center;
                margin-bottom: 20px;
            }
            .timer {
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-size: 14px;
                color: #999;
                margin-bottom: 40px;
            }
            .controls {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 0 40px;
            }
            .play {
                position: relative;
            }
            .play:before {
                content: "";
                position: absolute;
                inset: 0;
                background-image: linear-gradient(to right bottom, #ff6bcb, #ffb86c);
                transform: scale(1.5);
                border-radius: 100rem;
            }
            .player-inner {
                width: 50px;
                height: 50px;
                border-radius: 100rem;
                background-color: white;
                display: flex;
                justify-content: center;
                align-items: center;
                cursor: pointer;
                box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
                font-size: 20px;
                position: relative;
                z-index: 2;
            }
            .player-inner:hover
            {
                background-color: #ecedee;
                /*color: white*/
            }

            .play-repeat,
            .play-back,
            .play-forward, .play-infinite {
                cursor: pointer;
            }
            .range {
                -webkit-appearance: none; /* Hides the slider so that custom slider can be made */
                width: 100%; /* Specific width is required for Firefox. */
                background: transparent; /* Otherwise white in Chrome */
                margin-bottom: 20px;
            }
            .range::-webkit-slider-runnable-track {
                width: 100%;
                height: 4px;
                background-color: #eeee;
            }
            .range::-webkit-slider-thumb {
                -webkit-appearance: none;
                background-color: #20e3b2;
                width: 15px;
                height: 15px;
                border-radius: 100rem;
                margin-top: -8px;
                box-shadow: 0 0 0 3px white, 0 0 0 6px rgba(100, 100, 111, 0.05);
            }
            @keyframes spinner {
                to {
                    transform: rotate(360deg);
                }
            }
            .play-repeat {
                font-size: 20px;
            }

            textarea {
                width: 40%;
                height: 300px;
                padding: 12px 20px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                /*border-radius: 4px;*/
                background-color: white;
                margin: 20px;
                resize: none;
            }
        </style>
    </head>

    <body>



        <%
        List<songs> songList = (ArrayList<songs>)request.getAttribute("songsInAlbum");
        
        int index = 0;

        session.setAttribute("song",songList.get(index));
        session.setAttribute("size",songList.size());
        session.setAttribute("songList",songList);
        %>


        <div class="music">
            <div class="music-thumb">
                <img src="${pageContext.request.contextPath}/Images/robot-music-800x450.jpg" alt="" />
            </div>
            <h3 id ="name" class="music-name"><%=songList.get(index).getName()%></h3>

            <input id="range" type="range" name="range"  class="range" />
            <div id="song1">
                <audio id="song" preload autoplay src="<%=request.getContextPath()+"/MP3/"+songList.get(index).getSongUrl()%>" ></audio>
            </div>

            <div class="timer">
                <div class="duration">00:00</div>
                <div class="remaining">00:00</div>
            </div>


            <div class="controls">
                <ion-icon name="infinite-outline" class="play-infinite"></ion-icon>
                <ion-icon name="play-back" class="play-back"></ion-icon>
                <div class="play">
                    <div class="player-inner">
                        <ion-icon name="pause" class="play-icon"></ion-icon>
                    </div>
                </div>
                <ion-icon name="play-forward" class="play-forward"></ion-icon>
                <ion-icon name="repeat-outline" class="play-repeat"></ion-icon>
            </div>
        </div>
        </br></br>
    <center>
        <h5 id="title">Lyrics: <%=songList.get(index).getName()%></h5>
        <h6 id="authorName" style="color:#bbb">Musician: <%=songList.get(index).getAuthorName()%></h6>
        <div id="lyrics" >

            <c:forEach begin="${0}" end="${songList.size()-1}" var="i" >

                <textarea id="${i}" style="display:${i==0?"block":"none"}" readonly>${songList.get(i).getLyrics()}</textarea>
            </c:forEach></div>
    </center>


    <script language="javascript" type="text/javascript">
        let index = 0;
        let song = document.getElementById("song");
        const song1 = document.getElementById("song1");
        const lyrics = document.getElementById("lyrics");
                const songList = [<c:forEach var="song" items="${sessionScope.songList}" varStatus="loop">{id:${song.id}, name:"${song.name}", songUrl:"${song.songUrl}", pubYear:${song.pubYear}, authorName:"${song.authorName}"}<c:if test="${!loop.last}">,</c:if></c:forEach>
                ];
        let name = document.getElementById("name");
        let authorName = document.getElementById("authorName");
        let title = document.getElementById("title");

        const playBtn = document.querySelector(".player-inner");
        const durationTime = document.querySelector(".duration");
        const remainingTime = document.querySelector(".remaining");

        const rangeBar = document.querySelector(".range");
        displayTimer();
        let timer = setInterval(displayTimer, 500);

        playBtn.addEventListener("click", playPause);

        let isPlaying = true;
        function playPause()
        {
            song = document.getElementById("song");
            song.addEventListener("ended", handleEndedSong);
            if (isPlaying)
            {
                song.pause();
                isPlaying = false;
                playBtn.innerHTML = '<ion-icon name="play"></ion-icon>';
            } else {
                song.play();
                isPlaying = true;
                playBtn.innerHTML = '<ion-icon name="pause"></ion-icon>';
            }
        }
        const prevBtn = document.querySelector(".play-back");
        const nextBtn = document.querySelector(".play-forward");

        
        function handleEndedSong() {
            changeSong(1);
        }

        function changeSong(dir)
        {
            let ta = document.getElementById(index);
            ta.style.display = "none";
            playPause();
//            console.log(song.duration);
//            displayTimer();
//            setInterval()
            if (dir == 1)//next song
            {
                index++;
                if (index >=${sessionScope.size})
                    index = 0;
            } else {
                if (dir == -1)//prev song
                {
                    index--;
                    if (index < 0)
                        index = ${sessionScope.size} - 1;
                }
            }

            name.innerHTML = songList[index].name;
            authorName.innerHTML = 'Musician: ' + songList[index].authorName;
            title.innerHTML = 'Lyrics: ' + songList[index].name;
            var url = "<%=request.getContextPath()%>" + "/MP3/";
            song1.innerHTML = ' <audio id="song" preload autoplay src="' + url + songList[index].songUrl + '"></audio>';
            ta = document.getElementById(index);
            ta.style.display = "block";

            isPlaying = false;
            playPause();
        }

        prevBtn.addEventListener("click", function () {
            changeSong(-1);
        });
        nextBtn.addEventListener("click", function () {
            changeSong(1);
        });



        function displayTimer() {
            const {duration, currentTime} = song;
            rangeBar.max = Math.floor(duration);
            rangeBar.addEventListener("change", handleChangeBar);

            if (!duration)  //khi duration chua dc cap nhat
            {
                durationTime.textContent = "00:00";
                remainingTime.textContent = formatTimer(duration);
                rangeBar.value = 0;
            } else
            {
                durationTime.textContent = formatTimer(duration);
                remainingTime.textContent = "-" + formatTimer(duration - currentTime);
                rangeBar.value = currentTime;

            }
//            console.log({duration, currentTime});
//            console.log(rangeBar.max);

        }

        function formatTimer(number) {
            const minutes = Math.floor(number / 60);
            const second = Math.floor(number - minutes * 60);
            return minutes + ":" + second;
        }


        function handleChangeBar() {
            song.currentTime = rangeBar.value;
        }
    </script>

</body>
</html>
