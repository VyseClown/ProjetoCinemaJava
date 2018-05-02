/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import java.sql.*;

/**
 *
 * @author anapaula
 */
public class ConnectionFactory {
    public static Connection getConnection() throws SQLException{
        try{
            Class.forName("com.mysql.jdbc.Driver");
                                                                        //://localhost:8080/phpmyadmin/cinema
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");
            return  con;
        }
        catch(ClassNotFoundException ex){
            throw new SQLException(ex.getMessage());
        }
        
    }
}
