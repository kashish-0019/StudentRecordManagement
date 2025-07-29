<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.eschool.entity.Student" %>
<%
    HttpSession sessionObj = request.getSession(false);
    Student s = null;
    if (sessionObj != null) {
        s = (Student) sessionObj.getAttribute("student");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Records</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light p-5">
    <div class="container">
        <h2 class="text-center mb-4">All Records</h2>
        <%
            if (s != null) {
        %>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Gender</th>
                    <th>City</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%= s.getId() %></td>
                    <td><%= s.getUsername() %></td>
                    <td><%= s.getEmail() %></td>
                    <td><%= s.getPassword() %></td>
                    <td><%= s.getGender() %></td>
                    <td><%= s.getCity() %></td>
                </tr>
            </tbody>
        </table>
        <div class="text-center mt-4">
            <a href="index.jsp" class="btn btn-primary">Back to Form</a>
        </div>
        <%
            } else {
        %>
        <p class="text-danger text-center">No student data found.</p>
        <div class="text-center">
            <a href="index.jsp" class="btn btn-secondary">Back</a>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>
