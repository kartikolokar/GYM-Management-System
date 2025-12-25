<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Member</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

    <!-- ✅ CSS Added -->
    <style>
        body {
            background-color: #f5f7fa;
            font-family: 'Segoe UI', Tahoma, sans-serif;
        }

        .container {
            max-width: 550px;
        }

        h2 {
            font-weight: 700;
            color: #333;
            letter-spacing: 1px;
        }

        /* Form Card */
        form {
            border-radius: 10px;
            padding: 25px !important;
            background: #ffffff;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
        }

        .form-label {
            font-weight: 500;
            color: #444;
        }

        .form-control,
        .form-select {
            height: 45px;
            border-radius: 6px;
        }

        .form-control:focus,
        .form-select:focus {
            border-color: #0d6efd;
            box-shadow: 0 0 6px rgba(13,110,253, 0.4);
        }

        .btn-primary {
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: 500;
        }

        .btn-secondary {
            padding: 10px 20px;
            margin-left: 10px;
            border-radius: 6px;
        }

        .text-danger {
            font-size: 14px;
            margin-top: 4px;
        }
    </style>
</head>

<body class="bg-light">

<div class="container mt-4">

    <h2 class="text-center mb-4">Edit Member</h2>

    <!-- Spring Form -->
    <form:form action="${pageContext.request.contextPath}/update"
               method="post"
               modelAttribute="member"
               cssClass="border p-4 bg-white shadow">

        <form:hidden path="id"/>

        <div class="mb-3">
            <label class="form-label">Name</label>
            <form:input path="name" cssClass="form-control"/>
            <form:errors path="name" cssClass="text-danger"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Membership Type</label>
            <form:select path="membershipType" cssClass="form-select">
                <form:option value="">-- Select --</form:option>
                <form:option value="Monthly">Monthly</form:option>
                <form:option value="Quarterly">Quarterly</form:option>
                <form:option value="Yearly">Yearly</form:option>
            </form:select>
            <form:errors path="membershipType" cssClass="text-danger"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Amount</label>
            <form:input path="amount" type="number" cssClass="form-control"/>
            <form:errors path="amount" cssClass="text-danger"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Expiry Date</label>
            <form:input path="expiryDate" type="date" cssClass="form-control"/>
            <form:errors path="expiryDate" cssClass="text-danger"/>
        </div>

        <button class="btn btn-primary">Update Member</button>
        <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">Back</a>

    </form:form>

</div>
</body>
</html>
