<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	height: 100vh;
	background-image:
		url('https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${champion.cn_eg}_0.jpg');
	background-size: cover;
	text-align: center;
	background-repeat: no-repeat;
}

#versus-top-container {
	margin: auto;
	border-radius: 5px;
	padding: 40px;
	position: relative;
	width: 70%;
}

#versus-top-container:before {
	content: "";
	background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url('https://cdn.pixabay.com/photo/2014/06/15/22/36/pattern-369543_960_720.png');
	background-position: center;
	background-size: cover;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	filter: blur(10px);
	z-index: -1;
	opacity: 0.9;
}

.left-champion-info, .right-champion-info {
	text-align: center;
	cursor: pointer;
}

.champion-info img {
	width: 110%;
	border-radius: 50%;
}

.champion-name, .versus-text {
	width: 31.5%;
	color: #dedfe7;
	font-size: 30px;
	font-weight: 700;
	margin-bottom: 10px;
	font-family: 'Noto Sans KR', sans-serif;
}

.lane {
	display: flex;
	justify-content: center;
	width: 400px;
	color: #dedfe7;
	font-size: 35px;
	margin-top: 10%;
	margin-bottom: 1.5%;
	margin-left:10%;
	font-weight: 700;
	text-shadow: 2px 2px 2px gray;
}

.lane img {
	height: 46px;
	display: flex;
	justify-content: center;
}

.champion-stats, .versus-stats {
	display: flex;
	justify-content: space-between;
	margin-top: 10px;
}

.stat, .versus-stat {
	color: #828799;
	font-size: 18px;
}

.title {
	width: 160px;
	color: #635efd;
	font-weight: 800;
	font-size: x-large;
}

.value {
	width: 160px;
	color: #dedfe7;
	font-size: 35px;
	font-weight: 600;
}

.value1 {
	width: 160px;
	color: #dedfe7;
	font-size: 25px;
	font-weight: 600;
}

.versus-text {
	text-align: center;
}

.row1 {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

.row2 {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: space-evenly;
	align-items: center;
}

.row3 {
	display: flex;
	justify-content: left;
}

.container-fluid {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
}

.stat {
	display: flex;
	flex-direction: column;
}

.versus-stat {
	display: flex;
	flex-direction: column;
}

.champion-stats {
	display: flex;
	flex-direction: row;
	justify-content: space-evenly;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
<body>
	<div class="row3">
		<div class="lane">${champion.lane}</div>
	</div>
	<section id="versus-top-container">

		<div class="container-fluid">

			<div class="row1">
				<div class="champion-name">${champion.cn_kr}</div>
				<div class="versus-text" style="width: 60px">VS</div>
				<div class="champion-name">${enemy.cn_kr}</div>
			</div>
			<div class="row2">
				<div class="champion-stats">
					<div class="stat">
						승률<span class="value1">${champion.winrate}</span>
					</div>
					<div class="stat">
						<span class="stat">표본 수</span> <span class="value1">${champion_total}</span>
					</div>
				</div>
				<div class="col-md-4 col-xs-12 left-champion-info">
					<div class="champion-info" onclick="move_champion()">
						<img
							src="//ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/${champion.cn_eg}.png"
							alt="Champion Image" class="champion-image">

					</div>
				</div>
				<div class="col-md-4 col-xs-12 center-info">

					<div class="versus-stats">
						<div class="versus-stat">
							<span class="title">상대 승률</span> <span class="value">${c.winrate}</span>
						</div>
						<div class="versus-stat">
							<span class="title">표본 수</span> <span class="value">${c.match}</span>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-xs-12 right-champion-info">
					<div class="champion-info" onclick="move_enemy()">
						<img
							src="//ddragon.leagueoflegends.com/cdn/11.7.1/img/champion/${enemy.cn_eg}.png"
							alt="Champion Image" class="champion-image">
					</div>
				</div>
				<div class="champion-stats ">
					<div class="stat">
						승률<span class="value1">${enemy.winrate}</span>
					</div>
					<div class="stat">
						<span class="stat">표본 수</span> <span class="value1">${enemy_total}</span>
					</div>
				</div>
			</div>

		</div>
	</section>

	<script type="text/javascript">
	function	move_champion(){
		let cid=${champion.cid}
		let lane='${champion.lane}'
		location.href="/detail/?cid="+cid+"&lane="+lane		
	}
	
	function move_enemy(){
		let cid=${enemy.cid}
		let lane='${enemy.lane}'
		location.href="/detail/?cid="+cid+"&lane="+lane		
	}
		
		$(function() {
			if ($('.lane').html() === "Top") {
				var image = new Image();
				image.src = 'https://ditoday.com/wp-content/uploads/2022/02/ps_top.png';
				$('.lane').html("탑").append(image);
			}
			if ($('.lane').html() === "Middle") {
				var image = new Image();
				image.src = 'https://ditoday.com/wp-content/uploads/2022/02/ps_mid.png';
				$('.lane').html("미드").append(image);
			}
			if ($('.lane').html() === "Bot") {
				var image = new Image();
				image.src = 'https://ditoday.com/wp-content/uploads/2022/02/ps_bot.png';
				$('.lane').html("바텀").append(image);
			}
			if ($('.lane').html() === "Jungle") {
				var image = new Image();
				image.src = 'https://ditoday.com/wp-content/uploads/2022/02/ps_jungle.png';
				$('.lane').html("정글").append(image);
			}
			if ($('.lane').html() === "Supporter") {
				var image = new Image();
				image.src = 'https://ditoday.com/wp-content/uploads/2022/02/ps_suppot.png';
				$('.lane').html("서포터").append(image);
			}
		});
	</script>
</body>
</html>