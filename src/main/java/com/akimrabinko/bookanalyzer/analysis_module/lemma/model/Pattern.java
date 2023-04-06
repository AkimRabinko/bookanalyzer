package com.akimrabinko.bookanalyzer.analysis_module.lemma.model;

public class Pattern {
    private final long id;
    private final String originalWordPattern;
    private final String lemmaWordPattern;

    public Pattern(String originalWordPattern, String lemmaWordPattern) {
        this.id = -1L;
        this.originalWordPattern = originalWordPattern;
        this.lemmaWordPattern = lemmaWordPattern;
    }

    public Pattern(long id, String originalWordPattern, String lemmaWordPattern) {
        this.id = id;
        this.originalWordPattern = originalWordPattern;
        this.lemmaWordPattern = lemmaWordPattern;
    }

    public long getId() {
        return id;
    }

    public String getOriginalWordPattern() {
        return originalWordPattern;
    }

    public String getLemmaWordPattern() {
        return lemmaWordPattern;
    }
}
