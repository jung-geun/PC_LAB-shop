<%@page import="project.CartDto"%>
<%@page import="project.CartDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="project.ProductDto"%>
<%@page import="project.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
// 아이템 아이디 수신
String item = request.getParameter("item");
int item_id = 0;
if (item != null) {
	item_id = Integer.parseInt(item);
}
// 아이템 수량 수신
String count = request.getParameter("count");
int itemcount = 1;
if (count != null) {
	itemcount = Integer.parseInt(count);
}
// 아이디가 없으면
if (item_id == 0) {
%>
<script type="text/javascript">
	alert("상품이 없습니다!");
</script>
<%
// product.jsp로 되돌아간다.
response.sendRedirect("product.jsp");
}

// 상품 저장소 객체 생성
ProductDao dao = ProductDao.getInstance();

// 상품 아이디에 해당하는 정보를 얻어와보자
ProductDto product = dao.getProduct(item_id);

// id의 값이 P9999 이런 경우 상품이 없다.
if (product == null) {
response.sendRedirect("itemlist.jsp");
}

// 모든 상품을 가져와보자
// 요청 파라미터 아이디의 상품이 존재하는지 검사
CartDao cartdao = CartDao.getInstance();
String email = (String) session.getAttribute("useremail");
CartDto cart = new CartDto();

// 상품이 존재할 때
// 요청 파라미터 아이디의 상품을 담은 장바구니를 초기화
// 세션 : cartlist를 얻어와 ArrayList 객체에 저장. object형이라 형변환 필요
int listcount = cartdao.getCartsCount(email);
// out.print("list의 크기: " + list);
// 만약 cartlist라는 세션 정보가 없다면 ArrayList객체를 생성하고 cartlist세션 생성
if (listcount == 0) {

cart.setEmail(email);
cart.setProdnum(product.getProdnum());
cart.setQuantity(itemcount);
// list.add(cart);
// session.setAttribute("cartlist", list);
int result = cartdao.insertCart(cart);
if (result == 1) {
	response.sendRedirect("itemlist.jsp?query=" + product.getCompany());
} else if (result == 0) {
%>
<script type="text/javascript">
	alert("장바구니 추가에 실패했습니다");
	history.back();
</script>
<%
}
}

// list : 장바구니에 담긴 상품 목록
int cnt = 0;

List<CartDto> list = cartdao.getCarts(email);

if (listcount != 0) {
for (int i = 0; i < listcount; i++) {
CartDto cart_once = list.get(i);
// 요청 파라미터 아이디 addCart.jsp?id=P1234의 상품이 장바구니에 이미 담겨있다면 해당 상품의 수량을 1증가
if (cart_once.getProdnum() == item_id) {
	cnt++;
	int orderQuatity = cart_once.getQuantity() + itemcount;
	cart_once.setQuantity(orderQuatity);
	cartdao.updateCart(cart_once);
	response.sendRedirect("itemlist.jsp?query=" + product.getCompany());
}
}

// 요청 파라미터 아이디의 상품이 장바구니에 없다면 해당상품의 수량을 1로 처리
if (cnt == 0) {
CartDto cart_add = new CartDto();
cart_add.setProdnum(item_id);
cart_add.setQuantity(itemcount);
cart_add.setEmail(email);
cartdao.insertCart(cart_add);
response.sendRedirect("itemlist.jsp?query=" + product.getCompany());
}
}
%>
