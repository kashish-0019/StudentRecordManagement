package com.eschool.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.eschool.db.DBHandler;
import com.eschool.entity.Student;

import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        DBHandler db = new DBHandler();

        String message = "";

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            if ("Save".equals(action)) {
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String gender = request.getParameter("gender");
                String city = request.getParameter("city");

                Student s = new Student(id, username, email, password, gender, city);
                db.save(s);
                message = "Student saved successfully.";
                response.sendRedirect("index.jsp?msg=" + java.net.URLEncoder.encode(message, "UTF-8"));

            } else if ("Update".equals(action)) {
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String gender = request.getParameter("gender");
                String city = request.getParameter("city");

                Student s = new Student(id, username, email, password, gender, city);
                db.update(s);
                message = "Student updated successfully.";
                response.sendRedirect("index.jsp?msg=" + java.net.URLEncoder.encode(message, "UTF-8"));

            } else if ("Delete".equals(action)) {
                db.delete(id);
                message = "Student deleted successfully.";
                response.sendRedirect("index.jsp?msg=" + java.net.URLEncoder.encode(message, "UTF-8"));

            } else if ("Search".equals(action)) {
                Student s = db.getStudent(id);
                if (s != null) {
                    // Store student in session
                    HttpSession session = request.getSession();
                    session.setAttribute("student", s);
                    response.sendRedirect("result.jsp");
                } else {
                    response.sendRedirect("index.jsp?msg=" + java.net.URLEncoder.encode("Student not found.", "UTF-8"));
                }
            }

        } catch (NumberFormatException e) {
            message = "Invalid ID format.";
            response.sendRedirect("index.jsp?msg=" + java.net.URLEncoder.encode(message, "UTF-8"));
        } catch (Exception e) {
            message = "Operation failed: " + e.getMessage();
            response.sendRedirect("index.jsp?msg=" + java.net.URLEncoder.encode(message, "UTF-8"));
        }
    }
}
