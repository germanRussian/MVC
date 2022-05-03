package mapper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import domain.LoginVO;
import domain.UseHistoryVO;

public class ListMapper {

	public Collection<UseHistoryVO> read(String uid, String status) {
		String url = "jdbc:mysql://localhost:3306/garam?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
		String user = "root";
		String password = "smart";

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		
		ArrayList<UseHistoryVO> list = new ArrayList<UseHistoryVO>();

		try {
			StringBuffer sql = new StringBuffer();
			sql.append(" SELECT * FROM g_UseHistory ");
			sql.append(" WHERE uid = ? and status = ? ");
			sql.append(" order by bpdate desc");

			

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);

			stmt = conn.prepareStatement(sql.toString());
			stmt.setString(1, uid);
			stmt.setString(2, status);
			
			
			rs = stmt.executeQuery();
			UseHistoryVO vo = null;

			while(rs.next()) {
				vo = new UseHistoryVO();

				vo.setNum(rs.getInt("num"));
				vo.setUid(rs.getString("uid"));
				vo.setStatus(rs.getString("status"));
				vo.setStart(rs.getString("start"));
				vo.setEnd(rs.getString("end"));
				vo.setBpdate(rs.getTimestamp("bpdate"));
				
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	

}
