<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Sign up</title>
</head>
<body>
<div id='container'>

  <div class='signup'>
  <div class="title"><h1>Welcome to Online Shopper!</h1></div>
    <form action="signUpAction.jsp" method="post">
    <input type="text" name="loginName" placeholder="Register login name" required>
    <input type="password" name="password" placeholder="Enter password" required>
    <input type="submit" value="Sign Up">
    </form>
      <h2 class="login-link"><a href="login.jsp">Login</a></h2>
  </div>
 
</div>
  <%
	String msg=request.getParameter("msg");
	if("valid".equals(msg)) {
	%>
		<h1 style="text-align:center; color:red; font-size: 19px">Successfully Registered</h1>
	<% } %>

	<% 
	if("invalid".equals(msg)) {
	%>
		<h1  style="text-align:center; color:red; font-size: 19px;">Something went wrong! Try again!</h1>
	<% } %>

</body>
</html>