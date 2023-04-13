package com.akimrabinko.bookanalyzer.analysis_module.lemma.controller;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Pattern;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.service.PatternService;
import com.vaadin.flow.server.auth.AnonymousAllowed;
import dev.hilla.Endpoint;

import java.util.List;

@Endpoint
@AnonymousAllowed
public class PatternController {
    private final PatternService patternService;

    public PatternController(PatternService patternService) {
        this.patternService = patternService;
    }

    public List<Pattern> getAllPatterns() {
        return patternService.getAllPatterns();
    }

    public boolean savePattern(Pattern pattern) {
        return patternService.savePattern(pattern);
    }

    public boolean savePatterns(List<Pattern> patterns) {
        return patternService.savePatterns(patterns);
    }
}
