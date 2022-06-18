<%@page import="project.CartDao"%>
<%@page import="project.OrderDto"%>
<%@page import="java.util.List"%>
<%@page import="project.OrderDao"%>
<%@page import="project.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String useremail = (String) session.getAttribute("useremail");
OrderDao orderdao = OrderDao.getInstance();
int ordercount = orderdao.getOrderCount_email(useremail);
List<OrderDto> orderlist = orderdao.getOrders_email(useremail);
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
	<jsp:include page="topbar2.jsp"></jsp:include>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">Tables</h1>


		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Member Table</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered display" id="dataTable"
						width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>Name</th>
								<th>Email</th>
								<th>Password</th>
								<!-- 																						<th>Phone</th> -->
								<!-- 																						<th>PostCode</th> -->
								<th>Register Data</th>
								<th>note</th>
							</tr>
						</thead>

						<tfoot>
							<tr>
								<th>Name</th>
								<th>Email</th>
								<th>Password</th>
								<!-- 																						<th>Phone</th> -->
								<!-- 																						<th>PostCode</th> -->
								<th>Register Data</th>
								<th>note</th>
							</tr>
						</tfoot>
						<tbody>
							<%
							for (int i = 0; i < ordercount; i++) {
								OrderDto order = orderlist.get(i);
							%>
							<tr>
								<td><%=order.getOrdernum()%></td>
								<td><%=order.getProdnum()%></td>
								<td><%=order.getPrice()%></td>
								<%-- 																						<td><%=article.get%></td> --%>
								<!-- 																						<td>$320,800</td> -->
								<td><%=order.getOrdertime()%></td>
								<td><button class="btn btn-primary"
										onclick="refund(<%=order.getOrdernum()%>)">환불 요청</button>
									<button class="btn btn-secondary"
										onclick="location='cartadd.jsp?item=<%=order.getProdnum()%>'">수정</button></td>
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


	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>