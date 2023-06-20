<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>

<html>
	<head>
		<%@include file="includes/head.jsp" %>
        <style>
            table {
                margin-top: 50px;
            }
        </style>
	</head>
	<body>		
        <%@include file="includes/navbar.jsp" %>

        <%
            if(valid == "yes")
            {
                String email = (String)session.getAttribute("email");
                Connection cn = null;
                ResultSet rs = null;
                Statement stmt = null;
                
                Class.forName("com.mysql.jdbc.Driver");
                cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sb?characterEncoding=utf8","root", "root_123");
                
                PreparedStatement ps = cn.prepareStatement("select * from orders where email=(?)");  
                ps.setString(1, email);    
            
                rs = ps.executeQuery();
                %>
                    <table class="table table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">Customer Address</th>
                                <th scope="col">Consignment Weight</th>
                                <th scope="col">Consignment Length</th>
                                <th scope="col">Consignment Bredth</th>
                                <th scope="col">Consignment Height</th>
                                <th scope="col">Delivery Address</th>
                                <th scope="col">Cancel Order</th>
                            </tr>
                        </thead>
                <%
                
                while(rs.next())
                {%>
                        <tbody>
                            <tr>
                                <td> <%=rs.getString(3) %> </td>
                                <td> <%=rs.getDouble(5) %> </td>
                                <td> <%=rs.getDouble(6) %> </td>
                                <td> <%=rs.getDouble(7) %> </td>
                                <td> <%=rs.getDouble(8) %> </td>
                                <td> <%=rs.getString(9) %> </td>
                                <td>
                                    <form action="cancelOrder.jsp">
                                        <label for="orderId">
                                            <input type="hidden" name="orderId" value="<%=rs.getInt(1) %>" />
                                        </label>
                                        <button type="submit">Cancel Order</button>
                                    </form>
                                </td>
                            </tr>
                        </tbody>
                <%}
                    %>
                    </table>
                    <%
            }
            else
            {
                response.sendRedirect("login.jsp");
            }
        %>
	</body>
</html>