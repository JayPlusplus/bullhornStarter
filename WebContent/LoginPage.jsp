
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to Bullhorn</title>
</head>
<body>
<h1>Login Page</h1>

<form action="LoginServlet" method="post">
	Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="email"><br/>
	Password:&nbsp;<input type="password" name="password"><br/>
	<input type="hidden" name="action" value="login">
	<input type="submit" value="Log In">
</form>
<p/>
<a href="adduser.jsp">New User</a><br/>
<a href="LoginServlet">What happens if you go directly to login servlet without logging in?</a>
</body>
</html>