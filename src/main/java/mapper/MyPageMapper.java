package mapper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import domain.LoginVO;
import domain.MyPageDTO;

public class MyPageMapper {

	
	
		public LoginVO read(MyPageDTO dto) {
			String url = "jdbc:mysql://localhost:3306/garam?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
			String user = "root";
			String password = "smart";
			
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			try {
				StringBuffer sql = new StringBuffer();
				sql.append(" SELECT * FROM g_member ");
				sql.append(" WHERE uid = ? ");
							
				
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url, user, password);
				
				stmt = conn.prepareStatement(sql.toString());
				stmt.setString(1, dto.getUid());
				
				
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					LoginVO vo = new LoginVO();
					
					vo.setNum(rs.getLong("num"));
					vo.setUname(rs.getString("uname"));
					vo.setSchoolname(rs.getString("schoolname"));
					vo.setGradeclass(rs.getString("gradeclass"));
					vo.setUid(rs.getString("uid"));
					vo.setUpw(rs.getString("upw"));
					vo.setRoute(rs.getString("route"));
					vo.setBoardingplace(rs.getString("boardingplace"));
					vo.setJoindate(rs.getDate("joindate"));
					vo.setCoupon(rs.getInt("coupon"));
					
					return vo;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return null;
		}

}
