<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="project.ProductDto"%>
<%@page import="project.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int count = 0;
DecimalFormat dFormat = new DecimalFormat("###,###");
ProductDao dao = ProductDao.getInstance();
count = dao.getProductCount();
List<ProductDto> productlist = null;
productlist = dao.getProducts();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리</title>
<jsp:include page="head.jsp"></jsp:include>
</head>
<body id="page-top">
	<div id="wrapper">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-cloumn">
			<!-- Main Content -->
			<div id="content">

				<jsp:include page="topbar.jsp"></jsp:include>
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Tables</h1>
					<a href="product_write.jsp">상품 추가</a>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Product Table</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered display" id="dataTable"
									width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>Product Number</th>
											<th>Name</th>
											<th>Company</th>
											<th>Kind</th>
											<th>Price</th>
											<th>Register Data</th>
											<th>Note</th>
										</tr>
									</thead>

									<tfoot>
										<tr>
											<th>Product Number</th>
											<th>Name</th>
											<th>Company</th>
											<th>Kind</th>
											<th>Price</th>
											<th>Register Data</th>
											<th>Note</th>
										</tr>
									</tfoot>
									<tbody>
										<%
										for (int i = 0; i < count; i++) {
											ProductDto product = productlist.get(i);
										%>
										<tr>
											<td><%=product.getProdnum()%></td>
											<td><%=product.getName()%></td>
											<td><%=product.getCompany()%></td>
											<td><%=product.getKind()%></td>
											<td><%=dFormat.format(Integer.parseInt(product.getPrice1()))%></td>
											<td><%=product.getRegdate()%></td>
											<td><button class="btn btn-primary"
													onclick="removeCheck(<%=product.getProdnum()%>)">제거</button>


												<button class="btn btn-secondary"
													onclick="location='product_update.jsp?prodnum=<%=product.getProdnum()%>'">수정</button></td>
										</tr>
										<%
										}
										%>


									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>