<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Expired Memberships</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

    <!-- ✅ CSS Added -->
    <style>
        body {
            background-color: #f5f7fa;
            font-family: 'Segoe UI', Tahoma, sans-serif;
        }

        .container {
            max-width: 1000px;
        }

        h2 {
            font-weight: 700;
            color: #d9534f !important; /* strong red */
            letter-spacing: 1px;
        }

        /* Back Button */
        .btn-secondary {
            margin-bottom: 15px;
            border-radius: 6px;
            padding: 10px 20px;
            font-weight: 500;
        }

        /* Table Styling */
        table {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        thead.table-dark th {
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 15px;
        }

        td, th {
            vertical-align: middle;
            padding: 12px !important;
            font-size: 15px;
        }

        /* Expired Row Style */
        tr.table-danger {
            background-color: #f8d7da !important;
        }

        tr.table-danger:hover {
            background-color: #f5c6cb !important;
            transition: 0.2s;
        }
    </style>
</head>

<body class="bg-light">

<div class="container mt-4">

    <h2 class="text-center mb-4 text-danger">Expired Members</h2>

    <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">Back</a>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Membership Type</th>
            <th>Amount</th>
            <th>Expiry Date</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="m" items="${expired}">
            <tr class="table-danger">
                <td>${m.id}</td>
                <td>${m.name}</td>
                <td>${m.membershipType}</td>
                <td>${m.amount}</td>
                <td>${m.expiryDate}</td>
            </tr>
        </c:forEach>
        </tbody>

    </table>

</div>

</body>
</html>
