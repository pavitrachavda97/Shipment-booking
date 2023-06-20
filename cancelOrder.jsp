<%@ page import = "java.sql.*" %>

<%
    int orderId = Integer.parseInt(request.getParameter("orderId"));
    String valid = (String)session.getAttribute("isValid");
    if(valid == "yes")
    {
        Connection cn = null;
        ResultSet rs = null;
        Statement stmt = null;
        
        Class.forName("com.mysql.jdbc.Driver");
        cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sb?characterEncoding=utf8","root", "root_123");
        
        PreparedStatement ps = cn.prepareStatement("DELETE FROM orders where id=(?)");  
        ps.setInt(1, orderId);  
        ps.executeUpdate();  
        response.sendRedirect("orders.jsp");
    }
    else
    {
        response.sendRedirect("login.jsp");
    }
%>