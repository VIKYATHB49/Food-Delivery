<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="../CSS/LOGIN-PAGE.css">
</head>
<body>
    <%
    // Initialize error message variable
    String errorMessage = null;

    // Check if form is submitted
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Database connection details
        final String DB_URL = "jdbc:mysql://db:3306/food_delivery";
        final String DB_USER = "user";
        final String DB_PASSWORD = "password";

        // Get user input
        String number = request.getParameter("number");
        String password = request.getParameter("password");

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to database
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Query to check if user exists with given credentials
            String sql = "SELECT * FROM users WHERE mobile = ? AND password = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, number);
            preparedStatement.setString(2, password);

            // Execute query
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Clear existing cookies
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("mobileNumber")) {
                            cookie.setMaxAge(0); // Delete existing cookie
                            response.addCookie(cookie);
                        }
                    }
                }

                // Create new cookie for the current user
                Cookie userCookie = new Cookie("mobileNumber", number);
                userCookie.setMaxAge(60 * 60 * 24); // 1 day
                userCookie.setPath("/");

                // Add cookie to response
                response.addCookie(userCookie);

                // Redirect to HOME.html
                response.sendRedirect("HOME.html");
            } else {
                errorMessage = "No user found. Please check your credentials.";
            }

        } catch (ClassNotFoundException e) {
            errorMessage = "Error: Unable to load database driver.";
            e.printStackTrace();
        } catch (SQLException e) {
            errorMessage = "Error: Unable to connect to the database or execute query.";
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>



    <table align="center">
        <tr>
            <td>
                <img src="../IMAGES/registration-photo.png" alt="login" class="login">
            </td>
            <td>
                <form method="post">
                    <div class="center">
                        <img src="../IMAGES/LOGO.png" alt="logo" class="logo">
                        <p><b>LOGIN</b></p>
                    </div>
                    <label for="number"><b>Your Mobile Number</b></label>
                    <div class="icons">
                        <img src="../IMAGES/user.png" class="icon" alt="user-icon">
                        <input type="text" id="number" placeholder="Mobile Number" class="input" name="number" autocomplete="off" required maxlength="10" pattern="\d{10}">
                    </div>

                    <label for="password"><b>Password</b></label>
                    <div class="icons">
                        <img src="../IMAGES/key.png" class="icon" alt="password-icon">
                        <input type="password" placeholder="Password" id="password" name="password" class="input" autocomplete="off" required>
                    </div>

                    <input type="checkbox" class="checkbox" onclick="Visibility()"><b>Show Password</b>

                    <a href="#" style="float: right; margin-right: 15px; padding: 5px;">Forgot Password?</a><br>

                    <p style="text-align: center;">Don't have an account? <a href="REGISTRATION.jsp">Sign up</a></p>
                    <input type="submit" class="sign-in" value="Sign in">

                    <% if (errorMessage != null) { %>
                        <p style="color: red; text-align: center; margin-top: 10px;"><%= errorMessage %></p>
                    <% } %>
                </form>
            </td>
        </tr>
    </table>
    <script>
        function Visibility() {
            const passwordInput = document.getElementById('password');
            passwordInput.type = passwordInput.type === 'password' ? 'text' : 'password';
        }
    </script>
</body>
</html>
