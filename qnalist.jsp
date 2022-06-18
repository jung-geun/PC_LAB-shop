<%@page import="project.QnADto"%>
<%@page import="project.QnADao"%>
<%@page import="project.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="project.ProductDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int startRow = 1;
int pageSize = 10;
int count = 0;
DecimalFormat dFormat = new DecimalFormat("###,###");
QnADao dao = QnADao.getInstance();
count = dao.getQnACount();
List<QnADto> qnalist = null;
qnalist = dao.getQnAs();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<!-- <link rel="stylesheet" href="listcss/css.css"> -->


<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/itemstyles.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
<link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>

	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<!-- Page Wrapper -->
			<div id="wrapper">

				<!-- Content Wrapper -->
				<div id="content-wrapper" class="d-flex flex-column">

					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<h1 class="h3 mb-2 text-gray-800">고객센터</h1>


						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<p>문의 글</p>
								<button class="btn btn-primary" onclick="location='qna_write.jsp'" value="글쓰기">글쓰기</button>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered display" id="dataTable"
										width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>QnA_Num</th>
												<!-- 										<th>Email</th> -->
												<th>Content</th>

											</tr>
										</thead>

										<tfoot>
											<tr>
												<th>QnA_Num</th>
												<!-- 										<th>Email</th> -->
												<th>Content</th>

											</tr>
										</tfoot>
										<tbody>
											<%
											for (int i = 0; i < count; i++) {
												QnADto qna = qnalist.get(i);
											%>
											<tr>
												<td><%=qna.getNum()%></td>
												<%-- 										<td><%=qna.getEmail()%></td> --%>
												<td><%=qna.getContent()%></td>

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
	</section>
	<jsp:include page="footer.jsp"></jsp:include>

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
