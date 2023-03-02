<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

   body{
      height: 100vh;
    background-image: url('https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${champion.cn_eg}_0.jpg');
    background-size: cover;
      text-align: center;
      
    }
    #versus-top-container {
  margin: auto;
  margin-top: 13%;
  width: 1500px;
  border-radius: 5px;
  padding: 40px;
  margin-bottom: 20px;
  position: relative;
}

#versus-top-container:before {
  content: "";
  background-image: linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)), url('https://cdn.pixabay.com/photo/2014/06/15/22/36/pattern-369543_960_720.png');
  background-position: center;
  background-size: cover;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  filter: blur(10px);
  z-index: -1;
}

    .left-champion-info,
    .right-champion-info {
      text-align: center;
    }

    .champion-name,.versus-text {
    width: 480px;
      color: #dedfe7;
      font-size: 30px;
      margin-top: 10px;
      margin-bottom: 5px;
      font-weight: 700;
    }
    .lane{
      width: 300px;
      color: #dedfe7;
      font-size: 25px;
      margin-top: 10px;
      margin-bottom: 5px;
      font-weight: 700;
    }

    .champion-stats,
    .versus-stats {
      display: flex;
      justify-content: space-between;
      margin-top: 10px;
    }

    .stat,.versus-stat{
      color: #828799;
      font-size: 18px;
    }
    
    .title {
    width: 160px;
      color: #7e9bff;
      font-weight: 800;
      font-size: x-large;
      margin-right: 5px;
    }

    .value {
    width: 160px;
      color: #dedfe7;
      font-size: 35px;
      font-weight: 600;
    }
    .value1 {
    width: 160px;
      color: #dedfe7;
      font-size: 25px;
      font-weight: 600;
    }

    .versus-text {
      margin-top: 25px;
      margin-bottom: 20px;
      text-align: center;
    }

    .row1 {
      width: 100%;
      display: flex;
      flex-direction: row;
      justify-content: center;
      align-items: center;
    }

    .row2 {
      width: 100%;
      display: flex;
      flex-direction: row;
      justify-content: space-evenly;
      align-items: center;
    }

    .container-fluid {
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      align-items: center;
    }

    .stat {
      display: flex;
      flex-direction: column;
    }

    .versus-stat {
      display: flex;
      flex-direction: column;
    }

    .champion-stats {
      display: flex;
      flex-direction: row;
      justify-content: space-evenly;
    }
  </style>
  <script src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
		crossorigin="anonymous"></script>
<body>
  <section id="versus-top-container">
    <div class="container-fluid">
    <div class="row1">
        <div class="lane">${champion.lane}</div>
      </div>
      <div class="row1">
        <div class="champion-name">${champion.cn_kr}</div>
        <div class="versus-text" style="width: 60px">VS</div>
        <div class="champion-name">${enemy.cn_kr}</div>
      </div>
      <div class="row2">
        <div class="champion-stats">
          <div class="stat">승률<span class="value1">${champion.winrate}</span> </div>
          <div class="stat"><span class="stat">표본수</span> <span class="value1">${champion_total}</span></div>
        </div>
        <div class="col-md-4 col-xs-12 left-champion-info">
          <div class="champion-info">
            <img src="//ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/${champion.cn_eg}.png" alt="Champion Image"
              class="champion-image">

          </div>
        </div>
        <div class="col-md-4 col-xs-12 center-info">

          <div class="versus-stats">
            <div class="versus-stat"><span class="title">상대 승률</span> <span
                class="value">${c.winrate}</span></div>
            <div class="versus-stat"><span class="title">표본수</span> <span class="value">${c.match}</span></div>
          </div>
        </div>
        <div class="col-md-4 col-xs-12 right-champion-info">
          <div class="champion-info">
            <img src="//ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/${enemy.cn_eg}.png" alt="Champion Image"
              class="champion-image">
          </div>
        </div>
        <div class="champion-stats">
          <div class="stat">승률<span class="value1">${enemy.winrate}</span> </div>
          <div class="stat"><span class="stat">표본수</span> <span class="value1">${enemy_total}</span></div>
        </div>
      </div>

    </div>
  </section>

<script type="text/javascript">
$(function(){
    if($('.lane').html()==="Top"){
      $('.lane').html("탑")
    }
    if($('.lane').html()==="Middle"){
      $('.lane').html("미드")
    }
    if($('.lane').html()==="Bot"){
      $('.lane').html("바텀")
    }
    if($('.lane').html()==="Jungle"){
      $('.lane').html("정글")
    }
    if($('.lane').html()==="Supporter"){
      $('.lane').html("서폿")
    }
  });
</script>
</body>
</html>