<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    <% String loginName = session.getAttribute("loginName").toString(); %>
            <h2 class="nav-title">Online Shopper</h2>
            <h2><a href=""><%out.println(loginName); %> <i class='fas fa-user-alt'></i></a></h2>
            <a href="home.jsp">Home<i class="fa fa-institution"></i></a>
            <a href="logout.jsp">Logout <i class='fas fa-share-square'></i></a>
            <div class="search-container">
             <form action="searchHome.jsp" method="post">
             <input class ="search-bar" type="text" placeholder="Search here..." name="productNameSearch">
             <select class="search-filter" name="productTypeSearch">
             	<option value="books">Books</option>
             	<option value="music">Music</option>
             	<option value="Games">Games</option>
             </select>
             <button class="search-button" type="submit"><i class="fa fa-search"></i></button>
             </form>
            </div>
          </div>
           <br>
           <!--table-->
