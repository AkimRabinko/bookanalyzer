package com.akimrabinko.bookanalyzer.model;

import com.akimrabinko.bookanalyzer.model.enums.Genre;
import com.akimrabinko.bookanalyzer.model.enums.Language;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.annotation.Nullable;

@Data
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class Book {
    private long id;
    private String bookAuthor;
    private String bookName;
    private Genre genre;
    private int yearOfPublish;
    private String publisher;
    private String description;
    private String isbn;
    private Language language;
    @Nullable
    private String content;
}
