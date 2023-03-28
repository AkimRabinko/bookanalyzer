package com.akimrabinko.bookanalyzer.model;

import com.akimrabinko.bookanalyzer.model.enums.Genre;
import com.akimrabinko.bookanalyzer.model.enums.Language;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.annotation.Nullable;
import jakarta.validation.constraints.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class Book {
    private long id;
    @NotBlank
    @Size(min = 5)
    private String bookAuthor;
    @NotBlank
    @Size(min = 5)
    private String bookName;
    @NotNull
    private Genre genre;
    @Min(1)
    @Max(2100)
    private int yearOfPublish;
    @NotBlank
    @Size(min = 5)
    private String publisher;
    @NotBlank
    @Size(min = 20)
    private String description;
    @NotBlank
    @Size(min = 10, max = 30)
    private String isbn;
    @NotNull
    private Language language;
    @Nullable
    @Size(min = 50)
    private String content;
}
