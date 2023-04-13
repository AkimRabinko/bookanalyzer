package com.akimrabinko.bookanalyzer.analysis_module.lemma.controller;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Correction;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.CorrectionType;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.service.LemmaAnalysisService;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.service.LemmaService;
import com.vaadin.flow.server.auth.AnonymousAllowed;
import dev.hilla.Endpoint;

import java.util.List;

@Endpoint
@AnonymousAllowed
public class LemmaController {

    private final LemmaService lemmaService;

    public LemmaController(LemmaService lemmaService) {
        this.lemmaService = lemmaService;
    }

    public String getOriginalValue(String lemmaWord) {
        return lemmaService.getOriginalValue(lemmaWord);
    }

    public List<Correction> getAllCorrectionsByType(CorrectionType type) {
        return lemmaService.getAllCorrectionsByType(type);
    }

    public List<Correction> getAllCorrections() {
        return lemmaService.getAllCorrections();
    }

    public List<Correction> getUnverifiedCorrections() {
        return lemmaService.getUnverifiedCorrections();
    }

    public boolean saveCorrection(Correction correction) {
        return lemmaService.saveCorrection(correction);
    }

    public boolean saveCorrections(List<Correction> corrections) {
        return lemmaService.saveCorrections(corrections);
    }

    public boolean deleteUnverifiedCorrection() {
        return lemmaService.deleteUnverifiedCorrection();
    }
}
