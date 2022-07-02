package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class QnADao {
	private static QnADao instance = new QnADao();

	public static QnADao getInstance() {
		return instance;
	}

	private QnADao() {
	}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/pc_lab");
		return ds.getConnection();
	}

	public int insertQnA(QnADto qna) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";
		int result = 0;
		try {
			conn = getConnection();

			sql = "INSERT INTO qna_list(email,pass,content,onlock,title)";
			sql += " values (?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qna.getEmail());
			pstmt.setString(2, qna.getPass());
			pstmt.setString(3, qna.getContent());
			pstmt.setInt(4, qna.getOnlock());
			pstmt.setString(5, qna.getTitle());

			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception[insertQnA] : " + e.getMessage());
			result = -1;
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
		return result;
	}

	public List<QnADto> getQnAs() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<QnADto> qnaList = null;
		String sql = "";

		try {
			conn = getConnection();
			sql = "select * from qna_list";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				qnaList = new ArrayList<QnADto>();
				do {
					QnADto qna = new QnADto();

					qna.setEmail(rs.getString("email"));
					qna.setPass(rs.getString("pass"));
					qna.setNum(rs.getInt("num"));
					qna.setContent(rs.getString("content"));
					qna.setOnlock(rs.getInt("onlock"));
					qna.setTitle(rs.getString("title"));

					qnaList.add(qna);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.print("Exception[getQnAs] : " + e.getMessage());
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
		return qnaList;
	}

	public int getQnACount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from qna_list");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.print("Exception[getQnACount] : " + e.getMessage());
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

	public int getQnACount(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from qna_list where email=?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.print("Exception[getQnACount] : " + e.getMessage());
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

	public QnADto getQnA(String email, int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QnADto qna = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from qna_list where email=? and num=?");
			pstmt.setString(1, email);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				qna = new QnADto();
				qna.setEmail(rs.getString("email"));
				qna.setPass(rs.getString("pass"));
				qna.setNum(rs.getInt("num"));
				qna.setContent(rs.getString("content"));
				qna.setOnlock(rs.getInt("onlock"));
				qna.setTitle(rs.getString("title"));

			}
		} catch (Exception e) {
			System.out.print("Exception[getQnA] : " + e.getMessage());
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
		return qna;
	}

	public int updateQnA(QnADto qna) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = getConnection();
			String sql = "UPDATE qna_list SET pass=?,content=?,onlock=?,title=? where email=? and num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qna.getPass());
			pstmt.setString(2, qna.getContent());
			pstmt.setInt(3, qna.getOnlock());
			pstmt.setString(4, qna.getTitle());
			pstmt.setString(5, qna.getEmail());
			pstmt.setInt(6, qna.getNum());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("Exception[updateProduct] : " + e.getMessage());
			result = -1;
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
		return result;
	}

	public int deleteQnA(String email, int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("delete from qna_list where email=? and num=?");
			pstmt.setString(1, email);
			pstmt.setInt(2, num);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("Exception[deleteQnA] : " + e.getMessage());
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
		return result;
	}

}
