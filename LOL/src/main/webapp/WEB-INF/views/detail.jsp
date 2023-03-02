<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>

<style>
body {
   display: flex;
   height: 100vh;
   background-image:
      url('https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${champion.cn_eg}_0.jpg');
   background-repeat: repeat;
   background-size: cover;
   flex-direction: column;
   justify-content: center;
   align-content: center;
   align-items: center;
   backdrop-filter: blur(10px);
}
table th, td {
   line-height: 50px;
   width: 130px;
   cursor: pointer;
   text-align: center;
}
td{
padding: 5px;
}
td img{
width: 50px;
   border-radius: 50%;
}
tr{
   
   border-width : 1px;
   border-bottom : solid;
   border-bottom-color: initial;
}

.scroll{
   background-color : rgb(55, 20, 20,0.8);
   
}

/* 스크롤바 설정*/
.section::-webkit-scrollbar {
   width: 4px;
}

/* 스크롤바 막대 설정*/
.section::-webkit-scrollbar-thumb {
   height: 17%;
   background-color: rgb(177, 177, 177);
   
}

/* 스크롤바 뒷 배경 설정*/
.section::-webkit-scrollbar-track {
   background-color: rgb(55, 20, 20,0.8);
}

#counter_div {
   text-align: center;
   display: flex;
   justify-content: center;
   
}

.section {
display: flex;
width: 40%;

   text-align: center;
   max-height: 500px;
   overflow: scroll;
   position: relative;
}
#section1 {
border-top-left-radius: 15px;
border-bottom-left-radius: 15px;
}
#section2 {
border-top-right-radius: 15px;
border-bottom-right-radius: 15px;
}
tr:hover{
background-color: #1F2331;
}

.h3_div {
width: 74%;
color: #dedfe7;
font-size: 28px;
font-weight: 800;
margin-top: 10px;
margin-bottom: 30px;
   display: flex;
   justify-content:flex-start;
   text-shadow: 2px 2px 2px grey;
       border-bottom: 3px solid blanchedalmond;
}
.h3_div1 {
font-size: 18px;
line-height: 50px;
}

.d_e{
width: 74%;
display: flex;
flex-direction: row;
justify-content: space-between;
font-weight: 800;
}
.difficulty {
width: 100%;
display: flex;
   font-size: 18px;
   color: #dedfe7;
   font-weight: 800;
   justify-content: center;
   margin-bottom: 30px;
   text-shadow: 2px 2px 2px gray;
}
.enemy {
   color: rgb(177, 177, 177);
   font-size: 13px;
   text-align: left;
   font-weight: 700;
}
.enemy_match {
   color: rgb(177, 177, 177);
   font-size: 13px;
   font-weight: 700;
}
.enemyUp {
   color: chartreuse;
   font-size: 18px;
   font-weight: 700;
}
.enemyDown {
   color: #fc2b2b;
   font-size: 18px;
   font-weight: 700;
}


.champ {
display: flex;
   width: 74%;
   border-top: solid;
   border-width: 3px;
   position: relative;
   margin: 7% 0 0 0;
   opacity: 0.9;
   background-color: #1F2331;
   border-color: #FFC030;
   border-bottom-left-radius: 30px;
   border-bottom-right-radius: 30px;
}

.champ_img {
   width: 150px;
   height: 150px;
   position: relative;
   left: 7%;
   top: -60%;
    border-radius: 15px;
    border:5px outset;
    border-color: #FFC030;
    cursor: pointer;
}

.champ_position {
   font-size: 25px;
   text-align: center;
   line-height: 30px;
   display: flex;
   justify-content: center;
}
.champ_position img {
   height: 30px;
   display: flex;
   justify-content: center;
}

.champ_name {
   text-align: center;
   color: #dedfe7;
   float: left;
   font-size : 25px;
}

.text {
   font-size: 30px;
   text-align: center;
   line-height: 30px;
}

.champ_p_w {
   font-size: 30px;
   text-align: center;
   line-height: 30px;
}

p {
   color: #FFC030;
   margin-bottom: 0;
}

#position {
   width: 80px;
   height: 30px;
   position: relative;
   left: 10%;
   top: 12%;
}

#name {
   width: 100px;
   height: 30px;
   position: relative;
   left: -6.5%;
   top: 52%;
   text-align : center;
}

#w_p {
   width: 150px;
   height: 30px;
   position: relative;
   left: 20%;
   top: 35%;
}

#w_p_data {
   width: 140px;
   height: 30px;
   position: relative;
   left: 9%;
   top: 52%;
}

span {
   color: #FFC030;
}

</style>

<body>
	<script src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
		crossorigin="anonymous"></script>
<!-- <div class="container"> -->

		
	<div class="champ" onclick="gohome()">
		<img class="champ_img" alt="#"
			src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/${champion.cn_eg}.png">
		<div class="box" id="position">
			<p class="champ_position">${champion.lane}</p>
		</div>
		<div class="box" id="name">
			<p class="champ_name">${champion.cn_kr}</p>
		</div>
		<div class="box" id="w_p">
			<span class="text">승률&nbsp;&nbsp;</span><span class="text">픽률</span>
		</div>
		<div class="box" id="w_p_data">
			<span class="champ_p_w">${champion.winrate}&nbsp;</span><span
				class="champ_p_w">${champion.pickrate}</span>
		</div>
	</div>

	<div class="h3_div">
		${champion.cn_kr}<div class="h3_div1">&nbsp;&nbsp;상대 챔피언
	</div></div> 
	<div class="d_e">
	<div class="difficulty">상대하기 어려움</div>
	<div class="difficulty">상대하기 쉬움</div>
	</div>
	
	<div id="counter_div">


		<div class="section" id="section1">
			<table id="counter" class="scroll">
			</table>
		</div>


		<div class="section" id="section2">
			<table id="non_counter" class="scroll">
			</table>
		</div>
	</div>
<!-- </div> -->
</body>

<script type="text/javascript">

	$.ajax({
	method : 'get',
	url : '/getcounter-up',	//상대하기 쉬운 챔피언
	data : {cid:${champion.cid},lane:'${champion.lane}'}
	}).done(res=>{
		let cList='<tbody>';
		for(champion of res){
			cList += '<tr class="'+champion.e_id+'" height="20" align="center" onclick="detail(this)">'
			cList += '<td><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+champion.cn_eg+'.png" alt="#"></td>'
			cList += '<td align="center" class="enemy">'+champion.enemy+'</td>'	//비교 대상 챔피언 이름(카운터)
			cList += '<td align="center" class="enemy_match">'+champion.match+' 게임</td>'	//비교 대상 챔피언과 게임수(카운터)
			cList += '<td align="center" class="enemyUp">'+champion.winrate+'%</td>'	//비교 대상 챔피언의 승률(카운터)
		}
		cList+='</tbody>';
		$('#non_counter').html(cList);	//상대하기 쉬운 챔피언 테이블
	})
	
	$.ajax({
	method : 'get',
	url : '/getcounter-down', //상대하기 어려운 챔피언
	data : {cid:${champion.cid},lane:'${champion.lane}'}
	}).done(res=>{
		let cList='<tbody>';
		for(champion of res){
			cList += '<tr class="'+champion.e_id+'" height="20" align="center" onclick="detail(this)">'
			cList += '<td><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+champion.cn_eg+'.png" alt="#"></td>'
			cList += '<td align="center" class="enemy">'+champion.enemy+'</td>'	//비교 대상 챔피언 이름
			cList += '<td align="center" class="enemy_match">'+champion.match+' 게임</td>'	//비교 대상 챔피언과 게임수
			cList += '<td align="center" class="enemyDown">'+champion.winrate+'%</td>'	//비교 대상 챔피언의 승률
		}
		cList+='</tbody>';
		$('#counter').html(cList);	//상대하기 어려운 챔피언 테이블
	})
	
	function gohome(){
		location.href='/'
	}
	
	function detail(champion){
		let cid=${champion.cid}
		let e_id=champion.getAttribute("class")
		let lane='${champion.lane}'
		console.log(cid,lane,e_id)
		location.href="/counter/?cid="+cid+"&lane="+lane+"&e_id="+e_id;
	}
	
 	function liner(champion){
		let line = '${champion.lane}';
		if(line.equals('Top')){
			line = 'top';
		}
		console.log(line)
	}
 	$(function() {
		if ($('.champ_position').html() === "Top") {
			var image = new Image();
			image.src = 'https://ditoday.com/wp-content/uploads/2022/02/ps_top.png';
			$('.champ_position').html("탑").append(image);
		}
		if ($('.champ_position').html() === "Middle") {
			var image = new Image();
			image.src = 'https://ditoday.com/wp-content/uploads/2022/02/ps_mid.png';
			$('.champ_position').html("미드").append(image);
		}
		if ($('.champ_position').html() === "Bot") {
			var image = new Image();
			image.src = 'https://ditoday.com/wp-content/uploads/2022/02/ps_bot.png';
			$('.champ_position').html("바텀").append(image);
		}
		if ($('.champ_position').html() === "Jungle") {
			var image = new Image();
			image.src = 'https://ditoday.com/wp-content/uploads/2022/02/ps_jungle.png';
			$('.champ_position').html("정글").append(image);
		}
		if ($('.champ_position').html() === "Supporter") {
			var image = new Image();
			image.src = 'https://ditoday.com/wp-content/uploads/2022/02/ps_suppot.png';
			$('.champ_position').html("서포터").append(image);
		}
	});
</script>
</html>