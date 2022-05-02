package mapper;

import java.sql.*;


import domain.LoginVO;

public class MyModiMapper {

	public LoginVO update(LoginVO dto) {

		String url = "jdbc:mysql://localhost:3306/garam?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
		String user = "root";
		String password = "smart";

		StringBuffer sql = new StringBuffer();
		sql.append(" update g_member ");
		sql.append(" set uname =?, schoolname =?, gradeclass =?, upw= sha1(?), route =?, boardingplace =? ");
		sql.append(" WHERE uid = ? ");

		Connection conn = null;
		PreparedStatement stmt = null;
		int res = 0;

		try {
			// 드라이버로드
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 연결
			conn = DriverManager.getConnection(url, user, password);
			// SQL
			stmt = conn.prepareStatement(sql.toString());
			// 값 설정(쿼리 문 '?'에 들어 갈 값)
			stmt.setString(1, dto.getUname());
			stmt.setString(2, dto.getSchoolname());
			stmt.setString(3, dto.getGradeclass());
			stmt.setString(4, dto.getUpw());
			stmt.setString(5, dto.getRoute());
			stmt.setString(6, dto.getBoardingplace());
			stmt.setString(7, dto.getUid());

			// 출력
			res = stmt.executeUpdate();

		} catch (Exception e) {
			e.getLocalizedMessage();
		} finally {
			// 닫기

			try {

				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return null;
	}
}
