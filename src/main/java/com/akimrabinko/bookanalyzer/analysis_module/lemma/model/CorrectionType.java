package com.akimrabinko.bookanalyzer.analysis_module.lemma.model;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.util.Arrays;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Getter
@RequiredArgsConstructor
public enum CorrectionType {
    COMMON("common_correction"),
    MANUAL("manual_correction"),
    HYBRID("hybrid_correction"),
    UNVERIFIED("tmp_correction");

    private static final Map<String, CorrectionType> TABLE_TO_CORRECTIONS_MAP = Arrays.stream(CorrectionType.values())
            .collect(Collectors.toMap(CorrectionType::getTable, Function.identity()));

    private final String table;

    public static CorrectionType getTypeByTable(String table) {
        return TABLE_TO_CORRECTIONS_MAP.get(table);
    }
}
