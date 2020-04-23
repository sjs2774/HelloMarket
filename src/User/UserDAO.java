package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.websocket.Session;

public class UserDAO {

	public UserDAO() {
		
	}
	
	public int login(String user_email,String user_pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT user_email FROM userlist WHERE user_pwd=MD5(?)";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
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
	
	public String selectUserNick(String user_email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String userNick;
		String sql = "SELECT user_nick FROM userlist WHERE user_email=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userNick = rs.getString(1);
				return userNick;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "no";
	}
		
	public int join(UserDTO user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserDAO setUser_nick = new UserDAO();
		String sql = "INSERT INTO userlist(user_email,user_pwd) values(?,MD5(?))";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPass());
			pstmt.executeUpdate();
			setUser_nick.set_userNick(user);
			return 0;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}

	public void set_userNick(UserDTO user) {
		int user_idx = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user_nick = "";
		String sql = "select user_idx from userlist where user_email=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				user_idx = rs.getInt(1);
				user_nick = "n"+100000+user_idx;
				user.setUserNick(user_nick);
				user.setUserIdx(user_idx);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		sql ="update userlist set user_nick=? where user_idx=?";
		try {
			conn= Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserNick());
			pstmt.setInt(2, user.getUserIdx());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
