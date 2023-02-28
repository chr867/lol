<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>

<div>
<img id="img" alt="#" src="">
<p>${champion.cn_kr}</p>

<!-- </div>
	<form method = "get" action="detail">
	</form>
	<div class = "chart">
</div> -->
</body>

<script type="text/javascript">
	//console.log($('#img'))
	let cn_eg='${champion.cn_eg}'
	console.log(cn_eg)
	$('#img').attr('src','https://ddragon.leagueoflegends.com/cdn/10.6.1/img/champion/'+cn_eg+'.png')
	
	/* google.charts.load('current', {'packages' : ['corechart']});
	google.charts.setOnLoadCallback(drawVisualization);
	
	function drawVisualization(){
		let win_data = google.visualization.arrayToDataTable([
			['Win_Rate', 'Pick_Rate', 'KDA'],
			[${champion.winrate}, ${champion.pickrate}, ${champion.kda}]
		]);
		
		let options = {
				title : '${champion.cn_kr}' + " 통계",
				vAxis : {title : ''},
				hAxis : {title : ''},
				seriesType : 'bars',
		};
		
		let chart = new google.visualization.ComboChart(document.querySelector('.chart'));
		chart.draw(win_data, options);
	} */
	
	
</script>

</html>