<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    #versus-top-container {
      background-color: #2040a9;
      border-radius: 5px;
      padding: 20px;
      margin-bottom: 20px;
    }
    
    .left-champion-info,
    .right-champion-info {
      text-align: center;
    }

    .champion-name,.versus-text {
      color: #dedfe7;
      font-size: 40px;
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
      color: #7e9bff;
      font-weight: 800;
      margin-right: 5px;
    }

    .value {
      color: #dedfe7;
      font-size: 30px;
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
      justify-content: space-around;
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
        <div class="champion-name">${champion.cn_kr}</div>
        <div class="versus-text">VS</div>
        <div class="champion-name">${enemy.cn_kr}</div>
      </div>
      <div class="row2">
        <div class="champion-stats">
          <div class="stat" style="margin-right: 50px">승률<span class="value">${champion.winrate}</span> </div>
          <div class="stat"><span class="stat">게임수</span> <span class="value">${champion_total}</span></div>
        </div>
        <div class="col-md-4 col-xs-12 left-champion-info">
          <div class="champion-info">
            <img src="//ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/${champion.cn_eg}.png" alt="Champion Image"
              class="champion-image">

          </div>
        </div>
        <div class="col-md-4 col-xs-12 center-info">

          <div class="versus-stats">
            <div class="versus-stat" style="margin-right: 50px;"><span class="title">상대 승률</span> <span
                class="value">${c.winrate}</span></div>
            <div class="versus-stat"><span class="title">게임수</span> <span class="value">${c.match}</span></div>
          </div>
        </div>
        <div class="col-md-4 col-xs-12 right-champion-info">
          <div class="champion-info">
            <img src="//ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/${enemy.cn_eg}.png" alt="Champion Image"
              class="champion-image">
          </div>
        </div>
        <div class="champion-stats">
          <div class="stat" style="margin-right: 50px">승률<span class="value">${enemy.winrate}</span> </div>
          <div class="stat"><span class="stat">게임수</span> <span class="value">${enemy_total}</span></div>
        </div>
      </div>

    </div>
  </section>

<script type="text/javascript">

</script>
</body>
</html>