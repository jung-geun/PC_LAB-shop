<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String useremail = (String) session.getAttribute("useremail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가</title>
<style>
/* The switch - the box around the slider */
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
	vertical-align: middle;
}

/* Hide default HTML checkbox */
.switch input {
	display: none;
}

/* The slider */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

p {
	margin: 0px;
	display: inline-block;
	font-size: 15px;
	font-weight: bold;
}
</style>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>

<jsp:include page="head.jsp"></jsp:include>
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
								<p>글쓰기</p>

							</div>
							<form action="qna_writeProc.jsp" method="post">
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered display" id="dataTable"
											width="100%" cellspacing="0">

											<div class="title">
												<dl>
													<dt>제목</dt>
													<dd>
														<input type="text" placeholder="제목 입력" name="title">
													</dd>
												</dl>
											</div>
											<div class="info">
												<dl>
													<dt>글쓴이</dt>
													<dd>
														<%=useremail%>
													</dd>
												</dl>
												<dl>
													<dt>비밀번호</dt>
													<dd>
														<input type="password" placeholder="비밀번호 입력" name="pass">
													</dd>
												</dl>
											</div>
											<label class="switch"> <input type="checkbox"
												name="onlock" value="1"> <span class="slider round"></span>
											</label>
											<p>해제</p>
											<p style="display: none;">잠금</p>

											<div class="cont">
												<dl>
													<dt>내용 입력</dt>
													<dd>
														<textarea rows="5" cols="50" placeholder="내용 입력"
															name="content" rows="20" cols="30" style="resize: none;"></textarea>
													</dd>

												</dl>
											</div>
											<button class="btn btn-primary" type="submit">전송</button>
										</table>
									</div>
								</div>
							</form>
						</div>

					</div>
					<!-- /.container-fluid -->

				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>

	<script type="text/javascript">
		var check = $("input[type='checkbox']");
		check.click(function() {
			$("p").toggle();
		});
	</script>

</body>
</html>