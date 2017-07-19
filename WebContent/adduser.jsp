<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="adduserServlet" method="post"></form>
	Username:&nbsp;<input type="text" name="username"><br/>
	Email:&nbsp;<input type="text" name="email"><br/>
	Password:&nbsp;<input type="password" name="password"><br/>
	Motto:&nbsp;<input type="text" name="motto"><br/>
	<input type="hidden" name="action" value="login">
	<input type="submit" value="Sign up">
</body>
</html>