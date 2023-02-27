<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
<style>

</style>
<body>
	<hr>
	<!-- On tables -->
	<div id="table_chart">
		<span class="title">라인별 챔피언 티어</span> <span>라인별 픽률 0.5% 이상만 표시</span>
		<div class="category">
			<div class="top">탑</div>
			<div class="jungle">정글</div>
			<div class="mid">미드</div>
			<div class="adc">바텀</div>
			<div class="sup">서폿</div>
	</div>

		<div class="sub_category">승률</div>
		<div class="sub_category">픽률</div>

		<table class="table-primary">
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
		$.ajax({
			method : 'get',
			url : '/getinfo',
			data : {lane:'t'}
		}).done(res=>{
			console.log(res)
			let cList='';
			let i = 1;
			for(champion of res){
				cList += '<tr height="20" align="center">'
				cList += '<td align="center">'+i+'</td>'
				cList += '<img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+champion.cn_eg+'.png" alt="#">'
				cList += '<td align="center">'+champion.cn_kr+'</td>'
				cList += '<td align="center">'+champion.winrate+'</td>'
				cList += '<td align="center">'+champion.pickrate+'</td>'
				cList += '<td align="center">'+champion.kda+'</td></tr>'
				i++;
			}
			$('.table-primary').html(cList);
		})
</script>
</body>
</html>