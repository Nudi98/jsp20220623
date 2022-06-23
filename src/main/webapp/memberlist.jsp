<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<%
	
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/odbo";
		String username = "root";
		String password = "12345";
	
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from members";
		
		try{
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			int count = 1;
			
			while(rs.next()){
				String mid = rs.getString("id");
				String mpw = rs.getString("password");
				String memail = rs.getString("email");
				String mdate = rs.getString("signuptime");
				
				out.println("아이디 : "+mid+"/ 비밀번호 : "+mpw+"/ 이메일 : "+memail+"/ 가입일 : "+mdate);
				out.println("<br>");
				
				count++;
			}
			
			int totalCount = count - 1 ;
			out.println("총 회원수 : " + count + "명");
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(rs != null){
					rs.close();
				}
				if(stmt != null){
					stmt.close();
				}
				if(conn != null){
					conn.close();
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
	%>
	<br><br>
	<hr>
	<form action="deleteOk.jsp">
		아이디 : <input type="text" name="userID">
		<input type="submit" value="회원탈퇴">
	</form>
</body>
</html>