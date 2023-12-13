package com.example.model;

import com.example.*;
import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmailDAO implements Serializable{
    
	private static final long serialVersionUID = 1L;

	public static List<Email> getAllEmails() {
        List<Email> emails = new ArrayList<>();
        try {
            Connection connection = DBUtil.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM emails");

            while (resultSet.next()) {
                String email = resultSet.getString("email");
                emails.add(new Email(email));
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return emails;
    }

    public static void addEmail(String email) {
        if (!EmailExists(email)) {
            try {
                Connection connection = DBUtil.getConnection();
                connection.setAutoCommit(false);
                PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO emails (email) VALUES (?)");
                preparedStatement.setString(1, email);
                preparedStatement.executeUpdate();
                preparedStatement.close();
                connection.commit();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            
            System.out.println("Email already exists!");
        }
    }

    public static void deleteEmail(String email) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM emails WHERE email = ?");
            preparedStatement.setString(1, email);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static boolean EmailExists(String email) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM emails WHERE email = ?");
            preparedStatement.setString(1, email);
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
}
