<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.sectooladdict.database.ConnectionPoolManager" %>
<%@ page import="com.sectooladdict.validators.InputValidator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 5 - Injection into an order by clause (any type) in a search page with erroneous responses</title>
</head>
<body>

<%
if (request.getParameter("orderby") == null) {
%>
	View Messages and Organize Results According to the Field:<br><br>
	<form name="frmInput" id="frmInput" action="Case05-InjectionInSearchOrderBy-String-BinaryDeliberateRuntimeError-With200Errors.jsp" method="POST">
		<input type="text" name="orderby" id="orderby" value="msgid" ><br>
		<input type=submit value="submit">
	</form>
<%
} 
else {
	Connection conn = null;
    try {
  	    String order = request.getParameter("orderby");

  	    if (InputValidator.validateSemicolon(order)) {
  	        throw new Exception("Invalid Characters in Input: Semicolon (;)");
  	    }
  	    
  	    conn = ConnectionPoolManager.getConnection();
     
  	    System.out.print("Connection Opened Successfully\n");

 	    String SqlString = 
            "SELECT msgid, title, message " +
 	        "FROM messages " +
 	        "ORDER BY " + order;
 		Statement stmt = conn.createStatement();
 		ResultSet rs = stmt.executeQuery(SqlString);
 		
 		out.println("The list of messages:");
 		out.println("<TABLE>"); 		
 		out.println("<TR>");
		out.println("<TD>");
		out.println("<B>");
		out.println("MsgId");
		out.println("</B>");
		out.println("</TD>");
		out.println("<TD>");
		out.println("<B>");
		out.println("Title");
		out.println("</B>");
		out.println("</TD>");
		out.println("<TD>");
		out.println("<B>");
		out.println("Message");
		out.println("</B>");
		out.println("</TD>");
		out.println("</TR>");
		
 		while(rs.next()) {
 			
 		    out.println("<TR>");
 		    out.println("<TD>");
 			out.println(rs.getString(1));
 			out.println("</TD>");
 		    out.println("<TD>");
 			out.println(rs.getString(2));
 			out.println("</TD>");
 		    out.println("<TD>");
 			out.println(rs.getString(3));
 			out.println("</TD>");
 			out.println("</TR>");
 	    } 
 		out.println("</TABLE>");
 	 	
	  	out.flush();
	  	if(conn != null) {
        	ConnectionPoolManager.closeConnection(conn);
        }
    } catch (Exception e) {
        out.println("Exception details: " + e);
        if(!(e instanceof java.sql.SQLSyntaxErrorException)) {
  	        System.out.println("Exception details: " + e);
        }
        if(conn != null) {
        	ConnectionPoolManager.closeConnection(conn);
        }
    }
} //end of if/else block
%>

</body>
</html>