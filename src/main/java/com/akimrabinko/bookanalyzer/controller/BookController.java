package com.akimrabinko.bookanalyzer.controller;

import com.akimrabinko.bookanalyzer.model.Book;
import com.akimrabinko.bookanalyzer.model.BookAnalysis;
import com.akimrabinko.bookanalyzer.service.BookService;
import com.vaadin.flow.server.auth.AnonymousAllowed;
import dev.hilla.Endpoint;

import java.sql.SQLException;
import java.util.List;

@Endpoint
@AnonymousAllowed
public class BookController {

    private final BookService bookService;

    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    public void importBook(Book book) throws SQLException {
        bookService.importBook(book);
    }

    public List<Book> getAllBooks() {
        return bookService.getAllBooks();
    }

    public BookAnalysis analyze(long id) {
        return bookService.analyze(id);
    }
}
