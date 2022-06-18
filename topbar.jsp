<%@page import="project.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
UserDBBean dao = UserDBBean.getInstance();
String username = (String) session.getAttribute("username");
String useremail = (String) session.getAttribute("useremail");
String userpw = (String) session.getAttribute("userpw");
int admin_on = dao.getAdmin(useremail, userpw, username);
%>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<nav class="navbar navbar-expand-lg navbar-white bg-white">
	<div class="container">
		<a class="navbar-brand" href="index.jsp"> <img
			src="https://blog.kakaocdn.net/dn/InUBU/btrCMbLB5Os/G4tZ1b2ollqfyC8gTzpf8k/img.png"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<form action="itemlist.jsp" class="mt-5 search-bar input-group mb-3">
			<input class="form-control " type="search"
				placeholder="찾고싶은 상품명을 입력해주세요!" aria-label="Search" name="query">

			<button class="mb-auto btn btn-outline-success me-2" type="submit">
				<div class="search">
					<i class="bi bi-search"></i>

				</div>
			</button>
		</form>

		<div class="collapse navbar-collapse " id="navbarSupportedContent">
			<%
			if (username == null) {
			%>


			<!--End button -->

			<form action="login.jsp">
				<a class="navbar-brand" href="login.jsp"><img
					src="https://blog.kakaocdn.net/dn/cCjkUO/btrCLBiV7yq/J89xwJL50CInmhmk1PwxZ1/img.png"></a>
			</form>
			<%
			} else if (username != null) {
			%>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="navbarDropdown" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> <%=username%>
				</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="login.jsp">로그아웃</a></li>
						<li><a class="dropdown-item" href="qnalist.jsp">고객센터</a></li>
					</ul></li>
			</ul>
			<%
			}
			%>
			<form action="mypage.jsp">
				<a class="navbar-brand" href="mypage.jsp"> <img
					src="https://blog.kakaocdn.net/dn/26aH3/btrCMWUpDBm/XFNx1mCHiDQSm35vyBBokK/img.png"></a>
			</form>
			<form action="cart.jsp">
				<a class="navbar-brand" href="cart.jsp"><img
					src="https://blog.kakaocdn.net/dn/bDu9DO/btrCLlzsMOL/KXb0UYHEjRFkZp2pTE6Lk1/img.png"></a>
			</form>
		</div>
	</div>
</nav>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<jsp:include page="category.jsp"></jsp:include>
	</div>
</nav>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>