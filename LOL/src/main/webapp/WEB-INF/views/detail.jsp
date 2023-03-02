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
table th, td {
	line-height: 50px;
	/* max-height : 200px; */
	width: 250px;
	cursor: pointer;
	text-align: center;
}

tr{
	border : solid;
	border-width : 1px;
	border-color : black;
	opcity: 0.5;
}

.scroll{
	background-color : rgba(235,40,30,0.3);
}

/* 스크롤바 설정*/
.section::-webkit-scrollbar {
	width: 6px;
}

/* 스크롤바 막대 설정*/
.section::-webkit-scrollbar-thumb {
	height: 17%;
	background-color: rgba(255, 255, 255, 1);
	/* 스크롤바 둥글게 설정    */
	border-radius: 10px;
}

/* 스크롤바 뒷 배경 설정*/
.section::-webkit-scrollbar-track {
	background-color: rgba(0, 0, 0, 0);
}

#counter_div {
	width: 1200px;
	margin: 0 15% 0 18%;
	text-align: center;
	display: flex;
}

.section {
	width: 1000px;
	/* float: left; */
	text-align: center;
	max-height: 500px;
	overflow: scroll;
	position: relative;
	/* margin : 30px 0 0 0; */
	top: 500%
}

/* .title {
	width: 240px;
	height: 22px;
	font-size: 18px;
	text-align: center; position : relative; top : -30%;
	left: 20%;
	position: relative;
	top : 1%
} */
.h3_div {
	position: relative;
	left: 45%
}

h3 {
	font-size: 25px;
	color: blue;
}

.enemyUp {
	color: green;
	font-size: 20px;
}

.enemyDown {
	color: red;
	font-size: 20px;
}

.champ {
	width: 800px;
	height: 300px;
	border-top: solid;
	border-width: 1px;
	border-color: #FFC030;
	background-color: #1F2331;
	position: relative;
	left: 29%;
	margin: 5% 0 0 0;
	display: flex;
	background-color: #1F2331;
	border-color: #FFC030;
	border-bottom-left-radius: 30px;
	border-bottom-right-radius: 30px;
}

.champ_img {
	width: 150px;
	height: 150px;
	position: relative;
	left: 10%;
	top: 16%
}

.champ_position {
	font-size: 30px;
	text-align: center;
	line-height: 30px;
}

.champ_name {
	font-size: 30px;
	text-align: center;
	line-height: 30px;
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
}

#position {
	width: 80px;
	height: 30px;
	position: relative;
	left: 46%;
	top: 12%;
}

#name {
	height: 30px;
	position: relative;
	left: -15%;
	top: 65%;
}

#w_p {
	width: 150px;
	height: 30px;
	position: relative;
	left: 20%;
	top: 53%;
}

#w_p_data {
	width: 140px;
	height: 30px;
	position: relative;
	left: 1%;
	top: 68%;
}

span {
	color: #FFC030;
}

body {
	height: 100vh;
	background-image:
		url('https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${champion.cn_eg}_0.jpg');
	background-repeat: no-repeat;
	background-size: cover;
}

.enemy {
	color: white;
	font-size: 20px;
}

#difficult {
	width: 240px;
	height: 22px;
	font-size: 22px;
	line-height: 22px;
	text-align: center;
	position: relative;
	top: -30%;
	left: 28%;
	position: relative;
	top: 1%;
	text-align: center;
}

#easy {
	width: 240px;
	height: 22px;
	font-size: 22px;
	line-height: 22px;
	text-align: center;
	position: relative;
	top: -30%;
	left: 58%;
	position: relative;
	top: -0.9%
}
</style>

<body>
	<script src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
		crossorigin="anonymous"></script>

	<div class="champ">
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
		<h3>${champion.cn_kr}상대 챔피언</h3>
	</div>

	<div style="color: red" id="difficult">상대하기 어려움</div>
	<div style="color: blue" id="easy">상대하기 쉬움</div>
	<div id="counter_div">


		<div class="section">
			<table id="counter" class="scroll">
			</table>
		</div>


		<div class="section">
			<table id="non_counter" class="scroll">
			</table>
		</div>
	</div>

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
			cList += '<td align="center" class="enemyUp">'+champion.winrate+'</td>'	//비교 대상 챔피언의 승률(카운터)
			cList += '<td align="center" class="enemy">'+champion.match+'</td>'	//비교 대상 챔피언과 게임수(카운터)
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
			cList += '<td align="center" class="enemyDown">'+champion.winrate+'</td>'	//비교 대상 챔피언의 승률
			cList += '<td align="center" class="enemy">'+champion.match+'</td>'	//비교 대상 챔피언과 게임수
		}
		cList+='</tbody>';
		$('#counter').html(cList);	//상대하기 어려운 챔피언 테이블
	})
	
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
	
</script>
</html>