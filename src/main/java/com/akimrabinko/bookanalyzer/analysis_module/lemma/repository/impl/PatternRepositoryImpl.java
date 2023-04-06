package com.akimrabinko.bookanalyzer.analysis_module.lemma.repository.impl;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Pattern;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.repository.PatternRepository;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.akimrabinko.bookanalyzer.analysis_module.lemma.utils.SqlUtils.createTableReference;
import static com.akimrabinko.bookanalyzer.analysis_module.lemma.utils.SqlUtils.isSaved;

@Repository
public class PatternRepositoryImpl implements PatternRepository {
    private static final String PATTERN_TABLE = "rules";

    private final JdbcTemplate jdbcTemplate;

    public PatternRepositoryImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Pattern> getAllPatterns(String schemaSuffix) {
        String tableRef = createTableReference(schemaSuffix, PATTERN_TABLE);
        return jdbcTemplate.query("SELECT * FROM " + tableRef, new BeanPropertyRowMapper<>(Pattern.class));
    }

    @Override
    public boolean savePattern(String schemaSuffix, Pattern pattern) {
        return isSaved(jdbcTemplate.update("INSERT INTO " + schemaSuffix
                + "(ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES (?, ?)",
                pattern.getOriginalWordPattern(),
                pattern.getLemmaWordPattern()));
    }
}
