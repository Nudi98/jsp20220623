<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 완료</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String mid = request.getParameter("userID");
		String mpw = request.getParameter("userPW");
		String memail = request.getParameter("userEmail");
		
		String sql = "insert into members(id, password, email) values ('"+ mid +"','" + mpw +"','" + memail + "')";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/odbo";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		
		try{
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			Statement stmt = conn.createStatement()();
			
			int resultCheck = stmt.executeUpdate(sql);
			
			if(resultCheck == 1){
				out.println("회원가입성공");
			}
			else{
				out.println("회원가입실패");
			}
		
		out.println(conn);
		}
		catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null){
				conn.close();
			}
		}
	%>
</body>
</html>