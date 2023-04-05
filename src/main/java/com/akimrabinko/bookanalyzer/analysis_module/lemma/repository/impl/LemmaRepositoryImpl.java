package com.akimrabinko.bookanalyzer.analysis_module.lemma.repository.impl;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Correction;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.CorrectionType;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.repository.LemmaRepository;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class LemmaRepositoryImpl implements LemmaRepository {
    private static final String CORRECTION_TABLE = "correction_%s.%s";

    private final JdbcTemplate jdbcTemplate;

    public LemmaRepositoryImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Correction> getAllCorrections(String schemaSuffix) {
        String correctionTablesReference = Arrays.stream(CorrectionType.values())
                .map(e -> createTableReference(schemaSuffix, e.getTable()))
                .collect(Collectors.joining(", "));
        return jdbcTemplate.query("SELECT * FROM " + correctionTablesReference, new BeanPropertyRowMapper<>(Correction.class));
    }

    @Override
    public boolean updateCorrection(String schemaSuffix, Correction correction) {
        String correctionTableReference = createTableReference(schemaSuffix,
                correction.getCorrectionType().getTable());
        return isSaved(jdbcTemplate.update("UPDATE " + correctionTableReference + " SET "
                        + "FIXED_WORD = ?, VERIFIED = ? WHERE ID = ?",
                correction.getLemmaWord(), correction.isVerified(), correction.getId()));
    }

    @Override
    public boolean saveCorrection(String schemaSuffix, Correction correction) {
        String correctionTableReference = createTableReference(schemaSuffix,
                correction.getCorrectionType().getTable());
        return isSaved(jdbcTemplate.update("INSERT INTO " + correctionTableReference
                + " (ORIGINAL_WORD, FIXED_WORD, VERIFIED) VALUES (?, ?, ?)",
                correction.getOriginalWord(), correction.getLemmaWord(), correction.isVerified()));
    }

    private static String createTableReference(String schemaSuffix, String tableName) {
        return String.format(CORRECTION_TABLE, schemaSuffix, tableName);
    }

    private static boolean isSaved(int result) {
        return result > 0;
    }
}
