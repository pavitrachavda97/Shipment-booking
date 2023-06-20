<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");
    System.out.println("password:" + password);
    System.out.println("confirmPassword:" + confirmPassword);

    String valid = (String)session.getAttribute("isValid");
    if(valid == "yes")
    {
        response.sendRedirect("index.jsp");
    }
    else
    {
        if(password.equals(confirmPassword))
        {
            Connection cn = null;
            ResultSet rs = null;
            PreparedStatement ps = null;

            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sb?characterEncoding=utf8","root", "root_123");
            
            String sql = "INSERT INTO sb.login (email, password) VALUES (?, ?)";
            ps = cn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            int rowsAffected = ps.executeUpdate();
            session.setAttribute("isValid", "yes");
			session.setAttribute("email", email);
			response.sendRedirect("index.jsp");
        }
        else
        {
            response.sendRedirect("registration.jsp");
            session.setAttribute("Error", "yes");
        }
    }
%>
