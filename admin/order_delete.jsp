<%@page import="project.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int ordernum = Integer.parseInt(request.getParameter("ordernum"));
%>
<script type="text/javascript">
	var select = confirm("제거 하시겠습니까?");
	if (select == true) {
<%OrderDao dao = OrderDao.getInstance();
int result = dao.deleteOrder(ordernum);
if (result == 1) {%>
	alert("제거 완료");
<%response.sendRedirect("order.jsp");
} else if (result == 0) {%>
	alert("제거되지 않았습니다");
<%response.sendRedirect("order.jsp");
} else {%>
	alert("연결에 문제가 생겼습니다");
<%response.sendRedirect("order.jsp");
}%>
	} else {
		history.back();
	}
</script>