package com.akimrabinko.bookanalyzer.analysis_module.lemma.service.impl;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Pattern;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.service.PatternService;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.repository.PatternRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatternServiceEN implements PatternService {
    private static final String SCHEMA_SUFFIX = "en";

    private final PatternRepository patternRepository;

    public PatternServiceEN(PatternRepository patternRepository) {
        this.patternRepository = patternRepository;
    }

    @Override
    public List<Pattern> getAllPatterns() {
        return patternRepository.getAllPatterns(SCHEMA_SUFFIX);
    }

    @Override
    public boolean savePattern(Pattern pattern) {
        return patternRepository.savePattern(SCHEMA_SUFFIX, pattern);
    }

    @Override
    public boolean savePatterns(List<Pattern> patterns) {
        return patterns.stream().allMatch(this::savePattern);
    }
}
