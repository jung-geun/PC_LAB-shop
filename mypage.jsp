<%@page import="project.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String username = (String) session.getAttribute("username");
String useremail = (String) session.getAttribute("useremail");
if (username == null) {
%>
<script>
	alert("로그인 후 이용해 주세요!");
</script>
<%
response.sendRedirect("login.jsp");
}

OrderDao orderdao = OrderDao.getInstance();
int ordercount = orderdao.getOrderCount_email(useremail);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/style2.css">
<link rel="stylesheet" href="css/pagestyle.css">
<link rel="stylesheet" href="css/siderastyle.css">
</head>
<body>
	<jsp:include page="topbar2.jsp"></jsp:include>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							내정보 관리 </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">비밀번호 변경</a></li>
							<li><a class="dropdown-item" href="#">배송지 입력</a></li>
							<li><a class="dropdown-item" href="#">계정 삭제</a></li>
						</ul></li>

					<li class="nav-item"><a class="nav-link" href="#">캐시 충전</a></li>
				</ul>

			</div>
		</div>
	</nav>

	<table class=tbl>
		<tr>
			<td class="a1">나의캐시</td>
			<td>배송 중</td>
			<td>배송완료</td>
			<td>결제내역</td>
		</tr>
		<tr>
			<td class="a1"><span style="font-size: 30px"><a href="#">0</a></span>
				원</td>
			<td><span style="font-size: 30px"><a href="#"><%=ordercount%></a></span>
				개</td>
			<td><span style="font-size: 30px"><a href="#">0</a></span> 개</td>
			<td><span style="font-size: 30px"><a href="#">0</a></span> 개</td>
		</tr>

	</table>
	<jsp:include page="footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>