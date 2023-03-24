package com.akimrabinko.bookanalyzer.service.impl;

import com.akimrabinko.bookanalyzer.model.BookAnalysis;
import com.akimrabinko.bookanalyzer.model.WordsUsageAnalysis;
import com.akimrabinko.bookanalyzer.service.BookAnalysisService;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

import static com.akimrabinko.bookanalyzer.utils.BookAnalysisUtils.analyzeWords;
import static com.akimrabinko.bookanalyzer.utils.BookAnalysisUtils.countWords;

@Service
public class BookAnalysisServiceImpl implements BookAnalysisService {

    @Override
    public BookAnalysis analyzeBooks(String content, long bookAnalysisId, long bookId) {
        LocalDateTime start = LocalDateTime.now();
        int wordsCount = countWords(content);
        List<WordsUsageAnalysis> wordsUsageAnalyses = analyzeWords(content, bookAnalysisId, bookId);
        LocalDateTime end = LocalDateTime.now();
        return BookAnalysis.builder()
                .id(bookAnalysisId)
                .bookId(bookId)
                .wordsCount(wordsCount)
                .launchStart(start)
                .launchEnd(end)
                .wordsUsages(wordsUsageAnalyses)
                .build();
    }
}
