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
	<jsp:include page="topbar.jsp"></jsp:include>


	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>