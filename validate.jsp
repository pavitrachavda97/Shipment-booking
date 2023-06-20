<%@ page import = "java.sql.*" %>

<%
	out.println("Validate jsp file");
	Connection cn;
	ResultSet rs;
	Statement stmt;
	
	String email = request.getParameter("email");
	String password = request.getParameter("password");
    System.out.println(email);
    System.out.println(password);
	try
	{	
		Class.forName("com.mysql.jdbc.Driver");
		cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sb?characterEncoding=utf8","root", "root_123");
		stmt = cn.createStatement();
		
		rs = stmt.executeQuery("SELECT * FROM login WHERE email='"+ email +"' AND password='" + password + "'");
		
		if(rs.next())
		{
            session.setAttribute("isValid", "yes");
			session.setAttribute("email", email);
			response.sendRedirect("index.jsp");
		}
		else
		{
			session.setAttribute("isValid", "no");
			response.sendRedirect("login.jsp");
		}
		rs.close();
	}
	catch(Exception e)
	{
		out.println("Exception: " + e);
	}
%>
