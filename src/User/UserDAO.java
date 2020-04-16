package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
		try {
			conn = Dbconn.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String user_email,String user_pwd) {
		String sql = "SELECT user_email FROM userlist WHERE user_pwd=MD5(?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println(rs.getString(1));
				if(rs.getString(1).equals(user_email)) {
					return 1;
				}	
			}
			else return 0;
			return -1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
		
	public int join(UserDTO user) {
		String sql = "INSERT INTO userlist(user_email,user_pwd) values(?,MD5(?))";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPass());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}
