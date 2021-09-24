<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String loginName = session.getAttribute("loginName").toString();
String productID = request.getParameter("id");

try {
	Connection con = ConnectionProvider.getConnection();
	Statement st = con.createStatement();
	st.executeUpdate("delete from basket where productID='"+productID+"' and loginName='"+loginName+"'");
	response.sendRedirect("home.jsp?msg=removed");
}

catch(Exception e) {
	System.out.println(e);
}

%>