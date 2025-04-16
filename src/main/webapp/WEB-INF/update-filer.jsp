<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.taxfiling.model.TaxFiler" %>
<%
  TaxFiler filer = (TaxFiler) request.getAttribute("filer");
%>

<!DOCTYPE html>
<html>
<head>
  <title>Update Tax Filer</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(to right, #e3f2fd, #ffffff);
      animation: fadeIn 0.8s ease-in;
    }
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(30px); }
      to { opacity: 1; transform: translateY(0); }
    }
    .form-container {
      max-width: 600px;
      background: white;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 6px 20px rgba(0,0,0,0.1);
      margin-top: 50px;
    }
    .form-icon {
      font-size: 1.2rem;
      margin-right: 8px;
    }
  </style>
</head>
<body>
  <div class="container d-flex justify-content-center">
    <div class="form-container">

      <h3 class="text-center mb-4 text-primary">
        <i class="fa-solid fa-user-edit"></i> Update Tax Filer
      </h3>

      <form action="TaxFilerServlet" method="post">
        <input type="hidden" name="filerID" value="<%= filer.getFilerID() %>">

        <div class="mb-3">
          <label class="form-label">
            <i class="fa-solid fa-user form-icon text-secondary"></i> Name
          </label>
          <input type="text" name="name" class="form-control" value="<%= filer.getName() %>" required>
        </div>

        <div class="mb-3">
          <label class="form-label">
            <i class="fa-solid fa-phone form-icon text-secondary"></i> Contact
          </label>
          <input type="text" name="contact" class="form-control" value="<%= filer.getContact() %>" required>
        </div>

        <div class="mb-3">
          <label class="form-label">
            <i class="fa-solid fa-money-bill-wave form-icon text-secondary"></i> Annual Income
          </label>
          <input type="number" step="0.01" name="annualIncome" class="form-control" value="<%= filer.getAnnualIncome() %>" required>
        </div>

        <div class="mb-3">
          <label class="form-label">
            <i class="fa-solid fa-receipt form-icon text-secondary"></i> Expenses
          </label>
          <input type="number" step="0.01" name="expenses" class="form-control" value="<%= filer.getExpenses() %>" required>
        </div>

        <div class="mb-3">
          <label class="form-label">
            <i class="fa-solid fa-calendar-year form-icon text-secondary"></i> Tax Year
          </label>
          <input type="number" name="taxYear" class="form-control" value="<%= filer.getTaxYear() %>" required>
        </div>

        <div class="d-grid gap-2">
          <button type="submit" class="btn btn-primary">
            <i class="fa-solid fa-save"></i> Update Filer
          </button>
          <a href="TaxFilerServlet" class="btn btn-secondary">
            <i class="fa-solid fa-arrow-left"></i> Cancel
          </a>
        </div>
      </form>
    </div>
  </div>
</body>
</html>