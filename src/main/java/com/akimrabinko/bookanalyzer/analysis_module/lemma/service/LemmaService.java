package com.akimrabinko.bookanalyzer.analysis_module.lemma.service;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Correction;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.CorrectionType;

import java.util.List;

public interface LemmaService {
    String getOriginalValue(String lemmaWord);

    List<Correction> getAllCorrectionsByType(CorrectionType type);

    List<Correction> getUnverifiedCorrections();

    boolean saveCorrection(Correction correction);

    boolean saveCorrections(List<Correction> corrections);

    boolean deleteUnverifiedCorrection();
}
