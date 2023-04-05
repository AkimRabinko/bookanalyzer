package com.akimrabinko.bookanalyzer.analysis_module.lemma.model;

public class Correction {
    private final long id;
    private String originalWord;
    private final String lemmaWord;
    private boolean verified;
    private final CorrectionType correctionType;

    public Correction(long id,
                      String originalWord,
                      String lemmaWord,
                      boolean verified,
                      CorrectionType correctionType) {
        this.id = id;
        this.originalWord = originalWord;
        this.lemmaWord = lemmaWord;
        this.verified = verified;
        this.correctionType = correctionType;
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

    public boolean isVerified() {
        return verified;
    }

    public CorrectionType getCorrectionType() {
        return correctionType;
    }

    public void setOriginalWord(String lemmaWord) {
        this.originalWord = lemmaWord;
        this.verified = true;
    }
}
