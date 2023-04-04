package com.akimrabinko.bookanalyzer.repository;

import com.akimrabinko.bookanalyzer.dto.BookAnalysisDto;
import com.akimrabinko.bookanalyzer.model.Book;
import com.akimrabinko.bookanalyzer.model.BookAnalysis;
import com.akimrabinko.bookanalyzer.model.WordsUsageAnalysis;

import java.util.List;

public interface BookRepository {
    long importBook(Book book);

    void importContent(long bookId, String content);

    long saveBookAnalysis(long bookId);

    void updateBookAnalysis(BookAnalysis bookAnalysis);

    void importWordsUsageAnalysis(List<WordsUsageAnalysis> wordsUsages);

    String getBookContentById(long bookId);

    List<Book> getAllBooks();

    List<WordsUsageAnalysis> getWordUsagesByAnalysisId(long id);

    List<BookAnalysisDto> getAllBooksAnalysis();
}
