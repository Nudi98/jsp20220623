<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String mid = request.getParameter("userID");
		
		String sql = "delete from members where id='"+mid+"'";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/odbo";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		Statement stmt = null;
		
		try{
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			stmt = conn.createStatement();
			
			int resultCheck = stmt.executeUpdate(sql);
			
			if(resultCheck == 1){
				//out.println("회원가입성공");
				response.sendRedirect("memberlist.jsp");
			}
			else{
				out.println("회원탈퇴실패");
			}
			
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
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
</body>
</html>