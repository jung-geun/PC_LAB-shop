<%@page import="project.UserDataBean"%>
<%@page import="project.UserDBBean"%>
<%@page import="project.ProductDao"%>
<%@page import="project.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="project.CartDto"%>
<%@page import="project.CartDao"%>
<%@page import="project.OrderDto"%>
<%@page import="project.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String source_phone = request.getParameter("source_phone");
String des_name = request.getParameter("des_name");
String des_address = request.getParameter("des_address");
String dec_phone = request.getParameter("dec_phone");
String dec_requests = request.getParameter("dec_requests");
String useremail = (String) session.getAttribute("useremail");

UserDBBean userdao = UserDBBean.getInstance();
UserDataBean user = userdao.getMember(useremail);

OrderDao orderdao = OrderDao.getInstance();
OrderDto order = new OrderDto();
CartDao cartdao = CartDao.getInstance();
ProductDao productdao = ProductDao.getInstance();

int cartcount = cartdao.getCartsCount(useremail);
List<CartDto> cartlist = cartdao.getCarts(useremail);
int result = 0;
int total = 0;
for (int i = 0; i < cartcount; i++) {
	CartDto cart = cartlist.get(i);
	order.setEmail(useremail);
	order.setOrdernum(cart.getProdnum());
	ProductDto product = productdao.getProduct(cart.getProdnum());
	int price = Integer.parseInt(product.getPrice1());

	order.setPrice("" + price * cart.getQuantity());
	result += orderdao.insertOrder(order);
	total += price * cart.getQuantity();
}
if (result == cartcount) {
%>
<script type="text/javascript">
	alert("주문되었습니다");
</script>
<%
cartdao.removeAll(useremail);
userdao.Consumption(useremail, total);
response.sendRedirect("mypage.jsp");
} else {
%>
<script type="text/javascript">
	alert("주문에 실패했습니다"");
	history.back();
</script>
<%
}
%>