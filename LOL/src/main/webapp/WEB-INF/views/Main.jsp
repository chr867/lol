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
z-index: -1
}

tr,span{
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
}

table th, td {
	line-height: 120px;
	width: 200px;
}

#table_chart {
	margin: 50px 0 0 0;
}

.title {
	font-size: 20px;
	color: black;
	margin: 35px 5px 0 50%;
}

.sub_title {
	font-size: 12px;
	color: grey;
}

.category {
	background-color: darkblue;
	margin: 5px 10% 10px 15%;
	width: 1000px;
	height: 50px;
	border-radius: 10px;
}

.top, .jungle, .mid, .adc, .sup {
	color: white;
	background-color: blue;
	width: 80px;
	height: 30px;
	margin: 10px 5% 10px 6.5%;
	text-align: center;
	line-height: 25px;
	float: left;
	border-radius: 8px;
	cursor: pointer;
}

.box {
	position : relative;
	left:-2%;
	width: 100%;
	height: 50px;
	margin: 0 10% 0 15%;
	display : flex;
}

.sub_category {
	text-align: center;
	background-color: blue;
	/* display : flex; */
	color: white;
	width: 60px;
	height: 30px;
	font-size : 20px;
	margin : 0 280px 0 0;
	line-height: 30px;
	border-radius: 4px;
}

.sub_categor_box{

	width: auto;
	justify-content:flex-end;
	display : flex;
	margin : 0 0 0 50%;
}
</style>
<body>
<script src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
		crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
<hr>
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
		<div class="box">
			<div class = "sub_categor_box">
			<span class="sub_category">승률</span>
			<span class="sub_category">픽률</span>
			<span class="sub_category">KDA</span>
			</div>
		</div>

	<div class="table_box">
		<table class="table table-hover">
		</table>
	</div>	
</div>



	<script type="text/javascript">

	$.ajax({
		method : 'get',
		url : '/getinfo',
		data : {lane:'Top'}
		}).done(res=>{
			let cList='<tbody>';
			let i = 1;
			for(champion of res){
				cList += '<tr id="'+champion.cid+'" class="'+champion.lane+'" height="20" align="center" onclick="detail(this)">'
				cList += '<th align="center">'+i+'</th>'
				cList += '<td><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+champion.cn_eg+'.png" alt="#"></td>'
				cList += '<td align="center">'+champion.cn_kr+'</td>'
				cList += '<td align="center">'+champion.winrate+'</td>'
				cList += '<td align="center">'+champion.pickrate+'</td>'
				cList += '<td align="center">'+champion.kda+'</td></tr>'
				i++;
			}
			cList+='</tbody>';
			$('.table').html(cList);
		})
		
		$('.top').click(function(){
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
					cList += '<td><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champ+champion.cn_eg+'.png" alt="#"></td>'
					cList += '<td align="center">'+champion.cn_kr+'</td>'ion/'
					cList += '<td align="center">'+champion.winrate+'</td>'
					cList += '<td align="center">'+champion.pickrate+'</td>'
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
		$.ajax({
			method : 'get',
			url : '/getinfo',
			data : {lane:'Jungle'}
		}).done(res=>{
			console.log("jungle res:",res);
			let cList='<tbody>';
			let i = 1;
				for(champion of res){
					cList += '<tr id="'+champion.cid+'" class="'+champion.lane+'" height="20" align="center" onclick="detail(this)">'
					cList += '<td align="center">'+i+'</td>'
					cList += '<td><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+champion.cn_eg+'.png" alt="#"></td>'
					cList += '<td align="center">'+champion.cn_kr+'</td>'
					cList += '<td align="center">'+champion.winrate+'</td>'
					cList += '<td align="center">'+champion.pickrate+'</td>'
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
					cList += '<td align="center">'+champion.winrate+'</td>'
					cList += '<td align="center">'+champion.pickrate+'</td>'
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
					cList += '<td align="center">'+champion.winrate+'</td>'
					cList += '<td align="center">'+champion.pickrate+'</td>'
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
					cList += '<td align="center">'+champion.winrate+'</td>'
					cList += '<td align="center">'+champion.pickrate+'</td>'
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
	
	$('.sub_categor_box span').click(function(){
		let _lane=$('tr').first().attr('class')
		let align=$(this).text()
		if(align=='승률'){
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
						cList += '<td align="center">'+champion.winrate+'</td>'
						cList += '<td align="center">'+champion.pickrate+'</td>'
						cList += '<td align="center">'+champion.kda+'</td></tr>'
						i++;
					}
					cList+='</tbody>';
					$('.table').html(cList);
				})
			console.log('승률 클릭')
		}
		if(align=='픽률'){
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
						cList += '<td align="center">'+champion.winrate+'</td>'
						cList += '<td align="center">'+champion.pickrate+'</td>'
						cList += '<td align="center">'+champion.kda+'</td></tr>'
						i++;
					}
					cList+='</tbody>';
					$('.table').html(cList);
				})
			console.log('픽률 클릭')	
		}
		if(align=='KDA'){
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
						cList += '<td align="center">'+champion.winrate+'</td>'
						cList += '<td align="center">'+champion.pickrate+'</td>'
						cList += '<td align="center">'+champion.kda+'</td></tr>'
						i++;
					}
					cList+='</tbody>';
					$('.table').html(cList);
				})
			console.log('KDA 클릭')	
		}
		
	})
	
</script>
</body>
</html>