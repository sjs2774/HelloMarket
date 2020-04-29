package Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import User.Dbconn;


public class BoardDAO {

   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;
   DataSource ds;
   
   public BoardDAO() {
      try {
         conn = Dbconn.getConnection();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
      
   public int registBoard(BoardDTO boarddto) {
	   
	      try {
	    	 conn = Dbconn.getConnection();
	    	 
	    	 String sql = "insert into sellboard(user_nick, deal_m1, p_image1_path, p_image1_orig_name, p_title, p_m_catagory, p_s_catagory, p_description, p_trade_kind, p_price, p_delivery, p_exchange, p_status1, p_status2, p_transac_loc) " + 
			            "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	    	 
	         pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	         
	         pstmt.setString(1, boarddto.getUserNick());
	         pstmt.setString(2, boarddto.getDeal_m1()+ boarddto.getDeal_m2());
	         pstmt.setString(3, boarddto.getP_image1_path());
	         pstmt.setString(4, boarddto.getP_image1_orig_name());
	         pstmt.setString(5, boarddto.getP_title());
	         pstmt.setString(6, boarddto.getP_m_category());
	         pstmt.setString(7, boarddto.getP_s_category());
	         pstmt.setString(8, boarddto.getP_description());
	         pstmt.setString(9, boarddto.getP_trade_kind());
	         pstmt.setString(10, boarddto.getP_price());
	         pstmt.setString(11, boarddto.getP_delivery());
	         pstmt.setString(12, boarddto.getP_exchange());
	         pstmt.setString(13, boarddto.getP_status1());
	         pstmt.setString(14, boarddto.getP_status2());
	         pstmt.setString(15, boarddto.getP_transac_loc());
	         
	         int rows = pstmt.executeUpdate();
	        
	         ResultSet geneResultKey = pstmt.getGeneratedKeys();
	            if(geneResultKey.next()) {
	            	
	               boarddto.setP_idx(geneResultKey.getInt(1));
	            }    
	         if(rows>=1) {
		        	 System.out.println("db 성공"); 
		         }
	      
	      } catch (Exception e) {
	         e.printStackTrace();
	         System.out.println("데이터 연결 실패...");
	      }
	return 0;
	     
	   }
	
   

    public List<BoardDTO> showAllItem(){
    	List<BoardDTO> board = new ArrayList<BoardDTO>();
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	try {
    		conn = Dbconn.getConnection();
    		String sql ="select p_idx,p_title,p_price,p_image1_orig_name,p_image1_path from sellboard";
    		pstmt = conn.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    		while(rs.next()) {
    			BoardDTO boardDTO = new BoardDTO();
    			boardDTO.setP_idx(rs.getInt("p_idx"));
    			boardDTO.setP_title(rs.getString("p_title"));
    			boardDTO.setP_price(rs.getString("p_price"));
    			boardDTO.setP_image1_orig_name(rs.getString("p_image1_orig_name"));
    			boardDTO.setP_image1_path(rs.getString("p_image1_path"));
    			board.add(boardDTO);
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return board;
    	
    }
   

 
   
   
}