package com.akimrabinko.bookanalyzer.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WordsUsageAnalysis {
    private long bookAnalysisId;
    private long bookId;
    private String word;
    private int occurrences;
}
