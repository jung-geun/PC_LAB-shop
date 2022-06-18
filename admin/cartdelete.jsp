<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%

String id =request.getParameter("cartId");
if(id==null || id.trim().equals("")){
	response.sendRedirect("cart.jsp");
	return;
}
// 장바구니에 등록된 모든 상품을 삭제
session.invalidate();

// cart.jsp로 되돌아가기
response.sendRedirect("cart.jsp");

%>