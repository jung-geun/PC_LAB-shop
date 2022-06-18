<%@page import="project.UserDataBean"%>
<%@page import="project.UserDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String user_name = request.getParameter("name");
String user_email = request.getParameter("email");
String user_pw = request.getParameter("passwd");
try {
	UserDBBean dao = UserDBBean.getInstance();
	UserDataBean member = new UserDataBean();
	int use = dao.getEmail(user_email);
	if (use == 1) {

		member.setName(user_name);
		member.setEmail(user_email);
		member.setPasswd(user_pw);

		boolean signup = dao.insertMember(member);

		if (signup == true) {
%>
<script type="text/javascript">
	alert("회원가입이 완료되었습니다!");
</script>
<%
response.sendRedirect("index.jsp");
} else {
%>
<script type="text/javascript">
	alert("정보를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.");
	history.back();
</script>
<%
}
} else if (use == 0) {
%>
<script type="text/javascript">
	alert("이메일이 이미 존재합니다");
	history.back();
</script>
<%
}
} catch (Exception e) {
e.printStackTrace();
%>
<script type="text/javascript">
	alert("회원가입에 실패하였습니다.");
	history.back();
</script>
<%
}
%>