package com.akimrabinko.bookanalyzer.controller;

import com.akimrabinko.bookanalyzer.dto.BookAnalysisDto;
import com.akimrabinko.bookanalyzer.model.Book;
import com.akimrabinko.bookanalyzer.model.BookAnalysis;
import com.akimrabinko.bookanalyzer.service.BookService;
import com.vaadin.flow.server.auth.AnonymousAllowed;
import dev.hilla.Endpoint;

import java.util.List;

@Endpoint
@AnonymousAllowed
public class BookController {

    private final BookService bookService;

    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    public boolean importBook(Book book) {
        return bookService.importBook(book);
    }

    public List<Book> getAllBooks() {
        return bookService.getAllBooks();
    }

    public BookAnalysis analyze(long id) {
        return bookService.analyze(id);
    }

    public List<BookAnalysisDto> getAllBooksAnalysis() {
        return bookService.getAllBooksAnalysis();
    }
}
