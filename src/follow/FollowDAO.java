package follow;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import User.Dbconn;

public class FollowDAO {
	
	public void following(String myNick,String yourNick) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO follow(follower_nick,following_nick) values(?,?)";
		try {
			conn =Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myNick);
			pstmt.setString(2, yourNick);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close();
			pstmt.close();
			
		}
		
	}
	
	public void cancelFollow(String myNick,String yourNick) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt =null;
		String sql = "DELETE from follow where follower_nick=? AND following_nick=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myNick);
			pstmt.setString(2, yourNick);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close();
			pstmt.close();
			
		}
	}
	
	public int userFollower(String userNick) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		String sql = "SELECT COUNT(follower_nick) FROM follow where following_nick=?";
		try {
			conn = Dbconn.getConnection();
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, userNick);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close();
			pstmt.close();
			rs.close();
			
		}
		return cnt;
	}
	
	public int userFollowing(String userNick) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		String sql = "SELECT COUNT(following_nick) FROM follow where follower_nick=?";
		try {
			conn = Dbconn.getConnection();
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, userNick);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close();
			pstmt.close();
			rs.close();
			
		}
		return cnt;
	}
	
	public List<FollowDTO> userFollowingList(String followerNick) throws SQLException{
		List<FollowDTO> followingList = new ArrayList<FollowDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT following_nick from follow where follower_nick=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, followerNick);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FollowDTO followDTO = new FollowDTO();
				followDTO.setFollowingNick(rs.getString("following_nick"));
				followingList.add(followDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close();
			pstmt.close();
			rs.close();
			
		}
		return followingList;
	}
	
	public List<FollowDTO> userFollowerList(String followingNick) throws SQLException{
		List<FollowDTO> followingList = new ArrayList<FollowDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT follower_nick from follow where following_nick=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, followingNick);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FollowDTO followDTO = new FollowDTO();
				followDTO.setFollowerNick(rs.getString("follower_nick"));
				followingList.add(followDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close();
			pstmt.close();
			rs.close();
			
		}
		return followingList;
	}
	
	public boolean followingCheck(String followingNick,String followerNick) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean check = false;
		String sql = "SELECT following_nick from follow where follower_nick=? AND following_nick=?";
		try {
			conn =Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, followerNick);
			pstmt.setString(2, followingNick);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				check = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close();
			pstmt.close();
			rs.close();
			
		}
		return check;
	}
	
	
}
