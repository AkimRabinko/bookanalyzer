package com.akimrabinko.bookanalyzer.service;

import com.akimrabinko.bookanalyzer.model.Book;
import com.akimrabinko.bookanalyzer.model.BookAnalysis;

import java.sql.SQLException;
import java.util.List;

public interface BookService {
    void importBook(Book book) throws SQLException;

    List<Book> getAllBooks();

    BookAnalysis analyze(long bookId);
}
