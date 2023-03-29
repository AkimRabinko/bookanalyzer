import {html, LitElement} from 'lit';
import {customElement, state} from 'lit/decorators.js';
import type BookAnalysisDto from "Frontend/generated/com/akimrabinko/bookanalyzer/dto/BookAnalysisDto";

import client from 'Frontend/generated/connect-client.default';
import {applyTheme} from 'Frontend/generated/theme';

import '@vaadin/grid';
import '@vaadin/grid/vaadin-grid-filter-column.js';
import '@vaadin/grid/vaadin-grid-sort-column.js';
import {GridActiveItemChangedEvent} from "@vaadin/grid";
import {gridRowDetailsRenderer} from "@vaadin/grid/lit";

@customElement("books-analysis-template")
class BooksAnalysis extends LitElement {

    @state()
    protected booksAnalysis: BookAnalysisDto[] = [];

    @state()
    protected detailsOpenedItem: BookAnalysisDto[] = []

    protected override createRenderRoot() {
        const root = super.createRenderRoot();
        applyTheme(root);
        return root;
    }

    protected override async firstUpdated() {
        this.booksAnalysis = await this.getBookAnalysis()
        console.log('done');
    }

    private async getBookAnalysis(): Promise<BookAnalysisDto[]> {
        return client.call('BookController', 'getAllBooksAnalysis');
    }

    protected override render(): unknown {
        return html`
            <vaadin-grid .items="${this.booksAnalysis}"
                         id="book-grid"
                         theme="row-stripes no-border"
                         .detailsOpenedItems="${this.detailsOpenedItem}"
                         @active-item-changed="${(event: GridActiveItemChangedEvent<BookAnalysisDto>) => {
                             const bookAnalysis = event.detail.value;
                             this.detailsOpenedItem = bookAnalysis ? [bookAnalysis] : [];
                         }}"
                         ${gridRowDetailsRenderer<BookAnalysisDto>(
                                 (bookAnalysis) => html`
                                     <vaadin-vertical-layout>
                                         <vaadin-grid .items="${bookAnalysis.wordsUsages}">
                                             <vaadin-grid-sort-column frozen path="word"></vaadin-grid-sort-column>
                                             <vaadin-grid-sort-column frozen
                                                                      path="occurrences"></vaadin-grid-sort-column>
                                         </vaadin-grid>
                                     </vaadin-vertical-layout>`)}>
                <vaadin-grid-filter-column frozen path="id"></vaadin-grid-filter-column>
                <vaadin-grid-filter-column frozen path="bookName"></vaadin-grid-filter-column>
                <vaadin-grid-filter-column frozen path="bookAuthor"></vaadin-grid-filter-column>
                <vaadin-grid-filter-column frozen path="launchStart"></vaadin-grid-filter-column>
                <vaadin-grid-filter-column frozen path="launchEnd"></vaadin-grid-filter-column>
                <vaadin-grid-filter-column frozen path="wordsCount"></vaadin-grid-filter-column>
            </vaadin-grid>
        `;
    }
}

