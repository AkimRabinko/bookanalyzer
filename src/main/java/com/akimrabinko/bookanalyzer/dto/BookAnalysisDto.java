package com.akimrabinko.bookanalyzer.dto;

import com.akimrabinko.bookanalyzer.model.WordsUsageAnalysis;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder(toBuilder = true)
public class BookAnalysisDto {
    private long id;
    private String bookName;
    private String bookAuthor;
    private LocalDateTime launchStart;
    private LocalDateTime launchEnd;
    private int wordsCount;
    private List<WordsUsageAnalysis> wordsUsages;
}
