<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"></head>

<style>
table th,td{
	line-height: 120px;
	width : 200px;
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
		 <span>라인별 픽률 0.5% 이상만 표시</span>
		<div class="category">
			<div class="top">탑</div>
			<div class="jungle">정글</div>
			<div class="mid">미드</div>
			<div class="adc">바텀</div>
			<div class="sup">서폿</div>
	</div>

	<div>
		<div class="sub_category">승률</div>
		<div class="sub_category">픽률</div>
	</div>


		<table class="table table-hover">

		</table>
		<!-- <span class="title">통계</span>
		<div class="category">
			<div class="position_btn">탑</div>
			<div class="position_btn">정글</div>
			<div class="position_btn">미드</div>
			<div class="position_btn">바텀</div>
			<div class="position_btn">서폿</div>
			<div class="position_btn">전체</div>
		</div> -->

	</div>



<script type="text/javascript">

	$('tr').click(function(){
		console.log(this)
	})

	$.ajax({
		method : 'get',
		url : '/getinfo',
		data : {lane:'t'}
		}).done(res=>{
			console.log(res)
			let lanet='t';
			let cList='<tbody>';
			let i = 1;
			for(champion of res){
				cList += '<tr height="20" align="center" onclick="detail()">'
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
		
	function detail(){
		location.href="/detail/?cid=168&lane=t"	
	}		

</script>
</body>
</html>