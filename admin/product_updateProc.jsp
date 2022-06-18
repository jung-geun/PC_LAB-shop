<%@page import="project.ProductDto"%>
<%@page import="project.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
int prodnum = Integer.parseInt(request.getParameter("prodnum"));
String name = request.getParameter("name");
String company = request.getParameter("company");
String kind = request.getParameter("kind");
String price = request.getParameter("price");
String description = request.getParameter("description");

ProductDao dao = ProductDao.getInstance();
ProductDto product = new ProductDto();
product.setProdnum(prodnum);
product.setName(name);
product.setCompany(company);
product.setKind(kind);
product.setPrice1(price);
product.setContent(description);

int result = dao.updateProduct(product);
if (result == 1) {
	response.sendRedirect("product.jsp");
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