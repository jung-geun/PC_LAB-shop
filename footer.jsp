<%@page import="project.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UserDBBean dao = UserDBBean.getInstance();
String username = (String) session.getAttribute("username");
String useremail = (String) session.getAttribute("useremail");
String userpw = (String) session.getAttribute("userpw");
int admin_on = dao.getAdmin(useremail, userpw, username);
%>
<!-- Footer -->
<footer class="py-5 bg-dark" style="margin-top: 50px;">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; PC LAB 2021</p>
		<%
		if (admin_on == 1) {
		%>
		<div class="row">
			<button class="btn btn-outline-secondary "
				onclick="location='admin'">Administrator</button>
		</div>
		<%
		}
		%>

	</div>
	<!-- /.container -->
</footer>