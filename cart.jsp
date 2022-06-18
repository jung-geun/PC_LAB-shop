<%@page import="project.ProductDao"%>
<%@page import="project.CartDto"%>
<%@page import="java.util.List"%>
<%@page import="project.CartDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="project.ProductDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%
// 세션의 고유 아이디를 가져온다.
String cartId = session.getId();
String user_name = (String) session.getAttribute("username");
String user_email = (String) session.getAttribute("useremail");
DecimalFormat dFormat = new DecimalFormat("###,###");
if (user_name == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<title>장바구니</title>
</head>
<body>
	<jsp:include page="topbar.jsp" />
	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">
		<!-- Main Content -->
		<div id="content">
			<div class="jumbotron">
				<div class="container">
					<h1 class="display-3">장바구니</h1>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<table width="100%">
						<tr>
							<td align="left"><a href="cartdelete.jsp"
								class="btn btn-danger">삭제하기</a></td>
							<td align="right"><a href="price.jsp"
								class="btn btn-success">주문하기</a></td>
						</tr>
					</table>
				</div>
				<div style="padding-top: 50px;">
					<table class="table table-hover">
						<tr>
							<th>상품</th>
							<th>가격</th>
							<th>수량</th>
							<th>소계</th>
							<th>비고</th>
						</tr>
						<%
						// 						ArrayList<ProductDto> cartList = (ArrayList<ProductDto>) session.getAttribute("cartlist");
						CartDao cartdao = CartDao.getInstance();
						List<CartDto> cartList = cartdao.getCarts(user_email);
						//out.print("cartList크기: "+ cartList.size());
						if (cartList == null) {
							cartList = new ArrayList<CartDto>();
						}
						int sum = 0;
						ProductDao dao = ProductDao.getInstance();
						ProductDto product = new ProductDto();
						for (int i = 0; i < cartdao.getCartsCount(user_email); i++) {
							CartDto cart = cartList.get(i);
							int prodnum = cart.getProdnum();
							product = dao.getProduct(prodnum);
							// 소계 = 가격 * 수량
							String price1 = product.getPrice1();
							// 							System.out.print("cart >" + i);
							int price = 0;
							if (price1 != null) {
								price = Integer.parseInt(price1);
							}
							int total = price * cart.getQuantity();
							sum += total;
						%>
						<tr>
							<td><a href="itempage.jsp?item=<%=product.getProdnum()%>"> <%=product.getName()%>
							</a></td>
							<td><%=dFormat.format(price)%></td>
							<td><%=cart.getQuantity()%></td>
							<td><%=dFormat.format(total)%></td>
							<td><button class="btn btn-warning"
									onclick="location='cartdelete.jsp?item=<%=product.getProdnum()%>'">
									삭제</button></td>
						</tr>
						<%
						}
						%>
						<tr>
							<th></th>
							<th></th>
							<th>총액</th>
							<th><%=dFormat.format(sum)%></th>
							<th></th>
						</tr>
					</table>
					<a href="itemlist.jsp" class="btn btn-secondary">&raquo; 쇼핑
						계속하기</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>