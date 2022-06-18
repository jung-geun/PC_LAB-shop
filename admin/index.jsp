<%@page import="project.OrderDao"%>
<%@page import="project.QnADao"%>
<%@page import="project.ProductDao"%>
<%@page import="project.ProductDto"%>
<%@page import="project.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String user_name = (String) session.getAttribute("username");
if (user_name == null) {
	response.sendRedirect("/login.jsp");
} else {
	UserDBBean dao = UserDBBean.getInstance();
	String username = (String) session.getAttribute("username");
	String useremail = (String) session.getAttribute("useremail");
	String userpw = (String) session.getAttribute("userpw");
	int admin_on = dao.getAdmin(useremail, userpw, username);

	if (admin_on == 0) {
		response.sendRedirect("/");
	}
	UserDBBean userdao = UserDBBean.getInstance();
	ProductDao prodao = ProductDao.getInstance();
	OrderDao orderdao = OrderDao.getInstance();
	QnADao qnadao = QnADao.getInstance();
	int user_count = userdao.getMemberCount();
	int product_count = prodao.getProductCount();
	int order_count = orderdao.getOrderCount();
	int qna_count = qnadao.getQnACount();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Main</title>
<link href="css/all.min.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<jsp:include page="head.jsp"></jsp:include>

</head>
<body>
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
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<a href="member.jsp">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-primary text-uppercase mb-1">
													Members :
													<%=user_count%></div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">
													<fmt:formatNumber value="${monthlyEarnings}"
														type="currency" />
												</div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<a href="product.jsp">

								<div class="card border-left-success shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-success text-uppercase mb-1">
													Products :
													<%=product_count%></div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">
													<fmt:formatNumber value="${annualEarnings }"
														type="currency" />
												</div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<a href="order.jsp">

								<div class="card border-left-info shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-info text-uppercase mb-1">
													Order :
													<%=order_count%>
												</div>
												<div class="row no-gutters align-items-center">
													<div class="col-auto">
														<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"></div>
													</div>
													<div class="col"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>

						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<a href="qna.jsp">
								<div class="card border-left-warning shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-warning text-uppercase mb-1">
													Q & A :
													<%=qna_count%></div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">${noReply }</div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
<%
}
%>
