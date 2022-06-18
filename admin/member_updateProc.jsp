<%@page import="project.UserDBBean"%>
<%@page import="project.UserDataBean"%>
<%@page import="project.ProductDto"%>
<%@page import="project.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String email = (request.getParameter("email"));
String email_be =request.getParameter("email_be"); 
String name = request.getParameter("name");
int cash = Integer.parseInt(request.getParameter("cash"));
String password = request.getParameter("password");

UserDBBean dao = UserDBBean.getInstance();
UserDataBean user = new UserDataBean();
user.setEmail(email);
user.setName(name);
user.setCash(cash);
user.setPasswd(password);

int result = dao.updateMember(user, email_be);
if (result == 1) {
	response.sendRedirect("member.jsp");
} else if (result == 0) {
%>
<script type="text/javascript">
	alert("변경이 되지 않았습니다");
	history.back();
</script>
<%
} else {
%>
<script type="text/javascript">
	alert("정보 저장에 문제가 있습니다");
	history.back();
</script>
<%
}
%>