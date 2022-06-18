<%@page import="project.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String user_email = request.getParameter("logemail");
String user_pw = request.getParameter("logpass");
try {
	UserDBBean dao = UserDBBean.getInstance();
	boolean login = dao.getLogin(user_email, user_pw);
	if (login == true) {
		String user_name = dao.getName(user_email, user_pw);
		session.setAttribute("username", user_name);
		session.setAttribute("useremail", user_email);
		session.setAttribute("userpw", user_pw);
%>
<script type="text/javascript">
	alert("로그인 되었습니다!");
</script>
<%
response.sendRedirect("index.jsp");
} else {
%>
<script type="text/javascript">
	alert("이메일 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.");
<%session.invalidate();%>
	history.back();
</script>
<%
}
} catch (Exception e) {
%>
<script type="text/javascript">
	alert("로그인에 문제가 생겼습니다 관리자에게 문의하세요");
	history.back();
</script>
<%
}
%>