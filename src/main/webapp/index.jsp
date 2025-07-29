<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management System</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #f8f9fa, #e9ecef);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .form-container {
            max-width: 600px;
            margin: 60px auto;
            padding: 40px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            text-align: center;
            font-weight: 700;
            margin-bottom: 30px;
            color: #343a40;
        }

        .btn-group .btn {
            width: 100%;
        }

        .btn + .btn {
            margin-top: 10px;
        }

        .form-control::placeholder {
            font-style: italic;
            color: #adb5bd;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="form-container">
        <h2 class="form-title">Student Management</h2>
        <form method="post" action="Login">
            <div class="mb-3">
                <label for="id" class="form-label">Student ID</label>
                <input type="number" class="form-control" id="id" name="id" placeholder="Enter ID" required>
            </div>
            <div class="mb-3">
                <label for="username" class="form-label">Name</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Enter name">
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="text" class="form-control" id="password" name="password" placeholder="Enter password">
            </div>
            <div class="mb-3">
                <label for="gender" class="form-label">Gender</label>
                <input type="text" class="form-control" id="gender" name="gender" placeholder="Enter gender">
            </div>
            <div class="mb-4">
                <label for="city" class="form-label">City</label>
                <input type="text" class="form-control" id="city" name="city" placeholder="Enter city">
            </div>

            <div class="btn-group d-grid gap-2">
                <button type="submit" class="btn btn-success" name="action" value="Save">Save</button>
                <button type="submit" class="btn btn-primary" name="action" value="Update">Update</button>
                <button type="submit" class="btn btn-danger" name="action" value="Delete">Delete</button>
                <button type="submit" class="btn btn-dark" name="action" value="Search">Search</button>
            </div>
            <p><strong>Instructions:</strong>  
- To <b>Search</b> or <b>Delete</b>, only <code>ID</code> is required.  
- To <b>Save</b> or <b>Update</b>, fill the full form.</p>
            
        </form>
    </div>
</div>

<!-- Bootstrap JS (optional for responsiveness) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
