package com.example.controller;

import com.example.model.*;
import java.util.List;

public class EmailController {
    @SuppressWarnings("unused")
	private EmailDAO emailDAO;

    public EmailController() {
        this.emailDAO = new EmailDAO();
    }

    public List<Email> getAllEmails() {
        return EmailDAO.getAllEmails();
    }

    public void addEmail(String email) {
        EmailDAO.addEmail(email);
    }

    public void deleteEmail(String email) {
        EmailDAO.deleteEmail(email);
    }
}
