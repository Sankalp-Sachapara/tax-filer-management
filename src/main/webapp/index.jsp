<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Tax Filers Management System</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .dashboard {
      background: white;
      border-radius: 20px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
      padding: 40px;
      max-width: 800px;
      width: 100%;
      text-align: center;
    }
    .logo {
      font-size: 3rem;
      color: #3B71CA;
      margin-bottom: 10px;
    }
    .card {
      transition: all 0.3s ease;
      margin-bottom: 20px;
      border: none;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    }
    .card:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 25px rgba(0,0,0,0.1);
    }
    .card-icon {
      font-size: 2rem;
      margin-bottom: 15px;
      color: #3B71CA;
    }
    .btn-main {
      background: #3B71CA;
      border: none;
      padding: 10px 20px;
      border-radius: 50px;
      font-weight: 600;
      transition: all 0.3s ease;
    }
    .btn-main:hover {
      background: #2C62B4;
      transform: scale(1.05);
    }
    .animate-in {
      animation: fadeIn 1s ease-in-out;
    }
    @keyframes fadeIn {
      0% { opacity: 0; transform: translateY(20px); }
      100% { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="dashboard animate-in">
      <div class="logo">
        <i class="fas fa-file-invoice-dollar"></i>
      </div>
      <h1 class="display-5 mb-4">Tax Filers Management System</h1>
      <p class="lead mb-5">Manage tax filer records efficiently with our comprehensive management system.</p>

      <div class="row">
        <div class="col-md-6">
          <div class="card h-100">
            <div class="card-body">
              <div class="card-icon">
                <i class="fas fa-users"></i>
              </div>
              <h3 class="card-title">View Filers</h3>
              <p class="card-text">Access and manage all tax filer records in the system.</p>
              <a href="TaxFilerServlet" class="btn btn-main">
                <i class="fas fa-arrow-right"></i> Go to Records
              </a>
            </div>
          </div>
        </div>
        
        <div class="col-md-6">
          <div class="card h-100">
            <div class="card-body">
              <div class="card-icon">
                <i class="fas fa-user-plus"></i>
              </div>
              <h3 class="card-title">Add New Filer</h3>
              <p class="card-text">Register a new tax filer to the system quickly.</p>
              <a href="TaxFilerServlet?action=add" class="btn btn-main">
                <i class="fas fa-plus"></i> Add Filer
              </a>
            </div>
          </div>
        </div>
      </div>
      
      <p class="mt-5 text-muted">
        &copy; 2025 Tax Filers Management System. All rights reserved.
      </p>
    </div>
  </div>
</body>
</html>