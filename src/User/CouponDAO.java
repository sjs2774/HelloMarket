package User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CouponDAO {
	
	public CouponDAO() {
		
	}
	
	public List<CouponDTO> showCouponList() {
		List<CouponDTO> coupon = new ArrayList<CouponDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = "SELECT coupon_name,coupon_price,coupon_terms from coupon order by c_idx";
		try {
			conn = Dbconn.getConnection();
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CouponDTO couponDTO = new CouponDTO();
				couponDTO.setCouponName(rs.getString("coupon_name"));
				couponDTO.setCouponPrice(rs.getInt("coupon_price"));
				couponDTO.setCouponTerms(rs.getString("coupon_terms"));
				
				coupon.add(couponDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return coupon;
	}
}
