<%@ page import="Project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<% 
try {
	Connection con = ConnectionProvider.getConnection();
	Statement st = con.createStatement();
	String create_users_table = "create table users (userID INT auto_increment primary key, loginName VARCHAR(20), password VARCHAR(20), UNIQUE(loginName))";
	String create_products_table = "create table products(productID INT auto_increment primary key, productName VARCHAR(32), productType VARCHAR(8), productDesc VARCHAR(100))";
	String create_basket_table = "create table basket(basketID INT auto_increment primary key, productID int, loginName VARCHAR(20), quantity int, foreign key (productID) references products(productID), foreign key(loginName) references users(loginName))";
	System.out.println(create_users_table);
	System.out.println(create_products_table);
	System.out.println(create_basket_table);
	//st.execute(create_users_table);
	//st.execute(create_products_table);
	st.execute(create_basket_table);
	System.out.println("Tables have been created");
	con.close();
}
catch(Exception e) {
	System.out.println(e);
}
%>