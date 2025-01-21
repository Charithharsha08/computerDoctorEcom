package lk.ijse.computerdoctorecom;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.sql.DataSource;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "SignInServlet", value = "/sign-in")
public class SignInServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM user WHERE email=?");
            preparedStatement.setString(1, email);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String storedPassword = resultSet.getString("password");
                String name = resultSet.getString("name");
                String emailFromDB = resultSet.getString("email");
                String type = resultSet.getString("type");

                if (BCrypt.checkpw(password, storedPassword)) {
                        // Redirect with name, email, and encrypted password as parameters
                        String encryptedPassword = new BCryptPasswordEncoder().encode(password);
                        resp.sendRedirect("index.jsp?name=" + URLEncoder.encode(name, "UTF-8")
                                + "&email=" + URLEncoder.encode(emailFromDB, "UTF-8")
                                + "&password=" + URLEncoder.encode(encryptedPassword, "UTF-8")
                                + "&type=" + URLEncoder.encode(type, "UTF-8")
                                + "&login=Login Successful!");
                } else {
                    resp.sendRedirect("index.jsp?error=Login Failed!");
                }
            } else {
                resp.sendRedirect("index.jsp?error=Login Failed!");
            }
        } catch (Exception e) {
            resp.getWriter().print(e.getMessage());
            throw new RuntimeException(e);
        }
    }

    }

