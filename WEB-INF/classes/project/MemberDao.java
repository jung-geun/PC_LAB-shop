package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	private static MemberDao instance = new MemberDao();

	public static MemberDao getInstance() {
		return instance;
	}

	private MemberDao() {
	}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/hoseo_jsp");
		return ds.getConnection();
	}

	public MemberDto updateView(String user_email) {
		MemberDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select * from member where email=?");
			conn = getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, user_email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String email = rs.getString("email");
				String name = rs.getString("name");

				// 전체 전화번호
				String allphone = rs.getString("phone");
				// 중앙 번호(시작인덱스,마지막인덱스)
				String phone_front = allphone.substring(4, 8);
				// 끝 번호
				String phone_end = allphone.substring(9, 13);

				// 전체 주소
				String alladdr = rs.getString("addr");
				// 전체 주소에서 기준이될 특정 부호의 인덱스를 구함
				int idx1 = alladdr.indexOf(")");
				int idx2 = alladdr.indexOf(",");
				// 특정부호 기준으로 시작인덱스,기준인덱스 까지 들고오기
				String postCoed = alladdr.substring(1, idx1); // 우편번호
				String addr = alladdr.substring(7, idx2); // 주소
				// 특정부호 뒤부분 내용들고오기
				String arrd_Detail = alladdr.substring(idx2 + 1); // 상세주소

				dto = new MemberDto();
				dto.setEmail(email);
				dto.setName(name);
				dto.setPhone_front(phone_front);
				dto.setPhone_end(phone_end);
				dto.setPostCoed(postCoed);
				dto.setAddr(addr);
				dto.setAddr_Detail(arrd_Detail);

			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception [updateView] > " + e.getMessage());// TODO: handle exception
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
				}
			}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e) {
				}
		}

		return dto;

	}

	public int getMemberCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from member");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.print("Exception[getArticlesCount] :" + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}

			if (conn != null)
				try {
					conn.close();
				} catch (Exception e) {
				}
		}
		return count;
	}

	public MemberDto deleteMember(String email, String name, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto dto = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from member where email=? and name=? and password=? ");
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			pstmt.setString(3, password);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception[deleteMember] :" + e.getMessage());
		}

		return null;
	}

}
