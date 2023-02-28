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
<h1>detail.jsp</h1>
${champion.cn_eg}
${champion.cn_kr }
${champion.winrate }
${champion.pickrate }
${champion.lane }
	<form method = "get" action="detail">
	</form>
	<div class = "chart">
	
	</div>
</body>

<script type="text/javascript">
	
	google.charts.load('current', {'packages' : ['corechart']});
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
	}
	
	
</script>

</html>