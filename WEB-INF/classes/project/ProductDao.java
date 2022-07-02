package project;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProductDao {
	private static ProductDao instance = new ProductDao();

	public static ProductDao getInstance() {
		return instance;
	}

	private ProductDao() {
	}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/pc_lab");
		return ds.getConnection();
	}

	public int insertProduct(ProductDto product) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";
		int result = 0;
		try {
			conn = getConnection();

			sql = "INSERT INTO product(name,kind,company,price1,content)";
			sql += " values (?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getName());
			pstmt.setString(2, product.getKind());
			pstmt.setString(3, product.getCompany());
			pstmt.setString(4, product.getPrice1());
			pstmt.setString(5, product.getContent());

			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception[insetProduct] : " + e.getMessage());
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

	public List<ProductDto> getProducts() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDto> productList = null;
		String sql = "";

		try {
			conn = getConnection();
			sql = "select * from product order by viewnum desc";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				productList = new ArrayList<ProductDto>();
				do {
					ProductDto product = new ProductDto();

					product.setProdnum(rs.getInt("prodnum"));
					product.setName(rs.getString("name"));
					product.setKind(rs.getString("kind"));
					product.setCompany(rs.getString("company"));
					product.setPrice1(rs.getString("price1"));
					product.setPrice2(rs.getString("price2"));
					product.setPrice3(rs.getString("price3"));
					product.setContent(rs.getString("content"));
					product.setImage(rs.getString("image"));
					product.setUseyn(rs.getString("useyn"));
					product.setRegdate(rs.getTimestamp("regdate"));
					product.setViewnum(rs.getInt("viewnum"));
					product.setQuantity(rs.getInt("Quantity"));
					productList.add(product);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.print("Exception[getArticles] : " + e.getMessage());
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

	public List<ProductDto> getProducts_kind(String kind) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDto> productList = null;
		String sql = "";

		try {
			conn = getConnection();
			sql = "select * from product where kind=? order by viewnum desc";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, kind);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				productList = new ArrayList<ProductDto>();
				do {
					ProductDto product = new ProductDto();

					product.setProdnum(rs.getInt("prodnum"));
					product.setName(rs.getString("name"));
					product.setKind(rs.getString("kind"));
					product.setCompany(rs.getString("company"));
					product.setPrice1(rs.getString("price1"));
					product.setPrice2(rs.getString("price2"));
					product.setPrice3(rs.getString("price3"));
					product.setContent(rs.getString("content"));
					product.setImage(rs.getString("image"));
					product.setUseyn(rs.getString("useyn"));
					product.setRegdate(rs.getTimestamp("regdate"));
					product.setViewnum(rs.getInt("viewnum"));
					product.setQuantity(rs.getInt("Quantity"));
					productList.add(product);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.print("Exception[getArticles] : " + e.getMessage());
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

	public List<ProductDto> getProducts_name(String name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDto> productList = null;
		String sql = "";

		try {
			conn = getConnection();
			sql = "select * from product where name=? order by viewnum desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				productList = new ArrayList<ProductDto>();
				do {
					ProductDto product = new ProductDto();

					product.setProdnum(rs.getInt("prodnum"));
					product.setName(rs.getString("name"));
					product.setKind(rs.getString("kind"));
					product.setCompany(rs.getString("company"));
					product.setPrice1(rs.getString("price1"));
					product.setPrice2(rs.getString("price2"));
					product.setPrice3(rs.getString("price3"));
					product.setContent(rs.getString("content"));
					product.setImage(rs.getString("image"));
					product.setUseyn(rs.getString("useyn"));
					product.setRegdate(rs.getTimestamp("regdate"));
					product.setViewnum(rs.getInt("viewnum"));
					product.setQuantity(rs.getInt("Quantity"));
					productList.add(product);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.print("Exception[getArticles] : " + e.getMessage());
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

	public int getProductCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from product");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.print("Exception[getArticlesCount] : " + e.getMessage());
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

	public int getProductCount_kind(String kind) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from product where kind=?");
			pstmt.setString(1, kind);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.print("Exception[getArticlesCount] : " + e.getMessage());
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

	public int getProductCount_name(String name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from product where name=?");

			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.print("Exception[getArticlesCount] : " + e.getMessage());
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

	public ProductDto getProduct(int productnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDto article = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from product where prodnum=?");
			pstmt.setInt(1, productnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new ProductDto();
				article.setProdnum(rs.getInt("prodnum"));
				article.setName(rs.getString("name"));
				article.setKind(rs.getString("kind"));
				article.setCompany(rs.getString("company"));
				article.setPrice1(rs.getString("price1"));
				article.setPrice2(rs.getString("price2"));
				article.setPrice3(rs.getString("price3"));
				article.setContent(rs.getString("content"));
				article.setImage(rs.getString("image"));
				article.setUseyn(rs.getString("useyn"));
				article.setRegdate(rs.getTimestamp("regdate"));
				article.setViewnum(rs.getInt("viewnum"));
				article.setQuantity(rs.getInt("Quantity"));

			}
		} catch (Exception e) {
			System.out.print("Exception[getMember] : " + e.getMessage());
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

	public int updateProduct(ProductDto product) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = getConnection();
			String sql = "UPDATE product SET name=?,kind=?,company=?,price1=?,content=? where prodnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getName());
			pstmt.setString(2, product.getKind());
			pstmt.setString(3, product.getCompany());
			pstmt.setString(4, product.getPrice1());
			pstmt.setString(5, product.getContent());
			pstmt.setInt(6, product.getProdnum());
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

	public int deleteProduct(int prodnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("delete from product where prodnum=?");
			pstmt.setInt(1, prodnum);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("Exception[deleteProduct] : " + e.getMessage());
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

	public void updateViewnum(int viewnum, int prodnum) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update product set viewnum=? where prodnum=?");
			pstmt.setInt(1, viewnum);
			pstmt.setInt(2, prodnum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("Exception[updateViewnum] : " + e.getMessage());
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
	}

	public List<ProductDto> searchItem(String keyword) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDto> productlist = new ArrayList<ProductDto>();
		String sql = "";
		int count = 0;
		try {

			sql = "SELECT * FROM product WHERE CONVERT(name USING utf8) LIKE '%" + keyword + "%' ";
			sql += "OR CONVERT(kind USING utf8) LIKE '%" + keyword + "%' ";
			sql += "OR CONVERT(company USING utf8) LIKE '%" + keyword + "%' ";
			sql += "OR CONVERT(content USING utf8) LIKE '%" + keyword + "%' ";
			sql += "ORDER BY viewnum DESC";

			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductDto product = new ProductDto();
				count++;
				product.setProdnum(rs.getInt("prodnum"));
				product.setName(rs.getString("name"));
				product.setKind(rs.getString("kind"));
				product.setCompany(rs.getString("company"));
				product.setPrice1(rs.getString("price1"));
				product.setContent(rs.getString("content"));
				product.setViewnum(rs.getInt("viewnum"));
				productlist.add(product);
			}
			System.out.println("count > " + count);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("Exception[searchItem] : " + e.getMessage());
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
		return productlist;
	}

	public int searchItemCount(String keyword) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;
		try {

			sql = "SELECT count(*) FROM product WHERE CONVERT(name USING utf8) LIKE '%" + keyword + "%' ";
			sql += "OR CONVERT(kind USING utf8) LIKE '%" + keyword + "%' ";
			sql += "OR CONVERT(company USING utf8) LIKE '%" + keyword + "%' ";
			sql += "OR CONVERT(content USING utf8) LIKE '%" + keyword + "%' ";

			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
				System.out.println("count > " + count);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("Exception[searchItemCount] : " + e.getMessage());
			count = -1;
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

}