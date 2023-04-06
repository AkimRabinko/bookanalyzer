package com.akimrabinko.bookanalyzer.analysis_module.lemma.model;

public class Correction {
    private final long id;
    private final String originalWord;
    private final String lemmaWord;
    private final CorrectionType correctionType;
    private final long ruleId;

    public Correction(
                      String originalWord,
                      String lemmaWord,
                      CorrectionType correctionType,
                      long ruleId) {
        this.id = -1L;
        this.originalWord = originalWord;
        this.lemmaWord = lemmaWord;
        this.correctionType = correctionType;
        this.ruleId = ruleId;
    }

    public Correction(long id,
                      String originalWord,
                      String lemmaWord,
                      CorrectionType correctionType,
                      long ruleId) {
        this.id = id;
        this.originalWord = originalWord;
        this.lemmaWord = lemmaWord;
        this.correctionType = correctionType;
        this.ruleId = ruleId;
    }

    public long getId() {
        return id;
    }

    public String getOriginalWord() {
        return originalWord;
    }

    public String getLemmaWord() {
        return lemmaWord;
    }

    public CorrectionType getCorrectionType() {
        return correctionType;
    }

    public long getRuleId() {
        return ruleId;
    }
}
