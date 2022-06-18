<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="project.ProductDto"%>
<%@page import="project.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
int productCount = 0;
String query = request.getParameter("query");
String kind = request.getParameter("kind");
ProductDao dao = ProductDao.getInstance();
List<ProductDto> productList = null;
productCount = dao.getProductCount();
DecimalFormat dFormat = new DecimalFormat("###,###");

if (query != null) {
	productList = dao.searchItem(query);
	productCount = dao.searchItemCount(query);

} else if (kind != null) {
	productList = dao.getProducts_kind(kind);
	productCount = dao.getProductCount_kind(kind);

} else {
	query = "nothing";
	kind = "nothing";
	productList = dao.getProducts();
	productCount = dao.getProductCount();
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>PC LAB</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/itemstyles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>

	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

				<%
				if (productCount == 0) {
				%>
				<img alt="상품 준비중" src="img/getting_ready.jpg">
				<%
				} else {

				for (int i = 0; i < productCount; i++) {
					ProductDto product = productList.get(i);
				%>
				<div class="col mb-5">
					<div class="card h-100"
						onclick="location='itempage.jsp?item=<%=product.getProdnum()%>'">
						<!-- Product image-->
						<img class="card-img-top"
							src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder"><%=product.getName()%></h5>
								<!-- Product reviews-->
								<div
									class="d-flex justify-content-center small text-warning mb-2">
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
									<div class="bi-star-fill"></div>
								</div>
								<!-- Product price-->
								<span id="money"><%=dFormat.format(Integer.parseInt(product.getPrice1()))%></span>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"
									href="cartadd.jsp?item=<%=product.getProdnum()%>&count=1">Add
									to cart</a>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

</body>
</html>
