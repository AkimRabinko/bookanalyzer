package com.akimrabinko.bookanalyzer.service.impl;

import com.akimrabinko.bookanalyzer.dto.BookAnalysisDto;
import com.akimrabinko.bookanalyzer.model.Book;
import com.akimrabinko.bookanalyzer.model.BookAnalysis;
import com.akimrabinko.bookanalyzer.repository.BookRepository;
import com.akimrabinko.bookanalyzer.service.BookAnalysisService;
import com.akimrabinko.bookanalyzer.service.BookService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
public class BookServiceImpl implements BookService {

    private final BookRepository bookRepository;
    private final BookAnalysisService bookAnalysisService;

    public BookServiceImpl(BookRepository bookRepository, BookAnalysisService bookAnalysisService) {
        this.bookRepository = bookRepository;
        this.bookAnalysisService = bookAnalysisService;
    }

    @Override
    public boolean importBook(Book book) {
        long id = bookRepository.importBook(book);
        if (id == -1) {
            log.error("Book wasn't saved");
            return false;
        }
        bookRepository.importContent(id, book.getContent());
        return true;
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

    @Override
    public List<BookAnalysisDto> getAllBooksAnalysis() {
        return bookRepository.getAllBooksAnalysis().stream()
                .map(el -> el.toBuilder()
                        .wordsUsages(bookRepository.getWordUsagesByAnalysisId(el.getId()))
                        .build())
                .collect(Collectors.toList());
    }
}
