package com.akimrabinko.bookanalyzer.model;

import lombok.Data;

@Data
public class WordsUsageAnalysis {
    private final long bookAnalysisId;
    private final long bookId;
    private final String word;
    private final int occurrences;
}
