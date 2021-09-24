<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>

</style>
</head>
<body>
<div class="table-title">All Products <i class="fa fa-institution"></i></div>

<%
String msg = request.getParameter("msg");

if("added".equals(msg)) {
	%>
	<h3 class="alert">Product added successfully.</h3>
<% } %>

<%
if("exists".equals(msg)) {
	%>
	<h3 class="alert">Product already exists in your cart. The quantity has been increased.</h3>
<% } %>

<%
if("invalid".equals(msg)) {
	%>
	<h3 class="alert">Something went wrong. Please try again.</h3>
<% } %>

<% 
if("notPossible".equals(msg)) {
	%>
	<h3 class="alert">Please click remove to remove product.</h3>
<% } %>

<% 
if("inc".equals(msg)) {
	%>
	<h3 class="alert">Quantity increased successfully.</h3>
<% } %>

<% 
if("dec".equals(msg)) {
	%>
	<h3 class="alert">Quantity decreased successfully.</h3>
<% } %>

<% 
if("removed".equals(msg)) {
	%>
	<h3 class="alert">Product successfully removed.</h3>
<% } %>

<table>
        <thead>
          <tr>
            <th scope="col">Product ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col">Description</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
            
          </tr>
        </thead>
        <tbody>
<%
try{
	Connection con = ConnectionProvider.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from products");
	while(rs.next()) {
	
%>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
            <td><a class="addToCart" href="addToCartAction.jsp?id=<%=rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
<% } 
}
catch(Exception e) {
	System.out.println(e);
}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>
      
      <div class="table-title">My Cart <i class='fas fa-cart-arrow-down'></i></div>
      
<table>
	<thead>
	
        </thead>
        <thead>
          <tr>
          <th scope="col">Product ID</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col">Quantity</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
        
        <% 
        try{
        	String userName = session.getAttribute("loginName").toString(); 
        	Connection con = ConnectionProvider.getConnection();
        	Statement st = con.createStatement();
        	ResultSet rs1 = st.executeQuery("select * from products inner join basket on products.productID = basket.productID where basket.loginName='"+userName+"'");
        	while(rs1.next()) {
     
        	
        %>
      
      
          <tr>
           <td><%=rs1.getString(1)%></td>
            <td><%=rs1.getString(2) %></td>
            <td><%=rs1.getString(3) %></td>
            <td><a class="increaseQuantity" href="incDecQuantityAction.jsp?id=<%=rs1.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%=rs1.getInt(8) %> <a class="decreaseQuantity" href="incDecQuantityAction.jsp?id=<%=rs1.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><a class="removeItem" href="removeFromCart.jsp?id=<%=rs1.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
<% } 
}
catch(Exception e) {
	System.out.println(e);
}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>