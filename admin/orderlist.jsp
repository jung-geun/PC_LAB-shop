<%@page import="project.OrderDto"%>
<%@page import="java.util.List"%>
<%@page import="project.OrderDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
int count = 0;
DecimalFormat dFormat = new DecimalFormat("###,###");
OrderDao dao = OrderDao.getInstance();
count = dao.getOrderCount();
List<OrderDto> orderlist = null;
orderlist = dao.getOrders();
%>
<!DOCTYPE html>
<html>
<head>
<title>order</title>
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


					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Order Table</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered display" id="dataTable"
									width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>order num</th>
											<th>prod num</th>
											<th>email</th>
											<th>ordertime</th>
											<th>Price</th>
											<th>비고</th>
										</tr>
									</thead>

									<tfoot>
										<tr>
											<th>order num</th>
											<th>prod num</th>
											<th>email</th>
											<th>ordertime</th>
											<th>Price</th>
											<th>비고</th>
										</tr>
									</tfoot>
									<tbody>
										<%
										for (int i = 0; i < count; i++) {
											OrderDto order = orderlist.get(i);
										%>
										<tr>
											<td><%=order.getOrdernum()%></td>
											<td><%=order.getProdnum()%></td>
											<td><%=order.getEmail()%></td>
											<td><%=order.getOrdertime()%></td>
											<td><%=dFormat.format(Integer.parseInt(order.getPrice()))%></td>

											<td><button class="btn btn-primary"
													onclick="removeOrder(<%=order.getOrdernum()%>)">제거</button>


												<button class="btn btn-secondary"
													onclick="location='product_update.jsp?prodnum=<%=order.getProdnum()%>'">수정</button></td>
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
</html>