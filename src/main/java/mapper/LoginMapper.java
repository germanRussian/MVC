package mapper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import domain.LoginDTO;

public class LoginMapper {
	
	public boolean read(LoginDTO dto) {
		
		String url = "jdbc:mysql://localhost:3306/garam?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
		String user = "root";
		String password = "smart";
		
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) cnt from g_member " );
		sql.append(" where uid = ? and upw = sha1(?) ");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		
		try {
			//드라이버로드
			Class.forName("com.mysql.cj.jdbc.Driver");
			//연결
			conn = DriverManager.getConnection(url, user, password);
			//SQL
			stmt = conn.prepareStatement(sql.toString());
			//값 설정(쿼리 문 '?'에 들어 갈 값)
			stmt.setString(1, dto.getUid());
			stmt.setString(2, dto.getUpw());
			// 출력
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				if("1".equals(rs.getString("cnt"))) {
					return true;
				}else {
					return false;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//닫기
			
				try {
					if (stmt != null)
					stmt.close();
					if (conn != null)
						conn.close();
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
		
		
		
		
		
		return false;
	}

}
