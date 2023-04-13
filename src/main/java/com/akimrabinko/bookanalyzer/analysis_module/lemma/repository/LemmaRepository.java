package com.akimrabinko.bookanalyzer.analysis_module.lemma.repository;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Correction;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.CorrectionType;

import java.util.List;

public interface LemmaRepository {
    List<Correction> getAllCorrectionsByType(String schemaSuffix, CorrectionType correction);

    List<Correction> getUnverifiedCorrections(String schemaSuffix);

    boolean saveCorrection(String schemaSuffix, Correction correction);

    boolean deleteUnverifiedCorrection(String schemaSuffix);
}
