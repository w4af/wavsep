<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.sectooladdict.database.ConnectionPoolManager" %>
<%@ page import="com.sectooladdict.validators.InputValidator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 2 - False Positive Injection in a login page that responds with erroneous syntax containing 500 HTTP responses to input validation failures</title>
</head>
<body>

<%
if (request.getParameter("username") == null
	&& request.getParameter("password") == null	) {
%>
	Login Page:<br><br>
	<form name="frmInput" id="frmInput" action="Case02-FalsePositiveInjectionInLogin-PsAndIv-500SyntaxErrorOnIvFailure.jsp" method="POST">
		<input type="text" name="username" id="username"><br>
		<input type="password" name="password" id="password"><br>
		<input type=submit value="submit">
	</form>
<%
} 
else {
	Connection conn = null;
    try {
  	    String username = request.getParameter("username");
  	    String password = request.getParameter("password");
  	    
  	    if (InputValidator.validateAll(username)) {
  	    	throw new SQLException("Invalid Input for SQL");
  	    }
  	    if (InputValidator.validateAll(password)) {
	    	throw new SQLException("Invalid Input for SQL");
	    }

  	  	conn = ConnectionPoolManager.getConnection();
     
        System.out.print("Connection Opened Successfully\n");

 	    String SqlString = 
            "SELECT username, password " +
    	    "FROM users " +
    	    "WHERE username=? AND password=?";
 		PreparedStatement pstmt = conn.prepareStatement(SqlString);
 		pstmt.setString(1,username);
 		pstmt.setString(2,password);
 		ResultSet rs = pstmt.executeQuery();
 		 
 		if(rs.next()) {
 			out.println("hello " + rs.getString(1));
 	    } else {
 	 		out.println("login failed");
 	 	}
 	 	
 		if(conn != null) {
        	ConnectionPoolManager.closeConnection(conn);
        }
	  	out.flush();
	  	
    } catch (SQLException e) {
    	if(!(e instanceof java.sql.SQLSyntaxErrorException)) {
  	        System.out.println("Exception details: " + e);
        } 

		if(conn != null) {
        	ConnectionPoolManager.closeConnection(conn);
        }
        response.sendError(500,"Exception details: " + e);
    } catch (Exception e) {
    	if(!(e instanceof java.sql.SQLSyntaxErrorException)) {
  	        System.out.println("Exception details: " + e);
        } 

		if(conn != null) {
        	ConnectionPoolManager.closeConnection(conn);
        }
        response.sendError(500,"Exception details: " + e);
    }
} //end of if/else block
%>

</body>
</html>