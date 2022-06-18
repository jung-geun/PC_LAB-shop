<%@page import="javax.swing.text.PlainDocument"%>
<%@page import="project.ProductDto"%>
<%@page import="project.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String name = request.getParameter("name");
String company = request.getParameter("company");
String kind = request.getParameter("kind");
String price = request.getParameter("price");
String description = request.getParameter("description");

ProductDao dao = ProductDao.getInstance();
ProductDto product = new ProductDto();

price = price.replaceAll(",", "");

product.setName(name);
product.setCompany(company);
product.setKind(kind);
product.setPrice1(price);
product.setContent(description);

int result = dao.insertProduct(product);
if (result == 1) {
	response.sendRedirect("product.jsp");
} else {
%>

<script type="text/javascript">
	alert("정보 저장에 문제가 있습니다");
	history.back();
</script>
<%
}
%>
