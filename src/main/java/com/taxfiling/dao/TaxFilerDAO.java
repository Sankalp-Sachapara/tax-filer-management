package com.taxfiling.dao;

import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import com.taxfiling.config.DBConfig;
import com.taxfiling.model.TaxFiler;

public class TaxFilerDAO {
    JdbcTemplate template = new JdbcTemplate(DBConfig.getDataSource());

    public List<TaxFiler> getAllTaxFilers() {
        String sql = "SELECT * FROM TaxFilers";
        return template.query(sql, new BeanPropertyRowMapper<>(TaxFiler.class));
    }

    public void addTaxFiler(TaxFiler filer) {
        String sql = "INSERT INTO TaxFilers (Name, Contact, AnnualIncome, Expenses, TaxYear) VALUES (?, ?, ?, ?, ?)";
        template.update(sql, filer.getName(), filer.getContact(), filer.getAnnualIncome(), 
                         filer.getExpenses(), filer.getTaxYear());
    }

    public void updateTaxFiler(TaxFiler filer) {
        String sql = "UPDATE TaxFilers SET Name=?, Contact=?, AnnualIncome=?, Expenses=?, TaxYear=? WHERE FilerID=?";
        template.update(sql, filer.getName(), filer.getContact(), filer.getAnnualIncome(), 
                         filer.getExpenses(), filer.getTaxYear(), filer.getFilerID());
    }

    public void deleteTaxFiler(int id) {
        String sql = "DELETE FROM TaxFilers WHERE FilerID=?";
        template.update(sql, id);
    }

    @SuppressWarnings("deprecation")
    public TaxFiler getTaxFilerById(int id) {
        String sql = "SELECT * FROM TaxFilers WHERE FilerID=?";
        return template.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<>(TaxFiler.class));
    }
    
    public boolean isNameExists(String name) {
        String sql = "SELECT COUNT(*) FROM TaxFilers WHERE name = ?";
        Integer count = template.queryForObject(sql, new Object[]{name}, Integer.class);
        return count != null && count > 0;
    }

    public boolean isContactExists(String contact) {
        String sql = "SELECT COUNT(*) FROM TaxFilers WHERE contact = ?";
        Integer count = template.queryForObject(sql, new Object[]{contact}, Integer.class);
        return count != null && count > 0;
    }
}
