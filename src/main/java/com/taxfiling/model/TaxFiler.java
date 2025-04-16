package com.taxfiling.model;

public class TaxFiler {
    private int filerID;
    private String name;
    private String contact;
    private double annualIncome;
    private double expenses;
    private int taxYear;

    // Getters & Setters
    public int getFilerID() { return filerID; }
    public void setFilerID(int filerID) { this.filerID = filerID; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }

    public double getAnnualIncome() { return annualIncome; }
    public void setAnnualIncome(double annualIncome) { this.annualIncome = annualIncome; }

    public double getExpenses() { return expenses; }
    public void setExpenses(double expenses) { this.expenses = expenses; }

    public int getTaxYear() { return taxYear; }
    public void setTaxYear(int taxYear) { this.taxYear = taxYear; }
}