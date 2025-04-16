package com.taxfiling.controller;

import com.taxfiling.dao.TaxFilerDAO;
import com.taxfiling.model.TaxFiler;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class TaxFilerServlet extends HttpServlet {
    TaxFilerDAO dao = new TaxFilerDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            TaxFiler filer = dao.getTaxFilerById(id);
            request.setAttribute("filer", filer);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/update-filer.jsp");
            rd.forward(request, response);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteTaxFiler(id);
            response.sendRedirect("TaxFilerServlet");
        } else if ("add".equals(action)) {
            RequestDispatcher rd = request.getRequestDispatcher("add-filer.jsp");
            rd.forward(request, response);
        } else {
            List<TaxFiler> list = dao.getAllTaxFilers();
            request.setAttribute("filerList", list);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view-filers.jsp");
            rd.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        double annualIncome = Double.parseDouble(request.getParameter("annualIncome"));
        double expenses = Double.parseDouble(request.getParameter("expenses"));
        int taxYear = Integer.parseInt(request.getParameter("taxYear"));
        String filerID = request.getParameter("filerID");

        TaxFiler filer = new TaxFiler();
        filer.setName(name);
        filer.setContact(contact);
        filer.setAnnualIncome(annualIncome);
        filer.setExpenses(expenses);
        filer.setTaxYear(taxYear);

        if (filerID == null || filerID.isEmpty()) {
            // Only check duplicates when adding a new filer
            if (dao.isNameExists(name)) {
                request.setAttribute("error", "Filer Name Already Exists.");
                request.setAttribute("filer", filer);
                request.getRequestDispatcher("add-filer.jsp").forward(request, response);
                return;
            }
            if (dao.isContactExists(contact)) {
                request.setAttribute("error", "Contact Already Exists.");
                request.setAttribute("filer", filer);
                request.getRequestDispatcher("add-filer.jsp").forward(request, response);
                return;
            }
            dao.addTaxFiler(filer);
        } else {
            filer.setFilerID(Integer.parseInt(filerID));
            dao.updateTaxFiler(filer);
        }

        response.sendRedirect("TaxFilerServlet");
    }
}