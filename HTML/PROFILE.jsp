<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../CSS/PROFILE.css">
    <title>Profile | Food Delivery</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"  crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"  crossorigin="anonymous"></script>
    <style>
         #popupForm {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 30px;
            border: 1px solid #ccc;
            background: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            z-index: 1001;
            text-align: center;
        }
        
        #overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1000;
        }
        
        #popupForm .close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            color: red;
            cursor: pointer;
            font-size: 20px;
            font-weight: bold;
        }
       
        a{
            color: red;
        }
        a:hover{
            color: red;
            text-decoration: underline;
        }
        .submit {
            
            background-color: #ff6060;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .submit:hover {
            background-color: #ef0800;
        }

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
                <a class="nav-link" href="CART.jsp">Cart</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="PROFILE.jsp">Profile</a>
              </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
              <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
          </div>
    </nav>
    



    <div class="profile-container">
        <div class="profile-header">
            <div class="profile-photo">
                <img src="../IMAGES/user.png" alt="Profile Picture">
            </div>
            <div class="profile-details">
                <%
                    final String DB_URL = "jdbc:mysql://db:3306/food_delivery";
                    final String DB_USER = "user";
                    final String DB_PASSWORD = "password";
                    Cookie[] cookies = request.getCookies();
                    String mobileNumber = null;
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
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    
                            String query = "SELECT * FROM users WHERE mobile = ?";
                            stmt = conn.prepareStatement(query);
                            stmt.setString(1, mobileNumber);
                            rs = stmt.executeQuery();
                            if (rs.next()) {
                %>
                <h1><%= rs.getString("name") %></h1>
                <p><strong>Mobile: </strong><%= rs.getString("mobile") %></p>
                <button class="edit-btn">Edit Details</button>
                <%
                            }
                        } catch (ClassNotFoundException | SQLException e) {
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
                <p>Please log in to view your profile.</p>
                <%
                    }
                %>
            </div>
        </div>
        <div class="account-section">
            <div class="dropdown">
                <div style="display: inline;"><h5>My Account</h5>
                    <p>Favaurites,Hidden restaurents & Settings</p>
                </div>
                
                <button class="dropdown-button" onclick="toggleDropdown('settings')">> </button>
            </div>
            <div id="settings"  class="dropdown-content">
                <div class="dropdown">
                    <img src="../IMAGES/settings.png" alt="Settings">
                    <h5>Settings</h5>
                    <button class="dropdown-button" onclick="toggleDropdown('recommendation')">> </button>
                </div>
                <div id="recommendation" class="dropdown-content">
                    <h5>RECOMMENDATION & REMINDERS</h5>
                    <p>Keep this on to receive offer recommendations & timely reminders based on your interests.</p>
                    <div class="toggle-switch">
                        <label>SMS</label>
                        <input type="checkbox" id="smsToggle" name="smsToggle">
                    </div>
                    <div class="toggle-switch">
                        <label>Whatsapp</label>
                        <input type="checkbox" id="whatsappToggle" name="whatsappToggle">
                    </div>
                    <h4>Account Deletion</h4>
                    <a href="#popupform" onclick="openPopup()">Delete Account</a>
                    
                    <div id="overlay"></div>

    <div id="popupForm">
        <span class="close-btn" onclick="closePopup()">X</span>
        <form method="POST">
            <h4 id="reason" style="display: block;">Reason for deleting account:</h4>
            
            <select id="reason" name="reason" style="padding: 10px;">
                <option value="privacy">Privacy concerns</option>
                <option value="Hign_price">Hign Price</option>
                <option value="found_alternative">Found Alternative</option>
                <option value="slow_delivery">Slow Delivery</option>
                <option value="other">Other</option>
            </select>
            <br><br>
            <button type="submit" name="action" value="delete" class="submit">Submit</button>
        </form>
    </div>
    <%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String action = request.getParameter("action");

        if ("insert".equals(action)) {
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
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

                // Combine address fields into one string
                String fullAddress = name + "- " + hno + ", " + landmark + ", " + city + ", " + state + ", " + pincode + " - " + mobile + ", " + altPhone;

                // Insert into addresses
                String sqlAddress = "INSERT INTO addresses (mobile, address) VALUES (?, ?)";
                pstmt = conn.prepareStatement(sqlAddress);
                pstmt.setString(1, mobile);
                pstmt.setString(2, fullAddress);

                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<script>alert('Address inserted successfully.');</script>");
                } else {
                    out.println("<script>alert('Failed to insert address details.');</script>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<script>alert('Database error occurred.');</script>");
            } finally {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        } else if ("delete".equals(action)) {
            // Delete User
            String mobile = null;

            // Retrieve mobile number from cookies
            Cookie[] userCookies = request.getCookies();
            if (userCookies != null) {
                for (Cookie cookie : userCookies) {
                    if ("mobileNumber".equals(cookie.getName())) {
                        mobile = cookie.getValue();
                        break;
                    }
                }
            }

            if (mobile != null) {
                PreparedStatement pstmt = null;
                try {
                    conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                    String deleteOrders = "DELETE FROM orders WHERE mobile = ?";
                    pstmt = conn.prepareStatement(deleteOrders);
                    pstmt.setString(1, mobile);
                    pstmt.executeUpdate();
                    pstmt.close();

                    // Delete addresses
                    String deleteAddresses = "DELETE FROM addresses WHERE mobile = ?";
                    pstmt = conn.prepareStatement(deleteAddresses);
                    pstmt.setString(1, mobile);
                    pstmt.executeUpdate();
                    pstmt.close();

                    // Delete user
                    String deleteUser = "DELETE FROM users WHERE mobile = ?";
                    pstmt = conn.prepareStatement(deleteUser);
                    pstmt.setString(1, mobile);
                    pstmt.executeUpdate();

                    out.println("<script>alert('Account deleted successfully!'); window.location.href='LOGIN-PAGE.jsp';</script>");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<script>alert('Error occurred while deleting account: " + e.getMessage() + "');</script>");
                } finally {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            } else {
                out.println("<script>alert('Mobile number not found in cookies.');</script>");
            }
        }
    }
%>

    
                </div>
            </div>
        </div>
        
        <hr>
        <div class="dropdown">
            <div style="display:inline">
                <h5>My Address</h5>
                <p>Share, Edit & Add New Address</p>
            </div>
            
            <button class="dropdown-button" onclick="toggleDropdown('addresses')">> </button>
        </div>
        <div id="addresses" class="dropdown-content">
            <h5>SAVED ADDRESSES</h5>
            <%
                if (mobileNumber != null) {
                    try {
                        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                        String addressQuery = "SELECT address FROM addresses WHERE mobile = ?";
                        stmt = conn.prepareStatement(addressQuery);
                        stmt.setString(1, mobileNumber);
                        rs = stmt.executeQuery();
                        while (rs.next()) {
            %>
            <p><%= rs.getString("address") %></p>
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
                                    <label for="mobile">Registered Number<span class="required">*</span></label>
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
                
                            <button type="submit" name="action" value="insert" class="submit-btn">Submit</button>
                        </form>
                    </div>
                </div>
                
    
            
        </div>
        <hr>
        <div class="dropdown">
            <h5>Past Orders</h5>
            <button class="dropdown-button" onclick="toggleDropdown('orders')">> </button>
        </div>
        <div id="orders" class="dropdown-content">
            <%
        if (mobileNumber != null) {
            try {
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                String orderQuery = "SELECT * FROM orders WHERE mobile = ?";
                stmt = conn.prepareStatement(orderQuery);
                stmt.setString(1, mobileNumber);
                rs = stmt.executeQuery();
                
                boolean hasOrders = false;  // Flag to check if there are any orders
                
                while (rs.next()) {
                    hasOrders = true;  // If an order is found, set the flag to true
    %>
                    <p>Order ID: <%= rs.getString("order_id") %></p>
    <%
                }
    
                if (!hasOrders) {  // If no orders were found, display the no-order image
    %>
                    <img src="../IMAGES/no-order.gif" alt="No Orders Available" style="width: 100%; max-width: 300px; display: block; margin: auto;">
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
        }
    %>
        </div>
        <hr>

        <div class="logout-section">
            <button class="edit-btn" id="logout-btn">Logout</button>
            <p>Version 1.0.1.0</p>
        </div>
    </div>
    
    <script>
        function toggleDropdown(id) {
            var content = document.getElementById(id);
            if (content.style.display === "block") {
                content.style.display = "none";
            } else {
                content.style.display = "block";
            }
        }
    </script>
    <script>
        document.getElementById('logout-btn').addEventListener('click', function () {
            document.cookie = 'mobileNumber=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
            sessionStorage.clear();
            window.location.href = 'LOgin-PAGE.jsp';
        });
        function openPopup() {
            document.getElementById('popup').style.display = 'flex';
        }
    
        function closePopup() {
            document.getElementById('popup').style.display = 'none';
        }
    
        document.getElementById("otherReason").addEventListener("change", function() {
            document.getElementById("otherReasonText").style.display = this.checked ? "inline" : "none";
        });
    
    </script>


<div id="loader">
    <dotlottie-player 
      src="https://lottie.host/76e1a32b-5f01-4e9e-aa08-f65f681debce/f44K9vVYhr.lottie" 
      background="transparent" 
      speed="1" 
      style="width: 300px; height: 300px" 
      loop autoplay>
    </dotlottie-player>
  </div>
  

<footer>
    <div class="last">
        <div>
            <img src="../IMAGES/black-logo.png" alt="Company Logo" style="height: 50px;">
        </div>
        <div>
            <ul style="list-style-type: none; margin: 0; padding: 0;">
                <li><a href="ABOUT.html" style="color: #fff; text-decoration: none;">About Us</a></li>
                <li><a href="mailto:samavikyath06394@gmail.com.com" style="color: #fff; text-decoration: none;">Contact Us</a></li>
                <li><a href="#privacy-policy" style="color: #fff; text-decoration: none;">Privacy Policy</a></li>
                <li><a href="#terms-of-service" style="color: #fff; text-decoration: none;">Terms of Service</a></li>
            </ul>
        </div>
    </div>
    <div class="footer">
        <p><div class="top-left">Crafted With  &#10084;&#65039;</div>
            <div class="center">&</div>
            <div class="bottom-right">Passion</div></p>
      </div>
    
    <div style="text-align: center; margin-top: 20px;">
        <p>&copy; 2024 Friend's Eateria. All rights reserved.</p>
    </div>
</footer>

<script src="../JS/LOADER.js"></script>
<script>
   
   function openPopup() {
            document.getElementById('popupForm').style.display = 'block';
            document.getElementById('overlay').style.display = 'block';
        }

        function closePopup() {
            document.getElementById('popupForm').style.display = 'none';
            document.getElementById('overlay').style.display = 'none';
        }
        function openpop() {
            document.getElementById('popup').style.display = 'block';
            document.getElementById('overlay').style.display = 'block';
        }

        function closepop() {
            document.getElementById('popup').style.display = 'none';
            document.getElementById('overlay').style.display = 'none';
        }
</script>
</body>
</html>
