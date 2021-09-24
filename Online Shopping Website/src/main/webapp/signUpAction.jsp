<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%

String loginName = request.getParameter("loginName");
String password = request.getParameter("password");

try {
	Connection con = ConnectionProvider.getConnection();
	PreparedStatement ps = con.prepareStatement("insert into users(loginName, password) values(?, ?)");
	ps.setString(1, loginName);
	ps.setString(2, password);
	ps.executeUpdate(); 
	response.sendRedirect("signup.jsp?msg=valid");
}

catch(Exception e) {
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");
}
%>