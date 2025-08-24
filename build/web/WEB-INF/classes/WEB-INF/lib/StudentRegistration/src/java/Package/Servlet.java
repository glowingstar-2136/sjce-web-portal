



package Package;

import java.sql.*;

public class Servlet {

    private static final String URL = "jdbc:mysql://localhost:3306/registration_form";
    private static final String USER = "root";
    private static final String PASSWORD = "admin";
    private static final String DRIVER_CLASS = "com.mysql.jdbc.Driver";

    private Connection con;
    private Statement st;
    private ResultSet rs;

    // Constructor to initialize DB connection
    public Servlet() {
        try {
            Class.forName(DRIVER_CLASS);
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            st = con.createStatement();
        } catch (Exception e) {
            System.out.println("DB Connection Error: " + e.getMessage());
        }
    }

    // Static method to get a new connection
    public static Connection getConnection() {
        try {
            Class.forName(DRIVER_CLASS);
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            System.out.println("getConnection() Error: " + e.getMessage());
            return null;
        }
    }

    // SELECT query
    public ResultSet select(String query) {
        try {
            rs = st.executeQuery(query);
        } catch (SQLException ex) {
            System.out.println("Select Query Error: " + ex.getMessage());
        }
        return rs;
    }

    // INSERT query
    public int insert(String query) {
        int result = 0;
        try {
            result = st.executeUpdate(query);
        } catch (SQLException ex) {
            System.out.println("Insert Query Error: " + ex.getMessage());
        }
        return result;
    }

    // UPDATE query
    public int update(String query) {
        int result = 0;
        try {
            result = st.executeUpdate(query);
        } catch (SQLException ex) {
            System.out.println("Update Query Error: " + ex.getMessage());
        }
        return result;
    }

    // DELETE query
    public int delete(String query) {
        int result = 0;
        try {
            result = st.executeUpdate(query);
        } catch (SQLException ex) {
            System.out.println("Delete Query Error: " + ex.getMessage());
        }
        return result;
    }

    // Close all resources
    public void close() {
        try {
            if (rs != null) rs.close();
            if (st != null) st.close();
            if (con != null) con.close();
        } catch (SQLException ex) {
            System.out.println("Close Error: " + ex.getMessage());
        }
    }
}
