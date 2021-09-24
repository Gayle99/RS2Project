<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<% 
String loginName = request.getParameter("loginName");
String password = request.getParameter("password");
int z = 0;
try {
	Connection con = ConnectionProvider.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select loginName, password from users where loginName='"+loginName+"' and password='"+password+"'");
	while(rs.next()) {
		z=1;
		session.setAttribute("loginName", loginName);
		response.sendRedirect("home.jsp");
	}
	if(z==0) //redirect if the user does not exist in the user table 
		response.sendRedirect("login.jsp?msg=notexist");
}

catch(Exception e) {
	System.out.println(e);
	response.sendRedirect("login.jsp?msg=invalid");
}

%>