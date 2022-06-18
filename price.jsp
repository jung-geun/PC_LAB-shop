<%@page import="project.UserDataBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="project.ProductDto"%>
<%@page import="project.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="project.CartDto"%>
<%@page import="project.CartDao"%>
<%@page import="project.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String username = (String) session.getAttribute("username");
String useremail = (String) session.getAttribute("useremail");
String userpw = (String) session.getAttribute("userpw");
if (useremail == null) {
	response.sendRedirect("login.jsp");
}
%>
<%
CartDao cartdao = CartDao.getInstance();
int cartcount = cartdao.getCartsCount(useremail);
DecimalFormat dFormat = new DecimalFormat("###,###");
UserDBBean userdb = UserDBBean.getInstance();
UserDataBean user = userdb.getMember(useremail);
int total = 0;
if (cartcount < 1) {
%>
<script type="text/javascript">
	alert("주문할 상품이 없습니다!");
	history.back();
</script>
<%
} else {
List<CartDto> cartlist = cartdao.getCarts(useremail);
ProductDao dao = ProductDao.getInstance();
int hascash = user.getCash();
for (int i = 0; i < cartcount; i++) {
	CartDto cart = cartlist.get(i);
	int prodnum = cart.getProdnum();
	ProductDto product = dao.getProduct(prodnum);

	String price1 = product.getPrice1();
	int price = Integer.parseInt(price1);
	int sum = 0;
	sum += price * cart.getQuantity();
	total += sum;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PC LAB</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/price.css">


<script type="text/javascript">
	function check() {
		var price_write = document.price_write;
		const source_phone = price_write.source_phone.value;

		const des_name = price_write.des_name.value;
		const des_phone = price_write.des_phone.value;
		const des_address = price_write.des_address.value;
		const dec_requests = price_write.dec_requests.value;

		if (source_phone == "") {
			alert("출발지 전화번호를 입력해주세요.");
			price_write.source_phone.focus();
			return false;
		} else if (des_name == "") {
			alert("수령인 이름을 입력해주세요.");
			price_write.des_name.focus();
			return false;
		} else if (des_phone == "") {
			alert("수령인 전화번호를 입력해주세요.");
			price_write.des_phone.focus();
			return false;
		} else if (des_address == "") {
			alert("수령인 주소를 입력해주세요.");
			price_write.des_address.focus();
			return false;
		} else if (dec_requests == "") {
			alert("요청사항을 입력해주세요.");
			price_write.dec_requests.focus();
			return false;
		}

		return true;
	}
</script>

</head>
<body>
	<jsp:include page="topbar.jsp"></jsp:include>
	<div class="container-fluid" style="border-bottom: 2px solid #e1e1e1;">
		<div class="container">
			<form action="priceProc.jsp" method="post" name="price_write"
				onsubmit="return check()">

				<div class="container" style="margin-top: 20px;">
					<div style="border-bottom: 4px solid #e1e1e1;">
						<h2>주문 결제</h2>
					</div>
					<div class="a11">구매자 정보</div>

					<table>
						<tr class="a33-1">
							<td class="a22">이름</td>
							<td class="a44"><%=username%></td>
						</tr>
						<tr class="a33">
							<td class="a22">이메일</td>
							<td class="a44"><%=useremail%></td>
						</tr>
						<tr class="a33">
							<td class="a22">휴대폰 번호</td>
							<td class="a44"><input type="textfield"
								placeholder="전화번호를 입력해주세요!" class="tf1" name="source_phone"></td>
						</tr>
					</table>


					<div class="a11">받는사람정보</div>

					<table>
						<tr class="a33-1">
							<td class="a22">이름</td>
							<td class="a44"><input type="textfield" name="des_name"
								placeholder="이름을 입력해주세요!" class="tf1"></td>
						</tr>
						<tr class="a33">
							<td class="a22">배송주소</td>
							<td class="a44"><input type="textfield" name="des_address"
								placeholder="주소를 입력해주세요!" class="tf1"></td>
						</tr>
						<tr class="a33">
							<td class="a22">연락처</td>
							<td class="a44"><input type="textfield" name="dec_phone"
								placeholder="연락처를 입력해주세요!" class="tf1"></td>
						</tr>
						<tr class="a33">
							<td class="a22">배송 요청사항</td>
							<td class="a44"><input type="textfield" name="dec_requests"
								placeholder="요청사항을 입력해주세요!" class="tf1"></td>
						</tr>
					</table>

					<div class="a11">배송 물품</div>

					<table>
						<%
						for (int i = 0; i < cartcount; i++) {
							CartDto cart = cartlist.get(i);
							ProductDto product = dao.getProduct(cart.getProdnum());
							String price = dFormat.format(Integer.parseInt(product.getPrice1()));
						%>
						<tr class="a33-1">
							<td class="a44-1"><a
								href="itempage.jsp?item=<%=product.getProdnum()%>"
								style="text-decoration-line: none;"> <%=product.getName()%>
							</a></td>
							<td class="a44-1"><%=price%>원</td>
							<td class="a44-1"><%=cart.getQuantity()%>개</td>
						</tr>
						<%
						}
						%>
					</table>

					<div class="a11">결제정보</div>

					<table>
						<tr class="a33-1">
							<td class="a22">총 상품가격</td>
							<td class="a44"><%=dFormat.format(total)%> 원</td>
						</tr>
						<tr class="a33">
							<td class="a22">배송비</td>
							<td class="a44">무료 배송</td>
						</tr>
						<tr class="a33">
							<td class="a22">보유캐시</td>
							<td class="a44"><%=dFormat.format(hascash)%> 원</td>
						</tr>
						<tr class="a33">
							<td class="a22">총 결제금액</td>
							<td class="a44"><%=dFormat.format(total)%> 원</td>
						</tr>
						<tr class="a33">
							<td class="a22">결제 방법</td>
							<td class="a44"><label> <input type="radio"
									value="Cash" name="pay" checked>캐시
							</label> <label> <input type="radio" value="Bank_Transfer"
									name="pay">무통장입급(가상계좌)
							</label></td>
						</tr>
					</table>

					<input type="submit" value="결제하기" class="submitb">
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%
}
%>