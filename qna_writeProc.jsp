
<%@page import="project.UserDataBean"%>
<%@page import="project.UserDBBean"%>
<%@page import="project.QnADto"%>
<%@page import="project.QnADao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String useremail = (String) session.getAttribute("useremail");

String title = request.getParameter("title");
String pass = request.getParameter("pass");
String content = request.getParameter("content");
String onclock__ = request.getParameter("onlock");
int onlock = 0;
if (onclock__ != null) {
	onlock = Integer.parseInt(onclock__);
}
try {
	QnADao dao = QnADao.getInstance();
	QnADto qna = new QnADto();
	qna.setOnlock(0);
	// 	UserDBBean userdao= UserDBBean.getInstance();
	qna.setTitle(title);
	qna.setEmail(useremail);
	qna.setContent(content);
	if (onlock == 1) {
		qna.setOnlock(1);
	}
	qna.setPass(pass);

	int result = dao.insertQnA(qna);
	System.out.print(result);
	if (result == 1) {
%>
<script type="text/javascript">
	alert("문의글이 업로드 되었습니다!");
</script>
<%
response.sendRedirect("qnalist.jsp");
} else {
%>
<script type="text/javascript">
	alert("문의글이 정상적으로 전송되지 못했습니다");
	history.back();
</script>
<%
}
} catch (Exception e) {
System.out.print(e.getMessage());
%><script type="text/javascript">
	alert("문제가 생겼습니다 관리자에게 문의하세요");
	history.back();
</script>
<%
}
%>