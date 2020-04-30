package Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import User.Dbconn;

public class CommentDAO {
	CommentDTO commentDTO = new CommentDTO();
	
	public CommentDAO() {
		
	}
	
	public void insertComment(int pIdx,String userNick,String c_content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "INSERT INTO item_comment(p_idx,user_nick,c_content) VALUES(?,?,?)";
		try {
			conn =Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pIdx);
			pstmt.setString(2, userNick);
			pstmt.setString(3, c_content);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
