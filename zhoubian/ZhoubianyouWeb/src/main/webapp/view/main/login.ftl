<html>
	<head></head>
	
	<body>
	
	<form action="j_spring_security_check" method="POST">
		用户名：<input name="username" id="username"/>
		</br>
		密码：<input name="password" id="password"/>
		
		<input type="submit" name="提交" />
	</form>
	<div>${Session.SPRING_SECURITY_LAST_EXCEPTION.message}</div>
	</body>

</html>