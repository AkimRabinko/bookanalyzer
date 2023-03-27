package com.akimrabinko.bookanalyzer.controller;

import com.akimrabinko.bookanalyzer.model.enums.Genre;
import com.akimrabinko.bookanalyzer.model.enums.Language;
import com.vaadin.flow.server.auth.AnonymousAllowed;
import dev.hilla.Endpoint;

import java.util.Arrays;
import java.util.List;

@Endpoint
@AnonymousAllowed
public class EnumsController {

    public List<Genre> getGenres() {
        return Arrays.asList(Genre.values());
    }

    public List<Language> getLanguages() {
        return Arrays.asList(Language.values());
    }
}
