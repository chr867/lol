<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<style>

table th, td {
	line-height: 120px;
	width: 200px;
	cursor : pointer;
}

#counter_div{
	width : 1200px;
	margin : 2% 15% 0 18%;
	display : flex;
}

.section{
	width : 600px;
	float: left;
	text-align : center;
	max-height: 800px;
	overflow : scroll;
}

.title{
	font-size : 22px;
	color : blue;
	
}


.h3_div{
	margin : 10% 40% 2% 45%
}

h3{
	font-size : 25px;
	color : blue;
}
</style>

<body>
<script src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
		crossorigin="anonymous"></script>
		${cid}
	${champion.cn_eg} ${champion.cn_kr } ${champion.winrate }
	${champion.pickrate } ${champion.lane }

	<!--  <form method = "get" action="detail">
   </form> -->
	<!-- <div class = "chart">
   
   </div> -->
   
   <div class="h3_div"><h3>${champion.cn_kr} 상대 챔피언</h3></div>
   

	<div id="counter_div">
		<div class = "section">
			<div class = "title">상대하기 어려움</div>
			<table id="counter">
			</table>
		</div>
		
		<div class = "section">
			<div class = "title">상대하기 쉬움</div>
			<table id="non_counter">
			</table>
		</div>
	</div>



</body>

<script type="text/javascript">

	$.ajax({
	method : 'get',
	url : '/getcounter-up',
	data : {cid:${champion.cid},lane:'${champion.lane}'}	//상대하기 쉬운 챔피언
	}).done(res=>{
		let cList='<tbody>';
		for(champion of res){
			cList += '<tr height="20" align="center" onclick="detail()">'
			cList += '<td><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+champion.cn_eg+'.png" alt="#"></td>'
			cList += '<td align="center">'+champion.enemy+'</td>'	//비교 대상 챔피언 이름(카운터)
//			cList += '<td align="center">'+champion.counter_game+'</td>'	//비교 대상 챔피언과 게임수(카운터)
			cList += '<td align="center">'+champion.winrate+'</td>'	//비교 대상 챔피언의 승률(카운터)
			cList += '<td align="center">'+champion.match+'</td>'	//비교 대상 챔피언의 승률(카운터)
		}
		cList+='</tbody>';
		$('#non_counter').html(cList);	//카운터 챔피언 테이블
	})
	
	$.ajax({
	method : 'get',
	url : '/getcounter-down',
	data : {cid:${champion.cid},lane:'${champion.lane}'}	//상대하기 어려운 챔피언
	}).done(res=>{
		let cList='<tbody>';
		for(champion of res){
			cList += '<tr height="20" align="center" onclick="detail()">'
			cList += '<td><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+champion.cn_eg+'.png" alt="#"></td>'
			cList += '<td align="center">'+champion.enemy+'</td>'	//비교 대상 챔피언 이름
//			cList += '<td align="center">'+champion.non_counter_game+'</td>'	//비교 대상 챔피언과 게임수
			cList += '<td align="center">'+champion.winrate+'</td>'	//비교 대상 챔피언의 승률
			cList += '<td align="center">'+champion.match+'</td>'	//비교 대상 챔피언의 승률
		}
		cList+='</tbody>';
		$('#counter').html(cList);	//비교 대상 챔피언 테이블
	})
	
	function detail(){
		location.href = "#"//비교 대상 챔피언 클릭시 상세정보 보기로 이동(챔피언간 상대 승률과 챔피언간의 게임 수,각 챔피언 승률과 게임수,챔피언 이름, 이미지)
	}

	/*  google.charts.load('current', {'packages' : ['corechart']});
	 google.charts.setOnLoadCallback(drawVisualization);
	 
	 function drawVisualization(){
	    let win_data = google.visualization.arrayToDataTable([
	       ['Win_Rate', 'Pick_Rate', 'KDA'],
	       [${champion.winrate}, ${champion.pickrate}, ${champion.kda}]
	    ]);
	    
	    let options = {
	          title : '${champion.cn_eg}' + "통계",
	          vAxis : {title : ''},
	          hAxis : {title : ''},
	          seriesType : 'bars',
	    };
	    
	    let chart = new google.visualization.ComboChart(document.querySelector('.chart'));
	    chart.draw(win_data, options);
	 } */
</script>

</html>