package com.akimrabinko.bookanalyzer.analysis_module.lemma.service.impl;

import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Correction;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.CorrectionType;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.model.Pattern;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.service.LemmaAnalysisService;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.service.LemmaService;
import com.akimrabinko.bookanalyzer.analysis_module.lemma.service.PatternService;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import static com.akimrabinko.bookanalyzer.analysis_module.lemma.utils.PatternRegexMatchUtils.formatToOriginalPattern;
import static com.akimrabinko.bookanalyzer.analysis_module.lemma.utils.PatternRegexMatchUtils.isPatternWord;
import static com.akimrabinko.bookanalyzer.utils.BookAnalysisUtils.prepareContent;

// TODO: make mechanism to move words without corresponding rules
//  to correct to separate table for rules creation
@Service
public class LemmaAnalysisServiceEN implements LemmaAnalysisService {
    private final PatternService patternService;
    private final LemmaService lemmaService;

    public LemmaAnalysisServiceEN(PatternService patternService, LemmaService lemmaService) {
        this.patternService = patternService;
        this.lemmaService = lemmaService;
    }

    @Override
    public boolean runLemmaAnalysisOnText(String text) {
        String[] content = prepareContent(text);
        List<Pattern> patterns = patternService.getAllPatterns();
        List<Correction> verifiedCorrections = lemmaService.getAllCorrections();
        Set<Correction> corrections = Arrays.stream(content)
                .map(word -> getCorrection(word, patterns, verifiedCorrections))
                .filter(Optional::isPresent)
                .map(Optional::get)
                .collect(Collectors.toSet());
        lemmaService.saveCorrections(corrections);
        return true;
    }

    @Override
    public boolean saveVerifiedAnalysis(List<Correction> corrections) {
        lemmaService.saveCorrections(corrections);
        lemmaService.deleteUnverifiedCorrection();
        return true;
    }

    private Optional<Correction> getCorrection(String word,
                                               List<Pattern> patterns,
                                               List<Correction> verifiedCorrections) {
        boolean isVerified = verifiedCorrections.stream()
                .anyMatch(correction -> correction.getLemmaWord().equalsIgnoreCase(word));
        if (isVerified) {
            return Optional.empty();
        }
        Optional<Pattern> pattern = checkOnPatternAndGet(word, patterns);
        return Optional.of(new Correction(
                formatToOriginalPattern(word, pattern.orElse(null)),
                word,
                CorrectionType.UNVERIFIED,
                pattern.map(Pattern::getId).orElse(0L)));
    }

    private Optional<Pattern> checkOnPatternAndGet(String value, List<Pattern> patterns) {
        return patterns.stream()
                .filter(pattern -> isPatternWord(value, pattern))
                .findFirst();
    }
}
