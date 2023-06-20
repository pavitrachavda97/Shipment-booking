<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="padding: 20px;">
    <div class="container">
      <a class="navbar-brand" href="index.jsp">Shipment Booking</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
          <%
            String valid = (String)session.getAttribute("isValid");
            if(valid == "yes")    
            {
              %>
                <li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">LogOut</a></li>
              <%
            }
            else
            {
              %>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
              <%
            }
          %>
        </ul>
      </div>
    </div>
</nav>