<%
session.invalidate(); //removing all the values from the session
response.sendRedirect("login.jsp");
%>