<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 정보</title>
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
	<jsp:include page="topbar.jsp" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">배송 정보</h1>
		</div>
	</div>

	<div class="container">
		<form action="processShippingInfo.jsp" class="form-horizontal"
			method="post">
			<input type="hidden" name="cartId"
				value="<%=request.getParameter("cartId")%>" />
			<!-- 성명을 입력받는 부분 -->
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control"
						placeholder="성명" />
				</div>
			</div>
			<!-- 배송일을 입력받는 부분 -->
			<div class="form-group row">
				<label class="col-sm-2">배송일</label>
				<div class="col-sm-3">
					<input type="text" name="shoppingDate" class="form-control"
						placeholder="yyyy/mm/dd" />
				</div>
			</div>
			<!-- 국가명을 입력받는 부분 -->
			<div class="form-group row">
				<label class="col-sm-2">국가명</label>
				<div class="col-sm-3">
					<input type="text" name="country" class="form-control"
						placeholder="국가명" />
				</div>
			</div>
			<!-- 우편번호를 입력받는 부분 -->
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input type="text" name="zipCode" class="form-control"
						placeholder="우편번호" />
				</div>
			</div>
			<!-- 주소를 입력받는 부분 -->
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" name="addressName" class="form-control"
						placeholder="주소" />
				</div>
			</div>
			<!-- 이전 페이지, 등록, 취소 버튼을 생성 -->
			<div class="form-group row">
				<div class="col-sm-offset2 col-sm-10">
					<a href="cart.jsp?cartId=<%=request.getParameter("cartId")%>"
						class="btn btn-secondary" role="button">이전</a> <input
						type="submit" class="btn btn-primary" value="등록" /> <a
						href="checkOutCancelled.jsp" class="btn btn-danger"
						role="button">취소</a>
				</div>
			</div>
		</form>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>