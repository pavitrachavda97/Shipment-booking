<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="includes/head.jsp" %>
    <style>
        .form-container {
            margin: 50px;
        }
    </style>
</head>
<body>
    <%@include file="includes/navbar.jsp" %>

    <form class="form-container" action="placeOrder.jsp" method="post">
        <div class="form-group row">
          <label for="cname" class="col-sm-2 col-form-label">Customer Name</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="cname" name="cname" placeholder="Enter Customer Name">
          </div>
        </div>
        <div class="form-group row">
          <label for="caddress" class="col-sm-2 col-form-label">Customer Address</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="caddress" name="caddress" placeholder="Enter Customer Address">
          </div>
        </div>
        <div class="form-group row">
            <label for="weight" class="col-sm-2 col-form-label">Consignment Weight (Kg)</label>
            <div class="col-sm-10">
              <input type="number" class="form-control" id="weight" name="weight">
            </div>
        </div>
        <div class="form-group row">
            <label for="dimension" class="col-sm-2 col-form-label">Consignment Dimensions</label>
            <div class="col-md-2 mb-2">
                <label for="dlength">Length</label>
                <input type="number" class="form-control" id="dlength" name="dlength" placeholder="Length" required>
            </div>
            <div class="col-md-2 mb-2">
                <label for="dbredth">Bredth</label>
                <input type="number" class="form-control" id="dbredth" name="dbredth" placeholder="Bredth" required>
            </div>
            <div class="col-md-2 mb-2">
                <label for="dheight">Height</label>
                <input type="number" class="form-control" id="dheight" name="dheight" placeholder="Height" required>
            </div>
        </div>
        <div class="form-group row">
            <label for="daddress" class="col-sm-2 col-form-label">Delivery Address</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="daddress" name="daddress" placeholder="Enter Delivery Address">
            </div>
        </div>
        <div class="form-group row">
          <div class="col-sm-10">
            <button type="submit" class="btn btn-primary">Submit</button>
          </div>
        </div>
      </form>
</body>
</html>