package com.akimrabinko.bookanalyzer.analysis_module.lemma.service;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Pattern;

import java.util.List;

public interface PatternService {
    List<Pattern> getAllPatterns();

    boolean savePattern(Pattern pattern);

    boolean savePatterns(List<Pattern> patterns);
}
