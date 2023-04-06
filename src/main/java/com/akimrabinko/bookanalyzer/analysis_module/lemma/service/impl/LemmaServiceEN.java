package com.akimrabinko.bookanalyzer.analysis_module.lemma.service.impl;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Correction;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.CorrectionType;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.repository.LemmaRepository;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.service.LemmaService;
import org.springframework.cache.annotation.CachePut;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class LemmaServiceEN implements LemmaService {
    private static final String SCHEMA_SUFFIX = "en";
    private final LemmaRepository lemmaRepository;

    public LemmaServiceEN(LemmaRepository lemmaRepository) {
        this.lemmaRepository = lemmaRepository;
    }

    @Override
    public String getOriginalValue(String lemmaWord) {
        return getAllCorrections()
                .stream()
                .filter(correction -> lemmaWord.equals(correction.getLemmaWord()))
                .findFirst()
                .map(Correction::getOriginalWord)
                .orElse(lemmaWord);
    }

    @Override
    public List<Correction> getAllCorrectionsByType(CorrectionType type) {
        return getAllCorrections().stream()
                .filter(correction -> type.equals(correction.getCorrectionType()))
                .collect(Collectors.toList());
    }

    @Override
    public List<Correction> getUnverifiedCorrections() {
        return getAllCorrections().stream()
                .filter(correction -> CorrectionType.UNVERIFIED.equals(correction.getCorrectionType()))
                .collect(Collectors.toList());
    }

    @Override
    public boolean saveCorrection(Correction correction) {
        return lemmaRepository.saveCorrection(SCHEMA_SUFFIX, correction);
    }

    @Override
    public boolean saveCorrections(List<Correction> corrections) {
        return corrections.stream().allMatch(this::saveCorrection);
    }

    @CachePut(value="correction")

    public List<Correction> getAllCorrections() {
        return lemmaRepository.getAllCorrections(SCHEMA_SUFFIX);
    }

    @Override
    public boolean deleteUnverifiedCorrection() {
        return lemmaRepository.deleteUnverifiedCorrection(SCHEMA_SUFFIX);
    }
}
