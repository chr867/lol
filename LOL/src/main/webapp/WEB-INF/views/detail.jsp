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
body{
	color : white;
	background-color: #191C2F;
	z-index: -1
}


table th, td {
	line-height: 120px;
	width: 200px;
	cursor : pointer;
	color : white;
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
}


.h3_div{
	margin : 10% 40% 2% 45%
}

h3{
	color: white;
	font-size : 25px;
}
</style>


<body>
<script src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
		crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
		
   <div class="h3_div"><h3>${champion.cn_kr} 상대 챔피언</h3></div>
   
	<div id="counter_div">
		<div class = "section">
			<div class = "title" style="color:red">상대하기 어려움</div>
			<table id="counter" class="table table-striped">
			
			</table>
		</div>
		
		<div class = "section">
			<div class = "title" style="color:#374AC9">상대하기 쉬움</div>
			<table id="non_counter" class="table table-striped">
			
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
			cList += '<td align="center">'+champion.enemy+'</td>'	//비교 대상 챔피언 이름(카운터)
			cList += '<td align="center">'+champion.winrate+'</td>'	//비교 대상 챔피언의 승률(카운터)
			cList += '<td align="center">'+champion.match+'</td>'	//비교 대상 챔피언과 게임수(카운터)
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
			cList += '<td align="center">'+champion.enemy+'</td>'	//비교 대상 챔피언 이름
			cList += '<td align="center">'+champion.winrate+'</td>'	//비교 대상 챔피언의 승률
			cList += '<td align="center">'+champion.match+'</td>'	//비교 대상 챔피언과 게임수
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
	
</script>

</html>