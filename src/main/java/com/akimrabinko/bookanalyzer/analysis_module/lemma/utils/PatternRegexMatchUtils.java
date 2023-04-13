package com.akimrabinko.bookanalyzer.analysis_module.lemma.utils;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Pattern;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.ObjectUtils;

import static com.github.jknack.handlebars.internal.lang3.StringUtils.EMPTY;


@NoArgsConstructor(access = AccessLevel.NONE)
public final class PatternRegexMatchUtils {
    private static final String ANY_CHARACTERS_PATTERN = "-";
    private static final String ANY_CHARACTERS_REGEX = ".{1,}";
    private static final String END_OF_LINE_REGEX = "$";


    public static boolean isPatternWord(String word, Pattern pattern) {
        String lemmaPatternRegex = pattern.getLemmaWordPattern()
                .replaceAll(ANY_CHARACTERS_PATTERN, ANY_CHARACTERS_REGEX) + END_OF_LINE_REGEX;
        return word.matches(lemmaPatternRegex);
    }

    public static String formatToOriginalPattern(String word, Pattern pattern) {
        if (ObjectUtils.isNotEmpty(pattern) && isPatternWord(word, pattern)) {
            String lemmaSuffix = pattern.getLemmaWordPattern().replaceAll(ANY_CHARACTERS_PATTERN, EMPTY);
            String originalSuffix = pattern.getOriginalWordPattern().replaceAll(ANY_CHARACTERS_PATTERN, EMPTY);
            int index = word.lastIndexOf(lemmaSuffix);
            return word.substring(0, index)
                    + originalSuffix
                    + word.substring(index + lemmaSuffix.length());
        }
        return word;
    }
}
