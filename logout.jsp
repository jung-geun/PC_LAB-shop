<%@ page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String username = (String) session.getAttribute("username");
%>
<%
if (username != null) {
%>
<script>
	alert("로그아웃 되었습니다");

	const result = confirm("로그아웃을 하시겠습니까?");
	if (result) {
		alert("로그아웃 되었습니다");
<%System.out.print("로그아웃");
session.invalidate();
response.sendRedirect("index.jsp");%>
	} else {
		history.back();
	}
</script>
<%
} else {
%>
<script type="text/javascript">
	alert("잘못된 경로 접근 입니다!");
<%response.sendRedirect("index.jsp");%>
	
</script>
<%
}
%>