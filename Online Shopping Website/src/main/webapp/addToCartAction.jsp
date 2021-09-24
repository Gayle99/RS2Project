<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<% 

String loginName = session.getAttribute("loginName").toString();
String productID = request.getParameter("id");
int quantity = 1;
int z = 0;

try {
	Connection con = ConnectionProvider.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("Select * From products Where productID='"+productID+"'");
	
	//Checking if item already exists in user's basket
	ResultSet rs1 = st.executeQuery("Select * From basket Where productID='"+productID+"' and loginName='"+loginName+"'");
	while(rs1.next()) {
		quantity = rs1.getInt(4);
		quantity = quantity +  1;
		z=1; 
	}
	
	if(z==1) {
		st.executeUpdate("update basket set quantity='"+quantity+"' where productID='"+productID+"' and loginName='"+loginName+"'");
		response.sendRedirect("home.jsp?msg=exists");
	}
	
	if(z==0) {
		PreparedStatement ps = con.prepareStatement("insert into basket (productID, loginName, quantity) values(?,?,?)");
		ps.setString(1, productID);
		ps.setString(2, loginName);
		ps.setInt(3, quantity);
		ps.executeUpdate();
		response.sendRedirect("home.jsp?msg=added");
	}
	
	
}

catch(Exception e) {
	System.out.println(e);
	response.sendRedirect("home.jsp?msg=invalid");
}
%>