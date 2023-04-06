package com.akimrabinko.bookanalyzer.analysis_module.lemma.controller;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Correction;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.service.LemmaAnalysisService;
import com.vaadin.flow.server.auth.AnonymousAllowed;
import dev.hilla.Endpoint;

import java.util.List;

@Endpoint
@AnonymousAllowed
public class LemmaAnalysisController {

    private final LemmaAnalysisService lemmaAnalysisService;

    public LemmaAnalysisController(LemmaAnalysisService lemmaAnalysisService) {
        this.lemmaAnalysisService = lemmaAnalysisService;
    }

    public boolean runLemmaAnalysisOnText(String text) {
        return lemmaAnalysisService.runLemmaAnalysisOnText(text);
    }

    public boolean saveVerifiedAnalysis(List<Correction> corrections) {
        return lemmaAnalysisService.saveVerifiedAnalysis(corrections);
    }
}
