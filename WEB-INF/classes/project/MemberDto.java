package project;

public class MemberDto {

	private String email;
	private String name;

	// 중앙 번호(시작인덱스,마지막인덱스)
	private String phone_front;
	// 끝 번호
	private String phone_end;

	private String postCoed;// 우편번호
	private String addr; // 주소
	private String addr_Detail; // 상세주소

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone_front() {
		return phone_front;
	}

	public void setPhone_front(String phone_front) {
		this.phone_front = phone_front;
	}

	public String getPhone_end() {
		return phone_end;
	}

	public void setPhone_end(String phone_end) {
		this.phone_end = phone_end;
	}

	public String getPostCoed() {
		return postCoed;
	}

	public void setPostCoed(String postCoed) {
		this.postCoed = postCoed;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddr_Detail() {
		return addr_Detail;
	}

	public void setAddr_Detail(String addr_Detail) {
		this.addr_Detail = addr_Detail;
	}

}
