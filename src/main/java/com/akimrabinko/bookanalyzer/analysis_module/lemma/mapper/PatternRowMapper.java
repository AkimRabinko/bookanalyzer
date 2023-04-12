package com.akimrabinko.bookanalyzer.analysis_module.lemma.mapper;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Pattern;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PatternRowMapper extends BeanPropertyRowMapper<Pattern> {

    private static PatternRowMapper mapper = null;

    public static PatternRowMapper getInstance() {
        if (mapper == null) {
            mapper = new PatternRowMapper();
        }
        return mapper;
    }

    @Override
    public Pattern mapRow(ResultSet rs, int rowNumber) throws SQLException {
        return new Pattern(
                rs.getInt("ID"),
                rs.getString("ORIGINAL_WORD_PATTERN"),
                rs.getString("LEMMA_WORD_PATTERN"));
    }

}
