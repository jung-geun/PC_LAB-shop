<%@page import="project.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PC LAB</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/style2.css">
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<!-- 슬라이드 쇼 -->
			<div class="carousel-item active">
				<!--가로-->
				<img class="d-block w-100"
					src="https://blog.kakaocdn.net/dn/dbCZZB/btrEOG3Rnoc/178g8k7JOo517dktqR5DBk/img.png"
					alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="https://blog.kakaocdn.net/dn/Vn5Wf/btrERn3fTBR/6n8JK2YAKT7mD1W6IW37ok/img.png"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="https://blog.kakaocdn.net/dn/cexsgd/btrER1TceRD/zrv6b8e8rNXNO9a92gKaK0/img.png"
					alt="Third slide">
			</div>
			<!-- / 슬라이드 쇼 끝 -->
			<!-- 왼쪽 오른쪽 화살표 버튼 -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<!-- <span>Previous</span> -->
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<!-- <span>Next</span> -->
			</a>
			<!-- / 화살표 버튼 끝 -->
			<!-- 인디케이터 -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<!--0번부터시작-->
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>
			<!-- 인디케이터 끝 -->
		</div>

		<div class="list_wrap">
			<ul>
				<li class="item item1">
					<div class="image">CPU</div>
					<div class="cont">
						<strong> CPU</strong> <a href="itemlist.jsp?kind=cpu">바로가기</a>
					</div>
				</li>
				<li class="item item2">
					<div class="image">사진</div>
					<div class="cont">
						<strong>메인보드</strong> <a href="itemlist.jsp?kind=mainboard">바로가기</a>
					</div>
				</li>
				<li class="item item3">
					<div class="image">사진</div>
					<div class="cont">
						<strong>메모리</strong> <a href="itemlist.jsp?kind=memory">바로가기</a>
					</div>
				</li>
				<li class="item item4">
					<div class="image">사진</div>
					<div class="cont">
						<strong>그래픽카드</strong> <a href="itemlist.jsp?kind=graphic">바로가기</a>
					</div>
				</li>
				<li class="item item5">
					<div class="image">사진</div>
					<div class="cont">
						<strong>파워서플라이</strong> <a href="itemlist.jsp?kind=power">바로가기</a>
					</div>
				</li>
				<li class="item item6">
					<div class="image">사진</div>
					<div class="cont">
						<strong>케이스</strong> <a href="itemlist.jsp?kind=case">바로가기</a>
					</div>
				</li>
				<li class="item item7">
					<div class="image">사진</div>
					<div class="cont">
						<strong>쿨러</strong> <a href="itemlist.jsp?kind=cooler">바로가기</a>
					</div>
				</li>
				<li class="item item8">
					<div class="image">사진</div>
					<div class="cont">
						<strong>키보드</strong> <a href="itemlist.jsp?kind=keyboard">바로가기</a>
					</div>
				</li>
				<li class="item item9">
					<div class="image">사진</div>
					<div class="cont">
						<strong>마우스</strong> <a href="itemlist.jsp?kind=mouse">바로가기</a>
					</div>
				</li>
			</ul>
		</div>

		<!-- Footer -->
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>