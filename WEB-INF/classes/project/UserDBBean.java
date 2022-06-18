package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDBBean {
	private static UserDBBean instance = new UserDBBean();

	public static UserDBBean getInstance() {
		return instance;
	}

	private UserDBBean() {
	}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/hoseo_jsp");
		return ds.getConnection();
	}

	public boolean insertMember(UserDataBean article) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";
		boolean query = false;
		try {
			conn = getConnection();
			sql = "insert into member(email,password,name)";
			sql += " values (?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getEmail());
			pstmt.setString(2, article.getPasswd());
			pstmt.setString(3, article.getName());
			// pstmt.setTimestamp(4, article.getRegdate());

			int result = pstmt.executeUpdate();
			if (result == 1) {
				query = true;
			} else if (result == 0) {
				query = false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception[insetMember] : " + e.getMessage());
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
		return query;

	}

	public List<UserDataBean> getMembers() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<UserDataBean> articleList = null;
		String sql = "";
		try {
			conn = getConnection();
			sql = "select * from member order by name asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				articleList = new ArrayList<UserDataBean>();
				do {
					UserDataBean article = new UserDataBean();

					article.setName(rs.getString("name"));
					article.setEmail(rs.getString("email"));
					article.setPasswd(rs.getString("password"));
					article.setRegdate(rs.getTimestamp("reg_date"));

					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.print("Exception[getArticles] :" + e.getMessage());
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
		return articleList;
	}

	public List<UserDataBean> getMembers(int start, int end) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<UserDataBean> articleList = null;
		String sql = "";
		try {
			conn = getConnection();
			sql = "select * from member order by name desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start - 1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				articleList = new ArrayList<UserDataBean>();
				do {
					UserDataBean article = new UserDataBean();

					article.setName(rs.getString("name"));
					article.setEmail(rs.getString("email"));
					article.setPasswd(rs.getString("password"));
					article.setRegdate(rs.getTimestamp("reg_date"));

					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.print("Exception[getArticles] :" + e.getMessage());
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
		return articleList;
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

	public UserDataBean getMember(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserDataBean article = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from member where email=?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new UserDataBean();
				article.setEmail(rs.getString("email"));
				article.setPasswd(rs.getString("password"));
				article.setName(rs.getString("name"));
				article.setRegdate(rs.getTimestamp("reg_date"));
				article.setCash(rs.getInt("cash"));
			}
		} catch (Exception e) {
			System.out.print("Exception[getMember] :" + e.getMessage());
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
		return article;
	}

	public boolean getLogin(String user_email, String user_pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		boolean resualt = false;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select email,name from member where email=? and password=? ");
			pstmt.setString(1, user_email);
			pstmt.setString(2, user_pw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resualt = true;
			} else {
				resualt = false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("Exception[getLogin] :" + e.getMessage());
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
		return resualt;
	}

	public String getName(String user_email, String user_pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		boolean resualt = false;
		String name = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select name from member where email=? and password=? ");
			pstmt.setString(1, user_email);
			pstmt.setString(2, user_pw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				name = rs.getString(1);
			} else {
				resualt = false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("Exception[getName] :" + e.getMessage());
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
		return name;
	}

	public int getEmail(String user_email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int resualt = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from member where email=?");
			pstmt.setString(1, user_email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resualt = 0;
			} else {
				resualt = 1;
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("Exception[getName] :" + e.getMessage());
			resualt = 2;
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
		return resualt;
	}

	public int getAdmin(String user_email, String user_pw, String user_name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int resualt = 0;
		String email = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select email,password,name from member where email=? and password=? ");
			pstmt.setString(1, user_email);
			pstmt.setString(2, user_pw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				email = rs.getString(1);

				pstmt = conn.prepareStatement("select admin_email,admin_on from admin where admin_email=?");
				pstmt.setString(1, email);

				rs = pstmt.executeQuery();
				if (rs.next()) {
					resualt = rs.getInt(2);
					System.out.println(resualt);
				}
			} else {
				resualt = 0;
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("Exception[getAdmin] :" + e.getMessage());
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
		return resualt;
	}

	public int updateMember(UserDataBean user, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = getConnection();
			String sql = "UPDATE member SET email=?,password=?,name=?,cash=? where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getEmail());
			pstmt.setString(2, user.getPasswd());
			pstmt.setString(3, user.getName());
			pstmt.setInt(4, user.getCash());
			pstmt.setString(5, email);
			System.out.print("되냐");
			System.out.println(email);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("Exception[updateMember] : " + e.getMessage());
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

	public int Consumption(String email, int price) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = getConnection();
			String sql = "select cash from member where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int hascash = rs.getInt("cash");
				hascash -= price;
				sql = "UPDATE member SET cash=? where email=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, hascash);
				pstmt.setString(2, email);
				result = pstmt.executeUpdate();
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("Exception[Consumption] : " + e.getMessage());
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

}