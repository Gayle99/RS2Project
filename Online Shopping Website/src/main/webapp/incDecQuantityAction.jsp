<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<% 
String loginName = session.getAttribute("loginName").toString();
String productID = request.getParameter("id");
String incdec = request.getParameter("quantity");
int quantity = 0;


try {
	Connection con = ConnectionProvider.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from basket where loginName='"+loginName+"' and productID='"+productID+"'");
	while(rs.next()) {
		quantity = rs.getInt(4);
	}

	if(quantity == 1 && incdec.equals("dec")) {
		response.sendRedirect("home.jsp?msg=notPossible");
	}
	
	else if(quantity != 1 && incdec.equals("dec")) {
		quantity = quantity - 1;
		st.executeUpdate("update basket set quantity='"+quantity+"' where loginName='"+loginName+"' and productID='"+productID+"'");
		response.sendRedirect("home.jsp?msg=dec");
	}
	
	else {
		quantity = quantity + 1;
		st.executeUpdate("update basket set quantity='"+quantity+"' where loginName='"+loginName+"' and productID='"+productID+"'");
		response.sendRedirect("home.jsp?msg=inc");
	}
}

catch(Exception e) {
	System.out.println(e);
}
%>