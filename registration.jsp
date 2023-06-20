<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<%@include file="includes/head.jsp" %>
    <style>
        .form-container {
            margin: 50px;
        }
    </style>
</head>
<body>
	<%@include file="includes/navbar.jsp" %>

    <%
        String error = (String)session.getAttribute("Error");
        if(error == "yes")
        {
            %>
                <script>
                    alert("Password and Confirm password is not same. Try again!");
                </script>
            <%
            session.setAttribute("Error", "no");
        }

        if(valid == "yes")   
        {
            session.setAttribute("isValid", "no");
            session.setAttribute("email", "null");
            response.sendRedirect("index.jsp");
        }
        else
        {
            %>
                <form class="form-container" action="enterUser.jsp" method="post">
                    <div class="form-group row">
                        <label for="email" class="col-sm-2 col-form-label">Enter Email Address:</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email Address">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="password" class="col-sm-2 col-form-label">Enter Password:</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="password" name="password" placeholder="**********">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="confirmPassword" class="col-sm-2 col-form-label">Enter Password Again:</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="**********">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-10">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-10">
                            <a href="login.jsp">Already have Account?</a>
                        </div>
                    </div>
                </form>
            <%
        }
    %>
</body>
</html>