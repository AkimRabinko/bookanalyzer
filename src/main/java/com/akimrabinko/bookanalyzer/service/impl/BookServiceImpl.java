package com.akimrabinko.bookanalyzer.service.impl;

import com.akimrabinko.bookanalyzer.model.Book;
import com.akimrabinko.bookanalyzer.model.BookAnalysis;
import com.akimrabinko.bookanalyzer.repository.BookRepository;
import com.akimrabinko.bookanalyzer.service.BookAnalysisService;
import com.akimrabinko.bookanalyzer.service.BookService;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    private final BookRepository bookRepository;
    private final BookAnalysisService bookAnalysisService;

    public BookServiceImpl(BookRepository bookRepository, BookAnalysisService bookAnalysisService) {
        this.bookRepository = bookRepository;
        this.bookAnalysisService = bookAnalysisService;
    }

    @Override
    public void importBook(Book book) throws SQLException {
        long id = bookRepository.importBook(book);
        if (id == -1) {
            throw new SQLException("Book wasn't saved");
        }
        bookRepository.importContent(id, book.getContent());
    }

    @Override
    public List<Book> getAllBooks() {
        return bookRepository.getAllBooks();
    }

    @Override
    public BookAnalysis analyze(long bookId) {
        String content = bookRepository.getBookContentById(bookId);
        long bookAnalysisId = bookRepository.saveBookAnalysis(bookId);
        BookAnalysis bookAnalysis = bookAnalysisService.analyzeBooks(content, bookAnalysisId, bookId);
        bookRepository.updateBookAnalysis(bookAnalysis);
        bookRepository.importWordsUsageAnalysis(bookAnalysis.getWordsUsages());
        return bookAnalysis;
    }
}
