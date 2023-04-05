package com.akimrabinko.bookanalyzer.analysis_module.lemma.repository;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Correction;

import java.util.List;

public interface LemmaRepository {
    List<Correction> getAllCorrections(String schemaSuffix);

    boolean updateCorrection(String schemaSuffix, Correction correction);

    boolean saveCorrection(String schemaSuffix, Correction correction);
}
