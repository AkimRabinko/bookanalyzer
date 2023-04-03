import {html, LitElement} from 'lit';
import {customElement, state} from 'lit/decorators.js';
import type BookAnalysisDto from "Frontend/generated/com/akimrabinko/bookanalyzer/dto/BookAnalysisDto";

import client from 'Frontend/generated/connect-client.default';
import {applyTheme} from 'Frontend/generated/theme';

import '@vaadin/grid';
import '@vaadin/grid/vaadin-grid-filter-column.js';
import '@vaadin/grid/vaadin-grid-sort-column.js';
import {columnBodyRenderer} from "@vaadin/grid/lit";
import {DirectiveResult} from "lit/directive";
import {dialogRenderer, DialogRendererDirective} from "@vaadin/dialog/lit";
import {DialogOpenedChangedEvent} from "@vaadin/dialog";

@customElement("books-analysis-template")
class BooksAnalysis extends LitElement {
    private wordsUsagesDialogRenderer: DirectiveResult<typeof DialogRendererDirective> = dialogRenderer(
        () => html`
            <vaadin-grid .items="${this.detailsOpenedItem.wordsUsages}">
                <vaadin-grid-sort-column frozen path="word"></vaadin-grid-sort-column>
                <vaadin-grid-sort-column frozen
                                         path="occurrences"></vaadin-grid-sort-column>
            </vaadin-grid>`);
    private wordsUsagesDialogOpened = false;

    @state()
    protected booksAnalysis: BookAnalysisDto[] = [];

    @state()
    protected detailsOpenedItem: BookAnalysisDto = {
        bookAuthor: '',
        bookName: '',
        wordsUsages: [],
        id: 0,
        wordsCount: 0
    };

    protected override createRenderRoot() {
        const root = super.createRenderRoot();
        applyTheme(root);
        return root;
    }

    protected override async firstUpdated() {
        this.booksAnalysis = await this.getBookAnalysis()
    }

    private async getBookAnalysis(): Promise<BookAnalysisDto[]> {
        return client.call('BookController', 'getAllBooksAnalysis');
    }

    protected override render(): unknown {
        return html`
            <vaadin-grid .items="${this.booksAnalysis}"
                         id="book-grid"
                         theme="row-stripes no-border">
                <vaadin-grid-filter-column frozen path="id"></vaadin-grid-filter-column>
                <vaadin-grid-filter-column frozen path="bookName"></vaadin-grid-filter-column>
                <vaadin-grid-filter-column frozen path="bookAuthor"></vaadin-grid-filter-column>
                <vaadin-grid-filter-column frozen path="launchStart"></vaadin-grid-filter-column>
                <vaadin-grid-filter-column frozen path="launchEnd"></vaadin-grid-filter-column>
                <vaadin-grid-filter-column frozen path="wordsCount"></vaadin-grid-filter-column>
                <vaadin-grid-column frozen ${columnBodyRenderer<BookAnalysisDto>(
                        (book) => html`
                            <vaadin-button
                                    theme="tertiary"
                                    @click="${() => {
                                        this.detailsOpenedItem = book;
                                        this.wordsUsagesDialogOpened = true;
                                    }}">
                                View words Usages
                            </vaadin-button>`,
                        []
                )}></vaadin-grid-column>

                <vaadin-dialog
                        id="book-save-dialog"
                        header-title="${this.detailsOpenedItem.bookName} / ${this.detailsOpenedItem.bookAuthor}"
                        draggable
                        .opened="${this.wordsUsagesDialogOpened}"
                        @opened-changed="${(event: DialogOpenedChangedEvent) => {
                            this.wordsUsagesDialogOpened = event.detail.value;
                        }}"
                        ${this.wordsUsagesDialogRenderer}>
                </vaadin-dialog>
            </vaadin-grid>
        `;
    }
}

