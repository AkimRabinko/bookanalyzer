import {html, LitElement} from 'lit';
import type Book from "Frontend/views/model/book";
import '@vaadin/grid';
import '@vaadin/grid/vaadin-grid-filter-column.js';
import {applyTheme} from 'Frontend/generated/theme';
import {state} from 'lit/decorators.js';
import {gridRowDetailsRenderer} from "@vaadin/grid/lit";
import {GridActiveItemChangedEvent} from "@vaadin/grid";
import '@vaadin/form-layout';
import '@vaadin/text-field';
import '@vaadin/text-area';

const URL = "/book/all";


class Books extends LitElement {
    @state()
    private books: Book[] = [];
    @state()
    private detailsOpenedItem: Book[] = [];

    private async _getBooks(): Promise<Book[]> {
        let xhr = new XMLHttpRequest();
        xhr.open("GET", URL, false);
        xhr.send();
        return JSON.parse(xhr.responseText);
    }

    protected override createRenderRoot() {
        const root = super.createRenderRoot();
        applyTheme(root);
        return root;
    }

    protected override async firstUpdated() {
        this.books = await this._getBooks();
    }

    protected override render() {
        return html`
            <vaadin-grid .items="${this.books}" id="book-grid" theme="row-stripes no-border"
                         .detailsOpenedItems="${this.detailsOpenedItem}"
                         @active-item-changed="${(event: GridActiveItemChangedEvent<Book>) => {
                             const book = event.detail.value;
                             this.detailsOpenedItem = book ? [book] : [];
                         }}"
                         ${gridRowDetailsRenderer<Book>(
                                 (book) => html`
                                     <vaadin-form-layout .responsiveSteps="${[{minWidth: '0', columns: 3}]}">
                                         <vaadin-text-field
                                                 label="Publisher"
                                                 .value="${book.yearOfPublish} ${book.publisher}"
                                                 colspan="3"
                                                 readonly
                                         ></vaadin-text-field>
                                         <vaadin-text-area
                                                 label="Description"
                                                 .value="${book.description}"
                                                 colspan="3"
                                                 readonly
                                         ></vaadin-text-area>
                                     </vaadin-form-layout>
                                 `,
                                 []
                         )}
            >
                <vaadin-grid-filter-column path="bookAuthor"></vaadin-grid-filter-column>
                <vaadin-grid-filter-column path="bookName"></vaadin-grid-filter-column>
                <vaadin-grid-filter-column path="genre"></vaadin-grid-filter-column>
                <vaadin-grid-filter-column path="isbn"></vaadin-grid-filter-column>
                <vaadin-grid-filter-column path="language"></vaadin-grid-filter-column>
            </vaadin-grid>`
    }
}

customElements.define('books-template', Books);