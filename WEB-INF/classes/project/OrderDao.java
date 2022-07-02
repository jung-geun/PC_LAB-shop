package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrderDao {
	private static OrderDao instance = new OrderDao();

	public static OrderDao getInstance() {
		return instance;
	}

	private OrderDao() {
	}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/pc_lab");
		return ds.getConnection();
	}

	public int insertOrder(OrderDto order) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";
		int result = 0;
		try {
			conn = getConnection();

			sql = "INSERT INTO order_list(email,prodnum,price)";
			sql += " values (?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order.getEmail());
			pstmt.setInt(2, order.getOrdernum());
			pstmt.setString(3, order.getPrice());

			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception[insertOrder] : " + e.getMessage());
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

	public List<OrderDto> getOders() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderDto> productList = null;
		String sql = "";

		try {
			conn = getConnection();
			sql = "select * from order_list";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				productList = new ArrayList<OrderDto>();
				do {
					OrderDto order = new OrderDto();
					order.setEmail(rs.getString("email"));
					order.setProdnum(rs.getInt("prodnum"));
					order.setPrice(rs.getString("price"));
					order.setOrdertime(rs.getTimestamp("ordertime"));
					order.setOrdernum(rs.getInt("ordernum"));

					productList.add(order);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.print("Exception[getOders] : " + e.getMessage());
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
		return productList;
	}

	public List<OrderDto> getOrders() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderDto> orderList = null;
		String sql = "";

		try {
			conn = getConnection();
			sql = "select * from order_list";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				orderList = new ArrayList<OrderDto>();
				do {
					OrderDto order = new OrderDto();
					order.setEmail(rs.getString("email"));
					order.setProdnum(rs.getInt("prodnum"));
					order.setPrice(rs.getString("price"));
					order.setOrdertime(rs.getTimestamp("ordertime"));
					order.setOrdernum(rs.getInt("ordernum"));

					orderList.add(order);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.print("Exception[getOrders] : " + e.getMessage());
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
		return orderList;
	}

	public List<OrderDto> getOrders_email(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderDto> orderList = null;
		String sql = "";

		try {
			conn = getConnection();
			sql = "select * from order_list where email=? ";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				orderList = new ArrayList<OrderDto>();
				do {
					OrderDto order = new OrderDto();
					order.setEmail(rs.getString("email"));
					order.setProdnum(rs.getInt("prodnum"));
					order.setPrice(rs.getString("price"));
					order.setOrdertime(rs.getTimestamp("ordertime"));
					order.setOrdernum(rs.getInt("ordernum"));

					orderList.add(order);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.print("Exception[getOrders_email] : " + e.getMessage());
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
		return orderList;
	}

	public int getOrderCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from order_list");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.print("Exception[getOderCount] : " + e.getMessage());
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

	public int getOrderCount_email(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from order_list where email=?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.print("Exception[getOrderCount_email] : " + e.getMessage());
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

	public OrderDto getOrder(String email, int productnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrderDto article = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from order_list where email=? and prodnum=?");
			pstmt.setString(1, email);
			pstmt.setInt(2, productnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new OrderDto();
				article.setProdnum(rs.getInt("prodnum"));
				article.setPrice(rs.getString("price"));
				article.setOrdertime(rs.getTimestamp("ordertime"));
				article.setOrdernum(rs.getInt("ordernum"));
				article.setEmail(rs.getString("email"));

			}
		} catch (Exception e) {
			System.out.print("Exception[getOrder] : " + e.getMessage());
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

	public int deleteOrder(int ordernum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("delete from order_list where ordernum=?");
			pstmt.setInt(1, ordernum);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("Exception[deleteOrder] : " + e.getMessage());
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
