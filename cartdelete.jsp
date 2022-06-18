<%@page import="project.CartDao"%>
<%@page import="project.CartDto"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.ProductDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String useremail = (String) session.getAttribute("useremail");
String item = request.getParameter("item");
int item_id = 0;
//item 을 입력 받았을 때
// 정수로 변환
CartDao cartdao = CartDao.getInstance();
if (item != null) {
	item_id = Integer.parseInt(item);
}
// item 을 입력 받지 않았을 때
else if (item == null) {
	// 장바구니에 등록된 모든 상품을 삭제
	cartdao.removeAll(useremail);
	// cart.jsp로 되돌아가기
	response.sendRedirect("cart.jsp");
}
// item 을 입력 받은 후 장바구니 목록 불러오기
int listcount = cartdao.getCartsCount(useremail);
// 장바구니에 상품이 존재할 때
if (listcount != 0) {
	List<CartDto> cartList = cartdao.getCarts(useremail);
	// 	Iterator<CartDto> itr = cartList.iterator();
	for (int i = 0; i < listcount; i++) {
		CartDto cart = cartList.get(i);
		if (cart.getProdnum() == item_id) {
			cartdao.deleteCart(useremail, item_id);
		}
	}
	response.sendRedirect("cart.jsp");
}
%>