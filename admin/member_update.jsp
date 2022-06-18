<%@page import="project.UserDataBean"%>
<%@page import="project.UserDBBean"%>
<%@page import="project.MemberDto"%>
<%@page import="project.MemberDao"%>
<%@page import="project.ProductDto"%>
<%@page import="project.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String email = request.getParameter("email");
UserDBBean dao = UserDBBean.getInstance();
UserDataBean user = dao.getMember(email);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script>
	//상품을 추가하기위한 정보를 담아 insert.do로 보내는 자바스크립트 함수
	function member_write() {

		var name = document.form1.name.value; // document는 웹페이지에 접근하기위한 객체.. form1에 있는 상품이름을 반환해서 name에 저장함
		var email = document.form1.email.value; // document는 웹페이지에 접근하기위한 객체.. form1에 있는 상품의 값을 반환해서 price에 저장함
		var password = document.form1.password.value; // document는 웹페이지에 접근하기위한 객체.. form1에 있는 상품의 정보를 반환해서 description에 저장함

		var cash = document.form1.cash.value;

		//document.form.은 폼페이지에 있는 값을 반환한다는 뜻.

		if (name == "") { //상품 이름이 입력되어 있지 않으면
			alert("이름을 입력하세요");
			document.form1.name.focus(); //form1페이지에 있는 "상품명을 입력하세요" 에 커서를 올려둔다.
			return false;
		}
		if (email == "") {
			alert("이메일을 입력하세요");
			document.form1.email.focus();
			return false;
		}
		if (password == "") { //상품 이름이 입력되어 있지 않으면
			alert("비밀번호를 입력하세요");
			document.form1.password.focus(); //form1페이지에 있는 "상품명을 입력하세요" 에 커서를 올려둔다.
			return false;
		}
		if (cash == "") { //상품가격이 입력되어 있지 않으면
			alert("캐시을 입력하세요");
			document.form1.cash.focus(); //form1페이지에 있는 "가격을 입력하세요" 에 커서를 올려둔다.
			return false;
		}

		// input 태그를 마우스로 클릭하여 입력상태로 만든것을 포커스를 얻었다고 한다.
		// 그리고 입력상태를 떠난 것을 포커스가 벗어났다고 한다.

		return true;
	}
</script>
<jsp:include page="head.jsp"></jsp:include>
</head>
<body>
	<div id="wrapper">

		<%@include file="sidebar.jsp"%>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-cloumn">
			<!-- Main Content -->
			<div id="content">
				<%@include file="topbar.jsp"%>

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<!-- 관리자용 메뉴는 일반 회원의 메뉴와 다르기 때문에 일부러 관리자용 메뉴를 만들고 그 메뉴를 출력한다. -->
					<h2>회원 정보 수정</h2>
					<form id="form1" name="form1" method="post" accept-charset="UTF-8"
						action="member_updateProc.jsp" onsubmit="return member_write()">
						<!-- 파일업로드를 위해 추가하는 타입 -->

						<input type="hidden" name="email_be" value="<%=user.getEmail()%>">
						<table>
							<tr>
								<td>이름</td>
								<td><input name="name" value="<%=user.getName()%>"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input name="email" value="<%=user.getEmail()%>"></td>
							</tr>
							<tr>
								<td>패스워드</td>
								<td><input type="text" name="password"
									value="<%=user.getPasswd()%>"></td>
							</tr>
							<tr>
								<td>캐시</td>
								<td><input type="text" name="cash"
									value="<%=user.getCash()%>"></td>
							</tr>
							<!-- 							<tr> -->
							<!-- 								<td>상품이미지</td> -->
							<!-- 								<td><input type="file" name="filename"></td> -->
							<!-- 							</tr> -->

							<tr>
								<td colspan="2" align="center"><input type="submit"
									value="등록"> <!-- "등록" 버튼을 누르면 위쪽에 있는 스크립트문에서 product_write()함수가 호출되서 실행되 insert.do페이지로 자료를 전송한다. -->
									<input type="button" value="목록"
									onclick="location.href='member.jsp'"> <!-- "목록 버튼을 누르면 list.do페이지로 이동" -->
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>