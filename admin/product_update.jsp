<%@page import="project.ProductDto"%>
<%@page import="project.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int prodnum = Integer.parseInt(request.getParameter("prodnum"));
ProductDao dao = ProductDao.getInstance();
ProductDto product = dao.getProduct(prodnum);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 수정</title>
<script>
	//상품을 추가하기위한 정보를 담아 insert.do로 보내는 자바스크립트 함수
	function product_write() {

		var name = document.form1.name.value; // document는 웹페이지에 접근하기위한 객체.. form1에 있는 상품이름을 반환해서 name에 저장함
		var price = document.form1.price.value; // document는 웹페이지에 접근하기위한 객체.. form1에 있는 상품의 값을 반환해서 price에 저장함
		var description = document.form1.description.value; // document는 웹페이지에 접근하기위한 객체.. form1에 있는 상품의 정보를 반환해서 description에 저장함
		var kind = document.form1.kind.value;
		var company = document.form1.company.value;

		//document.form.은 폼페이지에 있는 값을 반환한다는 뜻.

		if (name == "") { //상품 이름이 입력되어 있지 않으면
			alert("상품명을 입력하세요");
			document.form1.name.focus(); //form1페이지에 있는 "상품명을 입력하세요" 에 커서를 올려둔다.
			return false;
		}
		if (company == "") {
			alert("제조사를 입력하세요");
			document.form1.company.focus();
			return false;
		}
		if (kind == "") { //상품 이름이 입력되어 있지 않으면
			alert("상품종류를 입력하세요");
			document.form1.kind.focus(); //form1페이지에 있는 "상품명을 입력하세요" 에 커서를 올려둔다.
			return false;
		}
		if (price == "") { //상품가격이 입력되어 있지 않으면
			alert("가격을 입력하세요");
			document.form1.price.focus(); //form1페이지에 있는 "가격을 입력하세요" 에 커서를 올려둔다.
			return false;
		}
		if (description == "") { //상품설명이 입력되어 있지 않으면
			alert("상품설명을 입력하세요");
			document.form1.description.focus(); //form1페이지에 있는 "상품설명을 입력하세요" 에 커서를 올려둔다.
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
					<h2>상품 정보 수정</h2>
					<form id="form1" name="form1" method="post" accept-charset="UTF-8"
						action="product_updateProc.jsp" onsubmit="return product_write()">
						<!-- 파일업로드를 위해 추가하는 타입 -->

						<input type="hidden" name="prodnum" value="<%=prodnum%>">
						<table>
							<tr>
								<td>상품명</td>
								<td><input name="name" value="<%=product.getName()%>"></td>
							</tr>
							<tr>
								<td>제조사</td>
								<td><input name="company" value="<%=product.getCompany()%>"></td>
							</tr>
							<tr>
								<td>상품 종류</td>
								<td>
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-secondary"> <input type="radio"
											name="kind" id="option1" autocomplete="off"
											<%if (product.getKind().equals("cpu"))
	out.print("checked");%>
											value="cpu"> cpu
										</label> <label class="btn btn-secondary"> <input type="radio"
											name="kind" id="option2" autocomplete="off"
											<%if (product.getKind().equals("mainboard"))
	out.print("checked");%>
											value="mainboard"> mainboard
										</label> <label class="btn btn-secondary"> <input type="radio"
											name="kind" id="option3" autocomplete="off"
											<%if (product.getKind().equals("memory"))
	out.print("checked");%>
											value="memory"> memory
										</label> <label class="btn btn-secondary"> <input type="radio"
											name="kind" id="option4" autocomplete="off"
											<%if (product.getKind().equals("graphic"))
	out.print("checked");%>
											value="graphic"> graphic
										</label><label class="btn btn-secondary"> <input type="radio"
											name="kind" id="option5" autocomplete="off"
											<%if (product.getKind().equals("power"))
	out.print("checked");%>
											value="power"> power
										</label> <label class="btn btn-secondary"> <input type="radio"
											name="kind" id="option6" autocomplete="off"
											<%if (product.getKind().equals("case"))
	out.print("checked");%>
											value="case"> case

										</label> <label class="btn btn-secondary"> <input type="radio"
											name="kind" id="option7" autocomplete="off"
											<%if (product.getKind().equals("cooler"))
	out.print("checked");%>
											value="cooler"> cooler
										</label>
									</div>
								</td>

							</tr>
							<tr>
								<td>가격</td>
								<td><input type="text" name="price"
									value="<%=product.getPrice1()%>"></td>
							</tr>
							<tr>
								<td>상품설명</td>
								<td><textarea rows="5" cols="60" name="description"
										id="description"><%=product.getContent()%></textarea></td>
							</tr>
							<!-- 							<tr> -->
							<!-- 								<td>상품이미지</td> -->
							<!-- 								<td><input type="file" name="filename"></td> -->
							<!-- 							</tr> -->

							<tr>
								<td colspan="2" align="center"><input type="submit"
									value="등록"> <!-- "등록" 버튼을 누르면 위쪽에 있는 스크립트문에서 product_write()함수가 호출되서 실행되 insert.do페이지로 자료를 전송한다. -->
									<input type="button" value="목록"
									onclick="location.href='product.jsp'"> <!-- "목록 버튼을 누르면 list.do페이지로 이동" -->
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