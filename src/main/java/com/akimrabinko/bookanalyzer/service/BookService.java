package com.akimrabinko.bookanalyzer.service;

import com.akimrabinko.bookanalyzer.dto.BookAnalysisDto;
import com.akimrabinko.bookanalyzer.model.Book;
import com.akimrabinko.bookanalyzer.model.BookAnalysis;

import java.util.List;

public interface BookService {
    boolean importBook(Book book);

    List<Book> getAllBooks();

    BookAnalysis analyze(long bookId);

    List<BookAnalysisDto> getAllBooksAnalysis();
}
