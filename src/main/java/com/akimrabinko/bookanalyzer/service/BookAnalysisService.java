package com.akimrabinko.bookanalyzer.service;

import com.akimrabinko.bookanalyzer.model.BookAnalysis;

public interface BookAnalysisService {
    BookAnalysis analyzeBooks(String content, long bookAnalysisId, long bookId);
}
