
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <div class="title"><h1>Welcome to Online Shopper!</h1></div>
     <form action="loginAction.jsp" method="post">
     <input type="text" name="loginName" placeholder="Enter login name" required>
     <input type="password" name="password" placeholder="Enter password" required>
     <input type="submit" value="Login">
     </form>
      <h2 class="signup-link"><a href="signup.jsp">Sign Up</a></h2>
  </div>

  


  </div>
    <%
  String msg = request.getParameter("msg");
  if("notexist".equals(msg))
  {
  %>
  <h1 style="text-align:center; color:red; font-size: 19px">Incorrect Username or Password</h1>
 <% } %> 

 <%
 if("invalid".equals(msg)) 
 { %>
	 <h1 style="text-align:center; color:red; font-size: 19px">Some thing Went Wrong! Try Again !</h1>
 <% } %>
  


</body>
</html>