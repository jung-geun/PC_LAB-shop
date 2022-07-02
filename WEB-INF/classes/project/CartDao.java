package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CartDao {

	private static CartDao instance = new CartDao();

	public static CartDao getInstance() {
		return instance;
	}

	private CartDao() {
	}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/pc_lab");
		return ds.getConnection();
	}

	public int insertCart(CartDto cart) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";
		int result = 0;
		try {
			conn = getConnection();

			sql = "INSERT INTO cart(email,prodnum,Quantity)";
			sql += " values (?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cart.getEmail());
			pstmt.setInt(2, cart.getProdnum());
			pstmt.setInt(3, cart.getQuantity());

			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception[insetCart] : " + e.getMessage());
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

	public List<CartDto> getCarts(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CartDto> cartList = null;
		String sql = "";

		try {
			conn = getConnection();
			sql = "select * from cart where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				cartList = new ArrayList<CartDto>();
				do {
					CartDto cart = new CartDto();
					cart.setEmail(rs.getString("email"));
					cart.setProdnum(rs.getInt("prodnum"));
					cart.setQuantity(rs.getInt("Quantity"));
					cartList.add(cart);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.print("Exception[getCarts] : " + e.getMessage());
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
		return cartList;
	}

	public int getCartsCount(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from cart where email=?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.print("Exception[getCartsCount] : " + e.getMessage());
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

	public CartDto getCart(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CartDto cart = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from cart where email=?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cart = new CartDto();
				cart.setEmail(rs.getString("email"));
				cart.setProdnum(rs.getInt("prodnum"));
				cart.setQuantity(rs.getInt("Quantity"));
			}
		} catch (Exception e) {
			System.out.print("Exception[getCart] : " + e.getMessage());
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
		return cart;
	}

	public int updateCart(CartDto cart) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = getConnection();
			String sql = "UPDATE cart SET Quantity=? where email=? and prodnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart.getQuantity());
			pstmt.setString(2, cart.getEmail());
			pstmt.setInt(3, cart.getProdnum());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("Exception[updateCart] : " + e.getMessage());
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

	public int deleteCart(String email, int prodnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("delete from cart where email=? and prodnum=?");
			pstmt.setString(1, email);
			pstmt.setInt(2, prodnum);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("Exception[deleteCart] : " + e.getMessage());
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

	public int removeAll(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("delete from cart where email=?");
			pstmt.setString(1, email);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("Exception[removeAll] : " + e.getMessage());
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
