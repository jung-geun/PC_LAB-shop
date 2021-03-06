<%@page import="project.ProductDto"%>
<%@page import="project.UserDBBean"%>
<%@page import="project.UserDataBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String user_name = (String) session.getAttribute("username");
if (user_name == null) {
	response.sendRedirect("/login.jsp");
} else {

	int count = 0;
	List<UserDataBean> articlelist = null;
	UserDBBean dao = UserDBBean.getInstance();
	count = dao.getMemberCount();
	articlelist = dao.getMembers();
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Member Tables</title>


<jsp:include page="head.jsp"></jsp:include>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<jsp:include page="sidebar.jsp"></jsp:include>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

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
										for (int i = 0; i < count; i++) {
											UserDataBean article = articlelist.get(i);
										%>
										<tr>
											<td><%=article.getName()%></td>
											<td><%=article.getEmail()%></td>
											<td><%=article.getPasswd()%></td>
											<%-- 																						<td><%=article.get%></td> --%>
											<!-- 																						<td>$320,800</td> -->
											<td><%=article.getRegdate()%></td>
											<td><button class="btn btn-primary"
													onclick="removeMember(<%=article.getEmail()%>)">??????</button>
												<button class="btn btn-secondary"
													onclick="location='member_update.jsp?email=<%=article.getEmail()%>'">??????</button></td>
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
			<!-- End of Main Content -->


		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">??</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>

	<script>
		$(document).ready(function() {
			$('#dataTable').DataTable();
		});
	</script>
</body>

</html>
<%
}
%>