package com.akimrabinko.bookanalyzer.repository.impl;

import com.akimrabinko.bookanalyzer.dto.BookAnalysisDto;
import com.akimrabinko.bookanalyzer.model.Book;
import com.akimrabinko.bookanalyzer.model.BookAnalysis;
import com.akimrabinko.bookanalyzer.model.WordsUsageAnalysis;
import com.akimrabinko.bookanalyzer.repository.BookRepository;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

@Repository
public class BookRepositoryImpl implements BookRepository {

    private final JdbcTemplate jdbcTemplate;

    public BookRepositoryImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public long importBook(Book book) {
        return Optional.ofNullable(
                        jdbcTemplate.queryForObject("INSERT INTO BOOK_ANALYZER.BOOK " +
                                        "(BOOK_AUTHOR, BOOK_NAME, GENRE, YEAR_OF_PUBLISH, PUBLISHER, DESCRIPTION, " +
                                        "ISBN, LANGUAGE) VALUES (?, ?, ?, ?, ?, ?, ?, ?) RETURNING ID;",
                                Long.class,
                                book.getBookAuthor(),
                                book.getBookName(),
                                book.getGenre().name(),
                                book.getYearOfPublish(),
                                book.getPublisher(),
                                book.getDescription(),
                                book.getIsbn(),
                                book.getLanguage().name()))
                .orElse(-1L);
    }

    @Override
    public void importContent(long bookId, String content) {
        jdbcTemplate.update("INSERT INTO BOOK_ANALYZER.BOOK_CONTENT (BOOK_ID, CONTENT) VALUES (?, ?);",
                bookId, content);
    }

    @Override
    public long saveBookAnalysis(long bookId) {
        return Optional.ofNullable(jdbcTemplate.queryForObject("INSERT INTO BOOK_ANALYZER.BOOK_ANALYSIS " +
                        "(BOOK_ID) VALUES (?) RETURNING ID;", Long.class, bookId))
                .orElse(-1L);
    }

    @Override
    public void updateBookAnalysis(BookAnalysis bookAnalysis) {
        jdbcTemplate.update("UPDATE BOOK_ANALYZER.BOOK_ANALYSIS " +
                        "SET LAUNCH_START = ?, LAUNCH_END = ?, WORDS_COUNT = ? WHERE ID = ?;",
                bookAnalysis.getLaunchStart(),
                bookAnalysis.getLaunchEnd(),
                bookAnalysis.getWordsCount(),
                bookAnalysis.getId());
    }

    @Override
    public void importWordsUsageAnalysis(List<WordsUsageAnalysis> wordsUsages) {
        jdbcTemplate.batchUpdate("INSERT INTO BOOK_ANALYZER.WORDS_USAGE_ANALYSIS " +
                        "(BOOK_ANALYSIS_ID, BOOK_ID, WORD, OCCURRENCES) VALUES (?, ?, ?, ?)",
                new BatchPreparedStatementSetter() {
                    @Override
                    public void setValues(PreparedStatement ps, int i) throws SQLException {
                        ps.setLong(1, wordsUsages.get(i).getBookAnalysisId());
                        ps.setLong(2, wordsUsages.get(i).getBookId());
                        ps.setString(3, wordsUsages.get(i).getWord());
                        ps.setInt(4, wordsUsages.get(i).getOccurrences());
                    }

                    @Override
                    public int getBatchSize() {
                        return wordsUsages.size();
                    }
                });
    }

    @Override
    public String getBookContentById(long bookId) {
        return jdbcTemplate.queryForObject("SELECT CONTENT FROM BOOK_ANALYZER.BOOK_CONTENT WHERE BOOK_ID = ?",
                String.class, bookId);
    }

    @Override
    public List<Book> getAllBooks() {
        return jdbcTemplate.query("SELECT b.*, bc.content FROM BOOK_ANALYZER.BOOK b" +
                        " LEFT JOIN BOOK_ANALYZER.BOOK_CONTENT bc ON (b.id = bc.book_id)",
                BeanPropertyRowMapper.newInstance(Book.class));
    }

    @Override
    public List<WordsUsageAnalysis> getWordUsagesByAnalysisId(long id) {
        return jdbcTemplate.query("SELECT * FROM BOOK_ANALYZER.WORDS_USAGE_ANALYSIS " +
                        "WHERE WORDS_USAGE_ANALYSIS.BOOK_ANALYSIS_ID = ?",
                BeanPropertyRowMapper.newInstance(WordsUsageAnalysis.class),
                id);
    }

    @Override
    public List<BookAnalysisDto> getAllBooksAnalysis() {
        return jdbcTemplate.query("SELECT BA.ID, BA.LAUNCH_START, BA.LAUNCH_END, BA.WORDS_COUNT, " +
                        "BB.BOOK_NAME, BB.BOOK_AUTHOR FROM BOOK_ANALYZER.BOOK_ANALYSIS BA " +
                        "JOIN BOOK_ANALYZER.BOOK BB ON (BB.ID = BA.BOOK_ID)",
                (rs, rowNum) ->
                        BookAnalysisDto.builder()
                                .id(rs.getLong("ID"))
                                .bookName(rs.getString("BOOK_NAME"))
                                .bookAuthor(rs.getString("BOOK_AUTHOR"))
                                .launchStart(Timestamp.valueOf(rs.getString("LAUNCH_START")).toLocalDateTime())
                                .launchEnd(Timestamp.valueOf(rs.getString("LAUNCH_END")).toLocalDateTime())
                                .wordsCount(rs.getInt("WORDS_COUNT"))
                                .build());
    }
}
