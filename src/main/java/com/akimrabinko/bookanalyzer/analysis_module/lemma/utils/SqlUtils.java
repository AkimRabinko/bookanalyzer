package com.akimrabinko.bookanalyzer.analysis_module.lemma.utils;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access = AccessLevel.NONE)
public final class SqlUtils {
    private static final String CORRECTION_TABLE = " correction_%s.%s ";

    public static String createTableReference(String schemaSuffix, String tableName) {
        return String.format(CORRECTION_TABLE, schemaSuffix, tableName);
    }

    public static boolean isSaved(int result) {
        return result > 0;
    }
}
