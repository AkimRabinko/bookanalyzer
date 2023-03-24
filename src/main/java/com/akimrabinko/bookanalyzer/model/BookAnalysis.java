package com.akimrabinko.bookanalyzer.model;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder(toBuilder = true)
public class BookAnalysis {
    private long id;
    private long bookId;
    private LocalDateTime launchStart;
    private LocalDateTime launchEnd;
    private int wordsCount;
    private List<WordsUsageAnalysis> wordsUsages;
}
