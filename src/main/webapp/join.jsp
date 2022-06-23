<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>회원가입</h2>
	<hr>
	<form action="joinOk.jsp" method="post">
		아이디 : <input type="text" name="userID"><br><br>
		비밀번호 : <input type="password" name="userPW"><br><br>
		이메일 : <input type="text" name="userEmail"><br><br>
		<input type="submit" value="가입">	
	</form>
</body>
</html>