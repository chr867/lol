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
	background-image: linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)), url('https://cdn.pixabay.com/photo/2014/06/15/22/36/pattern-369543_960_720.png');
 	background-repeat: no-repeat;
	background-position:center;
	background-size: cover;
	color : white;
}

tr{
    background-color: rgba(235,87,87,0.5);
    	cursor: pointer;
}

.catergory_box span{
	position: relative;
	left: 43%;
}

.catergory_box .category{
	position: relative;
	left: 8%;
}

.table_box{
	margin-left:8%;
	width:80%;
	max-height: 700px;
	overflow : scroll;
	box-sizing: border-box;
}

.table_box::-webkit-scrollbar{
    width: 6px;
}

.table_box::-webkit-scrollbar-thumb {
    height: 17%;
    background-color: rgba(255,255,255,1);
    /* 스크롤바 둥글게 설정    */
    border-radius: 10px;    
}

.table_box::-webkit-scrollbar-track{
    background-color: rgba(0,0,0,0);
}

table th, td {	
	color:white;
	line-height: 120px;
	width: 200px;
}

#table_chart {
	margin: 50px 0 0 0;
}

.title {
	font-size: 20px;
	margin: 35px 5px 0 50%;
}

.sub_title {
	font-size: 12px;
	color: grey;
}

.category {
	background-color: rgba(50,64,62,0.5);
	width: 80%;
	height: 80px;
	border-radius: 10px;
	display:flex;
	justify-content: space-evenly;	
	margin-bottom: 20px;
	align-items: center;
}

.category div {
	color: white;
	font-size:25px;
	width: 80px;
	height:60px;
	text-align: center;
	line-height: 60px;
	cursor: pointer;
}

.category div:hover{
	background-color: rgba(50,64,62,1);
}


.box {
	position : relative;
	height: 50px;
    width: 80%;
	margin: 0 10% 20px 7%;
	display : flex;
}

.sub_category {
	cursor : pointer;
	text-align: center; 
	color: white;
	width: 120px;
	height: 50px;
	font-size : 20px;
	margin : 0 125px 0 0;
	line-height: 50px;
	border-radius: 4px;
	display: flex;
	justify-content: center;
	background-color: rgba(50,64,62,0.5);
}

.sub_category:hover{
	background-color: rgba(50,64,62,1);
}

.sub_categor_box{
	width: 80%;
	justify-content:flex-end;
	display : flex;
	margin : 0 0 0 55%;
	box-sizing: border-box;
}

.sub_category_arrow{
	width:20px;
}


</style>
<body>
<script src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
		crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<!-- On tables -->
<div id="table_chart">
	<div class="catergory_box">
		<span>라인별 픽률 0.5% 이상만 표시</span>
		<div class="category">
			<div class="top">탑</div>
			<div class="jungle">정글</div>
			<div class="mid">미드</div>
			<div class="adc">바텀</div>
			<div class="sup">서폿</div>
		</div>
	</div>
	
	<div class="contents_box">
		<div class="box">
			<div class = "sub_categor_box">
			<div class="sub_category">승률</div>
			<div id=pick_rate class="sub_category">픽률</div>
			<div class="sub_category">KDA</div>
			</div>
		</div>

		<div class="table_box">
			<table class="table table-hover">
			</table>
		</div>
	</div>
</div>



	<script type="text/javascript">

	$.ajax({
		method : 'get',
		url : '/getinfo',
		data : {lane:'Top'}
		}).done(res=>{
			$('.sub_categor_box span').css('background-color','rgba(50,64,62,0.5)')
			$('.top').css('background-color','rgba(50,64,62,1')
			$('#pick_rate').css('background-color','rgba(50,64,62,1')
			let cList='<tbody>';
			let i = 1;
			for(champion of res){
				cList += '<tr id="'+champion.cid+'" class="'+champion.lane+'" height="20" align="center" onclick="detail(this)">'
				cList += '<th align="center">'+i+'</th>'
				cList += '<td><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+champion.cn_eg+'.png" alt="#"></td>'
				cList += '<td align="center">'+champion.cn_kr+'</td>'
				cList += '<td align="center">'+champion.winrate+'%</td>'
				cList += '<td align="center">'+champion.pickrate+'%</td>'
				cList += '<td align="center">'+champion.kda+'</td></tr>'
				i++;
			}
			cList+='</tbody>';
			$('.table').html(cList);
		})
		
	$('.top').click(function(){
		$('.category div').css('background-color','rgba(50,64,62,0)')
		$('.sub_categor_box span').css('background-color','rgba(50,64,62,0.5)')
		$(this).css('background-color','rgba(50,64,62,1')
		$('#pick_rate').css('background-color','rgba(50,64,62,1')
		$.ajax({
			method : 'get',
			url : '/getinfo',
			data : {lane:'Top'}
		}).done(res=>{
			let cList='<tbody>';
			let i = 1;
				for(champion of res){
					cList += '<tr id="'+champion.cid+'" class="'+champion.lane+'" height="20" align="center" onclick="detail(this)">'
					cList += '<td align="center">'+i+'</td>'
					cList += '<td><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+champion.cn_eg+'.png" alt="#"></td>'
					cList += '<td align="center">'+champion.cn_kr+'</td>'
					cList += '<td align="center">'+champion.winrate+'%</td>'
					cList += '<td align="center">'+champion.pickrate+'%</td>'
					cList += '<td align="center">'+champion.kda+'</td>'
					cList += '</tr>'
					i++
				}
				cList+='</tbody>';
				$('.table').html(cList);
		}).fail(err=>{
			console.log(err)
		})
	})
	
	$('.jungle').click(function(){
		$('.category div').css('background-color','rgba(50,64,62,0)')
		$(this).css('background-color','rgba(50,64,62,1')
		$('.sub_categor_box span').css('background-color','rgba(50,64,62,0.5)')
		$('#pick_rate').css('background-color','rgba(50,64,62,1')
		$.ajax({
			method : 'get',
			url : '/getinfo',
			data : {lane:'Jungle'}
		}).done(res=>{
			let cList='<tbody>';
			let i = 1;
				for(champion of res){
					cList += '<tr id="'+champion.cid+'" class="'+champion.lane+'" height="20" align="center" onclick="detail(this)">'
					cList += '<td align="center">'+i+'</td>'
					cList += '<td><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+champion.cn_eg+'.png" alt="#"></td>'
					cList += '<td align="center">'+champion.cn_kr+'</td>'
					cList += '<td align="center">'+champion.winrate+'%</td>'
					cList += '<td align="center">'+champion.pickrate+'%</td>'
					cList += '<td align="center">'+champion.kda+'</td>'
					cList += '</tr>'
					i++
				}
				cList+='</tbody>';
				$('.table').html(cList);
		}).fail(err=>{
			console.log(err)
		})
	})
	
	$('.mid').click(function(){
		$('.category div').css('background-color','rgba(50,64,62,0)')
		$(this).css('background-color','rgba(50,64,62,1')
		$('.sub_categor_box span').css('background-color','rgba(50,64,62,0.5)')
		$('#pick_rate').css('background-color','rgba(50,64,62,1')
		$.ajax({
			method : 'get',
			url : '/getinfo',
			data : {lane:'MIDDLE'}
		}).done(res=>{
			let cList='<tbody>';
			let i = 1;
				for(champion of res){
					cList += '<tr id="'+champion.cid+'" class="'+champion.lane+'" height="20" align="center" onclick="detail(this)">'
					cList += '<td align="center">'+i+'</td>'
					cList += '<td><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+champion.cn_eg+'.png" alt="#"></td>'
					cList += '<td align="center">'+champion.cn_kr+'</td>'
					cList += '<td align="center">'+champion.winrate+'%</td>'
					cList += '<td align="center">'+champion.pickrate+'%</td>'
					cList += '<td align="center">'+champion.kda+'</td>'
					cList += '</tr>'
					i++
				}
				cList+='</tbody>';
				$('.table').html(cList);
		}).fail(err=>{
			console.log(err)
		})
	})
	
	$('.adc').click(function(){
		$('.category div').css('background-color','rgba(50,64,62,0)')
		$(this).css('background-color','rgba(50,64,62,1')
		$('.sub_categor_box span').css('background-color','rgba(50,64,62,0.5)')
		$('#pick_rate').css('background-color','rgba(50,64,62,1')
		$.ajax({
			method : 'get',
			url : '/getinfo',
			data : {lane:'Bot'}
		}).done(res=>{
			let cList='<tbody>';
			let i = 1;
				for(champion of res){
					cList += '<tr id="'+champion.cid+'" class="'+champion.lane+'" height="20" align="center" onclick="detail(this)">'
					cList += '<td align="center">'+i+'</td>'
					cList += '<td><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+champion.cn_eg+'.png" alt="#"></td>'
					cList += '<td align="center">'+champion.cn_kr+'</td>'
					cList += '<td align="center">'+champion.winrate+'%</td>'
					cList += '<td align="center">'+champion.pickrate+'%</td>'
					cList += '<td align="center">'+champion.kda+'</td>'
					cList += '</tr>'
					i++
				}
				cList+='</tbody>';
				$('.table').html(cList);
		}).fail(err=>{
			console.log(err)
		})
	})
	
	$('.sup').click(function(){
		$('.category div').css('background-color','rgba(50,64,62,0)')
		$(this).css('background-color','rgba(50,64,62,1')
		$('.sub_categor_box span').css('background-color','rgba(50,64,62,0.5)')
		$('#pick_rate').css('background-color','rgba(50,64,62,1')
		$.ajax({
			method : 'get',
			url : '/getinfo',
			data : {lane:'Supporter'}
		}).done(res=>{
			let cList='<tbody>';
			let i = 1;
				for(champion of res){
					cList += '<tr id="'+champion.cid+'" class="'+champion.lane+'" height="20" align="center" onclick="detail(this)">'
					cList += '<td align="center">'+i+'</td>'
					cList += '<td><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+champion.cn_eg+'.png" alt="#"></td>'
					cList += '<td align="center">'+champion.cn_kr+'</td>'
					cList += '<td align="center">'+champion.winrate+'%</td>'
					cList += '<td align="center">'+champion.pickrate+'%</td>'
					cList += '<td align="center">'+champion.kda+'</td>'
					cList += '</tr>'
					i++
				}
				cList+='</tbody>';
				$('.table').html(cList);
		}).fail(err=>{
			console.log(err)
		})
	})
	
    function detail(champion){
		let cid=champion.getAttribute("id")
		let lane=champion.getAttribute("class")
        location.href="/detail/?cid="+cid+"&lane="+lane
    }

	
	let reverse_switch_pickrate=true;
	let reverse_switch_winrate=false;
	let reverse_switch_kda=false;
	
	$('.sub_categor_box div').click(function(){
		let _lane=$('tr').first().attr('class')
		let align=$(this).text()
		console.log(align)
		if(align=='승률'){
			console.log()
			$('.sub_categor_box div').css('background-color','rgba(50,64,62,0.5)');
			$(this).css('background-color','rgba(50,64,62,1');
			reverse_switch_pickrate=false;
			reverse_switch_kda=false;
			$.ajax({
				method : 'get',
				url : '/getinfo-winrate',
				data : {lane:_lane}
				}).done(res=>{
					if(reverse_switch_winrate){
					res=$(res).get().reverse()
					reverse_switch_winrate=false;
					}else{
						reverse_switch_winrate=true;
					}
					let cList='<tbody>';
					let i = 1;
					for(champion of res){
						cList += '<tr id="'+champion.cid+'" class="'+champion.lane+'" height="20" align="center" onclick="detail(this)">'
						cList += '<th align="center">'+i+'</th>'
						cList += '<td><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+champion.cn_eg+'.png" alt="#"></td>'
						cList += '<td align="center">'+champion.cn_kr+'</td>'
						cList += '<td align="center">'+champion.winrate+'%</td>'
						cList += '<td align="center">'+champion.pickrate+'%</td>'
						cList += '<td align="center">'+champion.kda+'</td></tr>'
						i++;
					}
					cList+='</tbody>';
					$('.table').html(cList);
				})
		}
		if(align=='픽률'){
			$('.sub_categor_box div').css('background-color','rgba(50,64,62,0.5)')
			$(this).css('background-color','rgba(50,64,62,1')
			$.ajax({
				method : 'get',
				url : '/getinfo',
				data : {lane:_lane}
				}).done(res=>{
					reverse_switch_winrate=false;
					reverse_switch_kda=false;
					if(reverse_switch_pickrate){
					res=$(res).get().reverse()
					reverse_switch_pickrate=false;
					}else{
						reverse_switch_pickrate=true;
					}
					let cList='<tbody>';
					let i = 1;
					for(champion of res){
						cList += '<tr id="'+champion.cid+'" class="'+champion.lane+'" height="20" align="center" onclick="detail(this)">'
						cList += '<th align="center">'+i+'</th>'
						cList += '<td><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+champion.cn_eg+'.png" alt="#"></td>'
						cList += '<td align="center">'+champion.cn_kr+'</td>'
						cList += '<td align="center">'+champion.winrate+'%</td>'
						cList += '<td align="center">'+champion.pickrate+'%</td>'
						cList += '<td align="center">'+champion.kda+'</td></tr>'
						i++;
					}
					cList+='</tbody>';
					$('.table').html(cList);
				})
		}
		if(align=='KDA'){
			$('.sub_categor_box div').css('background-color','rgba(50,64,62,0.5)')
			$(this).css('background-color','rgba(50,64,62,1')
			$.ajax({
				method : 'get',
				url : '/getinfo-kda',
				data : {lane:_lane}
				}).done(res=>{
					reverse_switch_pickrate=false;
					reverse_switch_winrate=false;
					if(reverse_switch_kda){
					res=$(res).get().reverse()
					reverse_switch_kda=false;
					}else{
						reverse_switch_kda=true;
					}
					let cList='<tbody>';
					let i = 1;
					for(champion of res){
						cList += '<tr id="'+champion.cid+'" class="'+champion.lane+'" height="20" align="center" onclick="detail(this)">'
						cList += '<th align="center">'+i+'</th>'
						cList += '<td><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+champion.cn_eg+'.png" alt="#"></td>'
						cList += '<td align="center">'+champion.cn_kr+'</td>'
						cList += '<td align="center">'+champion.winrate+'%</td>'
						cList += '<td align="center">'+champion.pickrate+'%</td>'
						cList += '<td align="center">'+champion.kda+'</td></tr>'
						i++;
					}
					cList+='</tbody>';
					$('.table').html(cList);
				})
		}
	})
	
</script>
</body>
</html>