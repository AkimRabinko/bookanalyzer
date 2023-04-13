package com.akimrabinko.bookanalyzer.analysis_module.lemma.model;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;

        if (o == null || getClass() != o.getClass()) return false;

        Correction that = (Correction) o;

        return new EqualsBuilder().append(id, that.id).append(ruleId, that.ruleId).append(originalWord, that.originalWord).append(lemmaWord, that.lemmaWord).append(correctionType, that.correctionType).isEquals();
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder(17, 37).append(id).append(originalWord).append(lemmaWord).append(correctionType).append(ruleId).toHashCode();
    }
}
