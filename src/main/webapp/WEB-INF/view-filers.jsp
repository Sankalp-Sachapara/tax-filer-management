<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.taxfiling.model.TaxFiler" %>
<html>
<head>
  <title>View Tax Filers</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <style>
    .fade-in {
      animation: fadeIn 0.8s ease-in;
    }
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    .table-responsive {
      overflow-x: auto;
    }
    .btn-icon {
      width: 38px;
      height: 38px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      border-radius: 50%;
      margin: 0 3px;
    }
  </style>
</head>
<body class="p-4 bg-light">
  <div class="container fade-in">
    <h2 class="mb-4 text-primary"><i class="fa-solid fa-users"></i> Tax Filer Records</h2>
    <div class="d-flex justify-content-between mb-3">
      <a href="TaxFilerServlet?action=add" class="btn btn-success">
        <i class="fa-solid fa-user-plus"></i> Add New Filer
      </a>
      <a href="index.jsp" class="btn btn-secondary">
        <i class="fa-solid fa-arrow-left"></i> Back to Dashboard
      </a>
    </div>

    <div class="card shadow-sm">
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead class="table-dark">
              <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Contact</th>
                <th>Annual Income</th>
                <th>Expenses</th>
                <th>Tax Year</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <%
              @SuppressWarnings("unchecked")
              List<TaxFiler> filers = (List<TaxFiler>) request.getAttribute("filerList");
              if (filers != null && !filers.isEmpty()) {
                for(TaxFiler f : filers){
              %>
              <tr>
                <td><%= f.getFilerID() %></td>
                <td><%= f.getName() %></td>
                <td><%= f.getContact() %></td>
                <td>$<%= String.format("%.2f", f.getAnnualIncome()) %></td>
                <td>$<%= String.format("%.2f", f.getExpenses()) %></td>
                <td><%= f.getTaxYear() %></td>
                <td>
                  <a href="TaxFilerServlet?action=edit&id=<%= f.getFilerID() %>" class="btn btn-primary btn-icon" title="Edit">
                    <i class="fa-solid fa-pen-to-square"></i>
                  </a>
                  <a href="TaxFilerServlet?action=delete&id=<%= f.getFilerID() %>" class="btn btn-danger btn-icon" 
                     onclick="return confirm('Are you sure you want to delete this filer?')" title="Delete">
                    <i class="fa-solid fa-trash"></i>
                  </a>
                </td>
              </tr>
              <%
                }
              } else {
              %>
              <tr>
                <td colspan="7" class="text-center text-muted py-4">
                  <i class="fas fa-info-circle me-2"></i> No tax filer records found.
                </td>
              </tr>
              <% } %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</body>
</html>