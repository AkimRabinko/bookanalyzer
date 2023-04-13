package com.akimrabinko.bookanalyzer.analysis_module.lemma.service;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Correction;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.CorrectionType;

import java.util.Collection;
import java.util.List;
import java.util.Set;

public interface LemmaService {
    String getOriginalValue(String lemmaWord);

    List<Correction> getAllCorrectionsByType(CorrectionType type);

    List<Correction> getAllCorrections();

    List<Correction> getUnverifiedCorrections();

    boolean saveCorrection(Correction correction);

    boolean saveCorrections(Collection<Correction> corrections);

    boolean deleteUnverifiedCorrection();
}
