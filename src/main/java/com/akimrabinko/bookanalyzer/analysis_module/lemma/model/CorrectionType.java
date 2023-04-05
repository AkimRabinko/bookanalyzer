package com.akimrabinko.bookanalyzer.analysis_module.lemma.model;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum CorrectionType {
    COMMON("common_correction"),
    MANUAL("manual_correction"),
    HYBRID("hybrid_correction");

    private final String table;
}
