package com.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static Connection connection;

    public static Connection getConnection() {
        return connection;
    }

    public static void init() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/email_manager","root","26171451");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
