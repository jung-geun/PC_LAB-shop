<%@page import="java.text.DecimalFormat"%>
<%@page import="project.ProductDao"%>
<%@page import="project.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%
int item = Integer.parseInt(request.getParameter("item"));
String username = (String) session.getAttribute("username");
DecimalFormat dFormat = new DecimalFormat("###,###");
int count = 1;
if (request.getParameter("count") == null) {
	count = 1;
} else {
	count = Integer.parseInt(request.getParameter("count"));
}
ProductDao dao = ProductDao.getInstance();
ProductDto product = dao.getProduct(item);
int viewnum = product.getViewnum();
dao.updateViewnum(viewnum + 1, product.getProdnum());
%>
<html>
<head>
<meta charset="UTF-8">
<title>PC LAB</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">


<link rel="stylesheet" href="css/pdefault.css">
<link rel="stylesheet" href="css/pstyle.css">
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>

	<div class="product_view">
		<h2><%=product.getName()%></h2>
		<table>
			<caption>
				<details class="hide">
					<summary>상품정보</summary>
					판매가, 상품코드, 옵션 및 결제금액 안내
				</details>
			</caption>
			<colgroup>
				<col style="width: 173px;">
				<col>
			</colgroup>

			<tbody name="page">
				<tr>
					<th>판매가</th>
					<td class="price"><%=dFormat.format(Integer.parseInt(product.getPrice1()))%></td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td><%=product.getProdnum()%></td>
				</tr>
				<tr>
					<th>제조사</th>
					<td><%=product.getCompany()%></td>
				</tr>
				<tr>
					<th>구매수량</th>
					<td><input type="number" name="amount" min="1"
						value="<%=count%>" style="width: 40px;"></td>
				</tr>
				<!-- 				<tr> -->
				<!-- 					<th>사용가능쿠폰</th> -->
				<!-- 					<td>0개</td> -->
				<!-- 				</tr> -->
				<tr>
					<th>옵션선택</th>
					<td><select>
							<option>기본(+0)</option>
					</select></td>
				</tr>
				<tr>
					<th>배송비</th>
					<td>무료배송</td>
				</tr>
				<tr>
					<th>결제금액</th>
					<td class="total"><b><%=dFormat.format(Integer.parseInt(product.getPrice1()))%></b>원</td>
				</tr>
			</tbody>
		</table>
		<div class="img">
			<%
			if (product.getImage() != null) {
			%>
			<img src="img/<%=product.getImage()%>" alt="img">
			<%
			} else {
			%>
			<img
				src="https://blog.kakaocdn.net/dn/czM5xA/btrDkChabbk/7NbfRZDG3KSF9s62ImFkn0/img.png"
				alt="">
			<%
			}
			%>
		</div>
		<div class="btns">
			<!-- 			<a href="cartadd.jsp" class="btn1">장바구니</a> <a href="price.jsp" -->
			<!-- 				class="btn2">구매하기</a> -->
			<button class="btn btn-secondary"
				onclick="location='cartadd.jsp?item=<%=product.getProdnum()%>'">장바구니</button>
			<button class="btn btn-primary" onclick="price()">구매하기</button>
		</div>
	</div>



	<jsp:include page="footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="js/script.js"></script>
</body>
</html>