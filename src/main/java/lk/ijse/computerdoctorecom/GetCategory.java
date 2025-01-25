package lk.ijse.computerdoctorecom;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.computerdoctorecom.DTO.Category;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetCategory", value = "/GetCategory")
public class GetCategory extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try {
           Connection connection = dataSource.getConnection();
           PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM category");
           ResultSet resultSet = preparedStatement.executeQuery();
           List<Category> categoryList = new ArrayList<>();

           while (resultSet.next()) {
               String name = resultSet.getString("name");
               String image = resultSet.getString("image");
               categoryList.add(new Category(name,image));
               System.out.println(name+" "+image);
           }
           req.getServletContext().setAttribute("categoryCard", categoryList);
           System.out.println( categoryList);
           connection.close();
       } catch (Exception e) {
           e.printStackTrace();
       }
    }
}

/*
Connection connection = null;
        try{
connection = dataSource.getConnection();
ResultSet resultSet = connection.prepareStatement("SELECT * FROM products").executeQuery();
List<ProductCard> productcards = new ArrayList<>();

            while (resultSet.next()){
        productcards.add(new ProductCard(
        resultSet.getInt("product_id"),
                        resultSet.getString("product_image"),
                        resultSet.getString("product_name"),
                        resultSet.getString("product_description"),
                        resultSet.getDouble("product_price"),
                        resultSet.getInt("product_qty")
                ));
                        }

                        req.setAttribute("productList", productcards);
User user = (User) req.getServletContext().getAttribute("user");
            if (user.getRole().equals("admin")) {
        req.getRequestDispatcher("product.jsp").forward(req, resp);
            }
                    req.getRequestDispatcher("user.jsp").forward(req, resp);

            connection.close();
        }catch (Exception e){
        throw new RuntimeException(e);
        }
                }*/
