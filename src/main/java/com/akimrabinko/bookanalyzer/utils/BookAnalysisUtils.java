package com.akimrabinko.bookanalyzer.utils;

import com.akimrabinko.bookanalyzer.model.WordsUsageAnalysis;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

import static org.apache.commons.lang3.StringUtils.SPACE;

@NoArgsConstructor(access = AccessLevel.NONE)
public final class BookAnalysisUtils {
    private static final String ONLY_LETTERS_REGEX = "[^\\p{L}]+";

    public static int countWords(String content) {
        return prepareContent(content).length;
    }

    public static List<WordsUsageAnalysis> analyzeWords(String content, long bookAnalysisId, long bookId) {
        String[] words = prepareContent(content);
        Map<String, AtomicInteger> processedWords = new HashMap<>();
        for (var word : words) {
            processedWords.putIfAbsent(word, new AtomicInteger(0));
            processedWords.get(word).incrementAndGet();
        }
        return processedWords.entrySet().stream()
                .map(e -> new WordsUsageAnalysis(bookAnalysisId, bookId, e.getKey(), e.getValue().get()))
                .sorted(Comparator.comparingInt(WordsUsageAnalysis::getOccurrences).reversed())
                .collect(Collectors.toList());
    }

    public static String[] prepareContent(String content) {
        return content.replaceAll(ONLY_LETTERS_REGEX, SPACE).toLowerCase().split(SPACE);
    }
}
