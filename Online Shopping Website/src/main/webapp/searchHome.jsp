<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div class="table-title">Home <i class="fa fa-institution"></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>

<%
int z = 0;
try{
	String searchProductName = request.getParameter("productNameSearch");
	String searchProductType = request.getParameter("productTypeSearch");
	Connection con = ConnectionProvider.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from products where productName like '%"+searchProductName+"%' and productType like '%"+searchProductType+"%'");
	while(rs.next()) {
		z = 1;
	
%>
          <tr>
             <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
            <td><a href="addToCartAction.jsp?id=<%=rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
          
<% } 
}
catch(Exception e) {
	System.out.println(e);
}
%>
         
        </tbody>
      </table>
      	<%if(z==0) { %>
      		<h3 class="alert">Product does not exist. Please try another search.</h3>
      <% } %>
	
	
  

</body>
</html>