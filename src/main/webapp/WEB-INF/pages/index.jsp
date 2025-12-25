<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Gym Members</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

    <!-- Your Custom CSS -->
    <style>
        body {
            background-color: #f4f6f9;
        }

        h2 {
            font-weight: 600;
            color: #333;
        }

        .btn-success {
            font-weight: bold;
            padding: 8px 18px;
        }

        .btn-danger {
            font-weight: bold;
            padding: 8px 18px;
        }

        .table {
            border-radius: 10px;
            overflow: hidden;
            background: white;
        }

        .table thead {
            background-color: #343a40; /* dark header */
            color: white;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
            transition: 0.2s;
        }

        .btn-sm {
            padding: 5px 10px;
            font-size: 13px;
            border-radius: 5px;
        }
    </style>
</head>

<body class="bg-light">

<div class="container mt-4">

    <h2 class="text-center mb-4">Gym Members List</h2>

    <a href="add" class="btn btn-success mb-3">+ Add New Member</a>
    <a href="expired" class="btn btn-danger mb-3 float-end">Expired Memberships</a>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Membership Type</th>
                <th>Amount</th>
                <th>Expiry Date</th>
                <th>Actions</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="m" items="${members}">
                <tr>
                    <td>${m.id}</td>
                    <td>${m.name}</td>
                    <td>${m.membershipType}</td>
                    <td>${m.amount}</td>
                    <td>${m.expiryDate}</td>
                    <td>
                        <a href="edit/${m.id}" class="btn btn-primary btn-sm">Edit</a>
                        <a href="delete/${m.id}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>

    </table>

</div>

</body>
</html>
