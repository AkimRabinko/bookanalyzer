package com.akimrabinko.bookanalyzer.analysis_module.lemma.mapper;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Correction;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.CorrectionType;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CorrectionRowMapper extends BeanPropertyRowMapper<Correction> {
    private static CorrectionRowMapper mapper = null;

    public static CorrectionRowMapper getInstance() {
        if (mapper == null) {
            mapper = new CorrectionRowMapper();
        }
        return mapper;
    }

    @Override
    public Correction mapRow(ResultSet rs, int rowNumber) throws SQLException {
        String tableName = rs.getMetaData().getTableName(1);
        return new Correction(
                rs.getInt("ID"),
                rs.getString("ORIGINAL_WORD"),
                rs.getString("LEMMA_WORD"),
                CorrectionType.getTypeByTable(tableName),
                rs.getInt("RULE_ID")
        );
    }
}
