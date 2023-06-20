<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>

<%
    String cname = request.getParameter("cname");
    String caddress = request.getParameter("caddress");
    double weight = Double.parseDouble(request.getParameter("weight"));
    double dlength = Double.parseDouble(request.getParameter("dlength"));
    double dbredth = Double.parseDouble(request.getParameter("dbredth"));
    double dheight = Double.parseDouble(request.getParameter("dheight"));
    String daddress = request.getParameter("daddress");

    String valid = (String)session.getAttribute("isValid");
    if(valid == "yes")
    {
        String email = (String)session.getAttribute("email");
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;

        Class.forName("com.mysql.jdbc.Driver");
        cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sb?characterEncoding=utf8","root", "root_123");
        
        String sql = "INSERT INTO sb.orders (email, cname, caddress, weight, dlength, dbredth, dheight, daddress) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        ps = cn.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, cname);
        ps.setString(3, caddress);
        ps.setDouble(4, weight);
        ps.setDouble(5, dlength);
        ps.setDouble(6, dbredth);
        ps.setDouble(7, dheight);
        ps.setString(8, daddress);

        int rowsAffected = ps.executeUpdate();

        response.sendRedirect("index.jsp");
    }
    else
    {
        response.sendRedirect("login.jsp");
    }
%>
