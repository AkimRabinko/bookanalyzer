package com.akimrabinko.bookanalyzer.analysis_module.lemma.service;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Correction;

import java.util.List;

public interface LemmaAnalysisService {
    boolean runLemmaAnalysisOnText(String text);

    boolean saveVerifiedAnalysis(List<Correction> corrections);
}
