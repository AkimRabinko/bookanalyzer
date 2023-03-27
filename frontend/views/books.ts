import {html, LitElement} from 'lit';
import {customElement, state} from 'lit/decorators.js';
import type Book from "Frontend/generated/com/akimrabinko/bookanalyzer/model/Book";
import client from 'Frontend/generated/connect-client.default';
import '@vaadin/grid';
import '@vaadin/grid/vaadin-grid-filter-column.js';
import {applyTheme} from 'Frontend/generated/theme';
import {gridRowDetailsRenderer} from "@vaadin/grid/lit";
import {GridActiveItemChangedEvent} from "@vaadin/grid";
import '@vaadin/form-layout';
import '@vaadin/text-field';
import '@vaadin/text-area';

@customElement('books-template')
class Books extends LitElement {
    @state()
    private books: Book[] = [];
    @state()
    private detailsOpenedItem: Book[] = [];

    protected override createRenderRoot() {
        const root = super.createRenderRoot();
        applyTheme(root);
        return root;
    }

    private async getBooks(): Promise<Book[]> {
        return client.call('BookController', 'getAllBooks');
    }

    protected override async firstUpdated() {
        this.books = await this.getBooks();
        console.log('done');
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

export default Books;