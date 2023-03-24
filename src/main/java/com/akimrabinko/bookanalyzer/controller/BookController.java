package com.akimrabinko.bookanalyzer.controller;

import com.akimrabinko.bookanalyzer.model.Book;
import com.akimrabinko.bookanalyzer.model.BookAnalysis;
import com.akimrabinko.bookanalyzer.service.BookService;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.List;

@RestController
@RequestMapping("book")
public class BookController {

    private final BookService bookService;

    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    @PostMapping("import")
    public void importBook(@RequestBody Book book) throws SQLException {
        bookService.importBook(book);
    }

    @GetMapping("all")
    public List<Book> getAllBooks() {
        return bookService.getAllBooks();
    }

    @PutMapping("{id}/analyze")
    public BookAnalysis analyze(@PathVariable("id") long id) {
        return bookService.analyze(id);
    }
}
