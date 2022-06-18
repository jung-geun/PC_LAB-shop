function removeCheck(num) {
	if (confirm("제거 하시겠습니까?")) {
		var str = "product_delete.jsp?prodnum=" + num;
		alert("제거");
		document.location = str;
	} else {
		alert("취소");
	}
}

function removeOrder(ordernum) {
	if (confirm("제거 하시겠습니까?")) {
		var str = "order_delete.jsp?ordernum=" + ordernum;
		alert("제거");
		document.location = str;
	} else {
		alert("취소");
	}
}

function removeMember(email) {
	if (confirm("제거 하시겠습니까?")) {
		var str = "member_delete.jsp?email=" + email;
		alert("제거");
		document.location = str;
	} else {
		alert("취소");
	}
}
