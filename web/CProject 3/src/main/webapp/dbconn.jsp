<%@ page import="java.sql.*"%>
<%
	Connection con = null;

	String url = "jdbc:mysql://localhost:3306/autocomDB";
	String user = "root";
	String password = "980901";

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(url, user, password);
%>