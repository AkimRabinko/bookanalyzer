package com.akimrabinko.bookanalyzer.analysis_module.lemma.repository;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Pattern;

import java.util.List;

public interface PatternRepository {
    List<Pattern> getAllPatterns(String schemaSuffix);

    boolean savePattern(String schemaSuffix, Pattern pattern);
}
