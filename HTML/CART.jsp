<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<head>
    <title>Cart</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css"  href="../CSS/CART.css">
    <style>
        .popup-container {
    display: none; 
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6); 
    z-index: 1000;
    overflow-y: auto; 
}

.popup-form {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: #fff;
    padding: 30px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    width: 90%;
    max-width: 500px; 
}

.close-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 20px;
    font-weight: bold;
    cursor: pointer;
    color: #ff0000;
}

form {
    display: flex;
    flex-direction: column;
}

.row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 15px;
    gap: 10px; 
}

.row div {
    flex: 1;
}

label {
    display: block;
    font-size: 14px;
    margin-bottom: 5px;
    color: #333;
}

.popup-form input, select {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

input::placeholder {
    color: #aaa;
}

button.submit-btn {
    display: block;
    margin: 20px auto 0;
    padding: 10px 20px;
    font-size: 16px;
    color: #fff;
    background-color: #007bff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button.submit-btn:hover {
    background-color: #0056b3;
}
@media screen and (max-width: 600px) {
    .row {
        flex-direction: column;
    }
}

    </style>

    
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">
          <img src="../IMAGES/LOGO.png" width="150" height="40" alt="">
        </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
        
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item">
                <a class="nav-link" href="HOME.html">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="RESTAURANT.html">Restaurant</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="ABOUT.html">About us</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="CART.jsp">Cart</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="PROFILE.jsp">Profile</a>
              </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
              <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
          </div>
        </nav>
    <div class="alert" id="alert" style="display: none;">
    </div>

    <div class="cart-items">

    </div>
    <center>
      <div id="empty-cart-message">
        <script src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs" type="module"></script>
        <dotlottie-player 
            src="https://lottie.host/5c62a722-3568-4d9b-8475-37d46c935717/4ZI9bE2MYJ.lottie" 
            background="transparent" 
            speed="1" 
            style="width: 100%; max-width: 400px; height: auto;" 
            loop 
            autoplay>
        </dotlottie-player>
    </div>
    </center>
    <div id="main">
        <table class="responsive-table">
            <tr>
              <td>
                <h3>Apply Coupon</h3>
                <input type="text" id="coupon" placeholder="Enter coupon code">
                <button onclick="applyCoupon()" class="apply">Apply</button>
              </td>
              <td>
                <div class="delivery-address">
                    <h4>Choose Delivery Address</h4>

                    <%
                    final String DB_URL = "jdbc:mysql://db:3306/food_delivery";
                    final String DB_USER = "user";
                    final String DB_PASSWORD = "password";
                    Cookie[] cookies = request.getCookies();
                    String mobileNumber = null;
                
                    // Retrieve mobile number from cookies
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if ("mobileNumber".equals(cookie.getName())) {
                                mobileNumber = cookie.getValue();
                                break;
                            }
                        }
                    }
                
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;
                
                    if (mobileNumber != null) {
                        try {
                            // Connect to the database
                            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                            String addressQuery = "SELECT address FROM addresses WHERE mobile = ?";
                            stmt = conn.prepareStatement(addressQuery);
                            stmt.setString(1, mobileNumber);
                            rs = stmt.executeQuery();
                
                            // Display addresses as radio buttons
                            while (rs.next()) {
                %>
                            <div style="display:flex; gap: 30px; justify-self:center;">
                                <input type="radio" name="address" required checked>
                                <label><%= rs.getString("address") %></label>
                            </div>
                <%
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        } finally {
                            try {
                                if (rs != null) rs.close();
                                if (stmt != null) stmt.close();
                                if (conn != null) conn.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    } else {
                %>
                        <p>No addresses available.</p>
                <%
                    }
                %>
                <a href="#" onclick="openpop()">Add New Address</a>

                <div id="popup" class="popup-container">
                    <div class="popup-form">
                        <span class="close-btn" onclick="closepop()">X</span>
                        <form method="POST">
                            <div class="row">
                                <div>
                                    <label for="name">Name<span class="required">*</span></label>
                                    <input type="text" id="name" name="name" placeholder="Enter your name" required>
                                </div>
                                <div>
                                    <label for="mobile">Registered Mobile Number<span class="required">*</span></label>
                                    <input type="tel" id="mobile" name="mobile" placeholder="Registered mobile number" required maxlength="10">
                                </div>
                            </div>
                            <div class="row">
                                <div>
                                    <label for="hno">Door Number<span class="required">*</span></label>
                                    <input type="text" id="hno" name="hno" placeholder="House Number" required>
                                </div>
                                <div>
                                    <label for="landmark">Landmark<span class="required">*</span></label>
                                    <input type="text" id="landmark" name="landmark" placeholder="Landmark" required>
                                </div>
                            </div>
                
                            <div class="row">
                                <div>
                                    <label for="pincode">Pincode<span class="required">*</span></label>
                                    <input type="text" id="pincode" name="pincode" placeholder="Pincode" required>
                                </div>
                                <div>
                                    <label for="city">City<span class="required">*</span></label>
                                    <input type="text" id="city" name="city" placeholder="City" required>
                                </div>
                            </div>
                            <div class="row">
                                <div>
                                    <label for="state">State<span class="required">*</span></label>
                                    <select id="state" name="state" required>
                                        <option value="">Select State</option>
                                        <option value="andhra-pradesh">Andhra Pradesh</option>
                                        <option value="arunachal-pradesh">Arunachal Pradesh</option>
                                        <option value="assam">Assam</option>
                                        <option value="bihar">Bihar</option>
                                        <option value="chhattisgarh">Chhattisgarh</option>
                                        <option value="goa">Goa</option>
                                        <option value="gujarat">Gujarat</option>
                                        <option value="haryana">Haryana</option>
                                        <option value="himachal-pradesh">Himachal Pradesh</option>
                                        <option value="jharkhand">Jharkhand</option>
                                        <option value="karnataka">Karnataka</option>
                                        <option value="kerala">Kerala</option>
                                        <option value="madhya-pradesh">Madhya Pradesh</option>
                                        <option value="maharashtra">Maharashtra</option>
                                        <option value="manipur">Manipur</option>
                                        <option value="meghalaya">Meghalaya</option>
                                        <option value="mizoram">Mizoram</option>
                                        <option value="nagaland">Nagaland</option>
                                        <option value="odisha">Odisha</option>
                                        <option value="punjab">Punjab</option>
                                        <option value="rajasthan">Rajasthan</option>
                                        <option value="sikkim">Sikkim</option>
                                        <option value="tamil-nadu">Tamil Nadu</option>
                                        <option value="telangana">Telangana</option>
                                        <option value="tripura">Tripura</option>
                                        <option value="uttar-pradesh">Uttar Pradesh</option>
                                        <option value="uttarakhand">Uttarakhand</option>
                                        <option value="west-bengal">West Bengal</option>
                                    </select>
                                </div>
                                <div>
                                    <label for="alt-phone">Alternate Phone</label>
                                    <input type="tel" id="alt-phone" name="alt-phone" placeholder="Alternate Phone" maxlength="10">
                                </div>
                            </div>
                
                           
                            <button type="submit" class="submit-btn">Submit</button>
                        </form>
                    </div>
                </div>
                
    <%
                if (request.getMethod().equalsIgnoreCase("POST")) {
                String name = request.getParameter("name");
                String mobile = request.getParameter("mobile");
                String hno = request.getParameter("hno");
                String pincode = request.getParameter("pincode");

               
                String landmark = request.getParameter("landmark");
                String city = request.getParameter("city");
                String state = request.getParameter("state");
                String altPhone = request.getParameter("alt-phone");
                PreparedStatement pstmt = null;
                try {
                    // Establish database connection
                    conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        
                    // Combine address fields into one string
                    String fullAddress = name + "- " + hno  + ", " + landmark + ", " + city + ", " + state + ", " + pincode + " - " + mobile + "," + altPhone;
        
                    // Prepare SQL statement
                    String sqlAddress = "INSERT INTO addresses (mobile, address) VALUES (?, ?)";
                    pstmt = conn.prepareStatement(sqlAddress);
                    pstmt.setString(1, mobile);
                    pstmt.setString(2, fullAddress);
        
                    // Execute query
                    int addressRowsAffected = pstmt.executeUpdate();
        
                    if (addressRowsAffected > 0) {
        %>
                        <script>
                
                            window.location.href = window.location.href;
                        </script>
        <%
                    } else {
        %>
                        <script>
                            alert("Failed to insert address details. Please try again.");
                        </script>
        <%
                    }
                } catch (SQLException e) {
        %>
                    <script>
                        alert("Database error occurred. Please try again later.");
                    </script>
        <%
                    e.printStackTrace();
                } finally {
                    try {
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>    
                </div>
              </td>
            </tr>
          </table>       
    <div class="cart-summary-container">
        <h3 class="summary-title">Cart Summary</h3>
        <div class="summary-header d-flex justify-content-between align-items-center">
            <span class="total-amount">Total: Rs. <span id="amount-to-pay" style="color: rgb(24, 93, 255);">0.00</span></span>
            <button id="toggle-summary-details" class="btn btn-info btn-sm">View Details</button>
        </div>
        
        <div id="summary-details" class="summary-details mt-3" style="display: none;">
            <table class="table table-striped table-bordered">
                <thead class="thead-light">
                    <tr>
                        <th>Description</th>
                        <th>Amount (Rs.)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Subtotal:</td>
                        <td id="total-cost">0.00</td>
                    </tr>
                    <tr>
                        <td>Tax:</td>
                        <td id="tax">0.00</td>
                    </tr>
                    <tr>
                        <td>Delivery Charges:</td>
                        <td id="delivery-tax">0.00</td>
                    </tr>
                    <tr class="table-info font-weight-bold">
                        <td>Total Amount:</td>
                        <td id="amount-to-pay">0.00</td>
                    </tr>
                </tbody>
            </table>
        </div>
    
        <div class="action-buttons text-center mt-3">
            <a href="CHECKOUT.html" class="btn btn-success btn-lg mr-2">Proceed to Checkout</a>
            <button id="delete-selected-button" class="btn btn-danger btn-lg">Delete Selected Items</button>
        </div>
    </div>
</div>
    
    <script>
        document.getElementById('toggle-summary-details').addEventListener('click', function() {
            const details = document.getElementById('summary-details');
            details.style.display = details.style.display === 'none' ? 'block' : 'none';
        });
    </script>     
    </div>
    <script>
        function openpop() {
            document.getElementById('popup').style.display = 'block';
            document.getElementById('overlay').style.display = 'block';
        }

        function closepop() {
            document.getElementById('popup').style.display = 'none';
            document.getElementById('overlay').style.display = 'none';
        }

    </script>
     <script src="../JS/CART.js?ver=1.0"></script>
    <script src="../JS/DOMINOS2.js"></script>
</body>
</html>
