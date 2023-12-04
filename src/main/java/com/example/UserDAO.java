// UserDAO.java
package com.example;

import java.io.Serializable;
import java.sql.*;

public class UserDAO implements Serializable {

    private static final long serialVersionUID = 1L;

    public static boolean validateUser(String username, String password) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "SELECT * FROM users WHERE username = ? AND password = ?");
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            boolean isValid = resultSet.next();

            resultSet.close();
            preparedStatement.close();

            return isValid;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean userExists(String username) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "SELECT * FROM users WHERE username = ?");
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();

            boolean exists = resultSet.next();

            resultSet.close();
            preparedStatement.close();

            return exists;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void addUser(User user) {
        if (!userExists(user.getUsername())) {
            try {
                Connection connection = DBUtil.getConnection();
                connection.setAutoCommit(false);

                PreparedStatement preparedStatement = connection.prepareStatement(
                        "INSERT INTO users (first_name, last_name, username, password, phone_number) VALUES (?, ?, ?, ?, ?)");

                preparedStatement.setString(1, user.getFirstName());
                preparedStatement.setString(2, user.getLastName());
                preparedStatement.setString(3, user.getUsername());
                preparedStatement.setString(4, user.getPassword());
                preparedStatement.setString(5, user.getPhoneNumber());

                preparedStatement.executeUpdate();
                preparedStatement.close();
                connection.commit();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("User already exists!");
        }
    }
}
