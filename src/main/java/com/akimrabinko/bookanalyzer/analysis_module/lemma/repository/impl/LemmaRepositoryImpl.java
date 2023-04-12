package com.akimrabinko.bookanalyzer.analysis_module.lemma.repository.impl;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.mapper.CorrectionRowMapper;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Correction;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.CorrectionType;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.repository.LemmaRepository;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import static com.akimrabinko.bookanalyzer.analysis_module.lemma.utils.SqlUtils.createTableReference;
import static com.akimrabinko.bookanalyzer.analysis_module.lemma.utils.SqlUtils.isSaved;

@Repository
public class LemmaRepositoryImpl implements LemmaRepository {
    private final JdbcTemplate jdbcTemplate;

    public LemmaRepositoryImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Correction> getAllCorrections(String schemaSuffix) {
        String correctionTablesReference = Arrays.stream(CorrectionType.values())
                .map(e -> createTableReference(schemaSuffix, e.getTable()))
                .collect(Collectors.joining(", "));
        return jdbcTemplate.query("SELECT * FROM " + correctionTablesReference,
                CorrectionRowMapper.getInstance());
    }

    @Override
    public List<Correction> getUnverifiedCorrections(String schemaSuffix) {
        String correctionTablesReference = createTableReference(schemaSuffix, CorrectionType.UNVERIFIED.getTable());
        return jdbcTemplate.query("SELECT * FROM " + correctionTablesReference,
                CorrectionRowMapper.getInstance());
    }

    @Override
    public boolean saveCorrection(String schemaSuffix, Correction correction) {
        String correctionTableReference = createTableReference(schemaSuffix,
                correction.getCorrectionType().getTable());
        return isSaved(jdbcTemplate.update("INSERT INTO " + correctionTableReference
                + " (ORIGINAL_WORD, LEMMA_WORD, RULE_ID) VALUES (?, ?, ?)",
                correction.getOriginalWord(),
                correction.getLemmaWord(),
                correction.getRuleId()));
    }

    @Override
    public boolean deleteUnverifiedCorrection(String schemaSuffix) {
        String correctionTableReference = createTableReference(schemaSuffix,
                CorrectionType.UNVERIFIED.getTable());
        return isSaved(jdbcTemplate.update("DELETE FROM " + correctionTableReference));
    }
}
