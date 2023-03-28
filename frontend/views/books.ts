import {html, LitElement} from 'lit';
import {customElement, state} from 'lit/decorators.js';

import BookModel from "Frontend/generated/com/akimrabinko/bookanalyzer/model/BookModel";
import type Book from "Frontend/generated/com/akimrabinko/bookanalyzer/model/Book";
import client from 'Frontend/generated/connect-client.default';
import {applyTheme} from 'Frontend/generated/theme';
import {formatData, getGenres, getLanguages} from "Frontend/views/utils/enums";

import {gridRowDetailsRenderer} from "@vaadin/grid/lit";
import {GridActiveItemChangedEvent} from "@vaadin/grid";
import '@vaadin/grid';
import '@vaadin/grid/vaadin-grid-filter-column.js';
import '@vaadin/form-layout';
import '@vaadin/text-area';
import '@vaadin/text-field';
import '@vaadin/number-field';
import '@vaadin/select';
import {Binder, field, Min, NotEmpty, Positive, Size} from "@hilla/form";
import {FormLayoutResponsiveStep} from "@vaadin/form-layout";
import {Notification} from '@vaadin/notification';

@customElement('books-template')
class Books extends LitElement {
    @state()
    private books: Book[] = [];
    @state()
    private detailsOpenedItem: Book[] = [];

    @state()
    protected genres: Object[] = [];
    @state()
    protected languages: Object[] = [];

    private binder = new Binder(this, BookModel);

    private responsiveSteps: FormLayoutResponsiveStep[] = [
        {minWidth: 0, columns: 1},
        {minWidth: '600px', columns: 3}
    ];

    protected override createRenderRoot() {
        const root = super.createRenderRoot();
        applyTheme(root);
        return root;
    }

    private async getBooks(): Promise<Book[]> {
        return client.call('BookController', 'getAllBooks');
    }

    protected override async firstUpdated() {
        this.addValidation();
        await this.loadAndFormatEnums();
        await this.loadBooks();
    }

    protected addValidation() {
        const model = this.binder.model;

        this.binder.for(model.bookAuthor).addValidator(new Min({
            message: 'Author should be at least 5 characters',
            value: 5
        }));

        this.binder.for(model.bookName).addValidator(new Min({
            message: 'Book name should be at least 5 characters',
            value: 5
        }));

        this.binder.for(model.genre).addValidator(new NotEmpty({
            message: 'Genre shouldn\'t be empty'
        }));

        this.binder.for(model.yearOfPublish).addValidator(new Positive({
            message: 'Year of publish should be between 1 and 2100'
        }));

        this.binder.for(model.publisher).addValidator(new Min({
            message: 'Publisher should be at least 5 characters',
            value: 5
        }));

        this.binder.for(model.description).addValidator(new Min({
            message: 'Description should be at least 20 characters',
            value: 20
        }));

        this.binder.for(model.isbn).addValidator(new Size({
            message: 'ISBN  should be between 10 and 30 characters',
            min: 10,
            max: 30
        }));

        this.binder.for(model.language).addValidator(new NotEmpty({
            message: 'Language shouldn\'t be empty'
        }));

        this.binder.for(model.content).addValidator(new Min({
            message: 'Content should be at least 50 characters',
            value: 50
        }));

        this.binder.validate();
    }

    private async loadAndFormatEnums() {
        let genres = await getGenres();
        this.genres = formatData(genres);
        let languages = await getLanguages();
        this.languages = formatData(languages);
    }

    private async loadBooks() {
        this.books = await this.getBooks();
    }

    protected async saveBook() {
        let book: Book = this.binder.value;
        try {
            let success = await this.callSaveBook(book);
            this.showNotification(success, '');
        } catch (e) {
            this.showNotification(false, (<Error>e).message);
        }
        this.binder.clear();
        await this.loadBooks();
    }

    protected closeSaveBookForm() {

    }

    private callSaveBook(book: Book): Promise<boolean> {
        return client.call('BookController', 'importBook', {book});
    }

    private showNotification(success: boolean, errMessage: string) {
        let message = success ? 'Book was saved' : 'Book wasn\'t saved. Reason: ' + errMessage;
        let theme = success ? 'success' : 'error';
        const notification = Notification.show(message, {
            position: "bottom-start"
        });
        notification.setAttribute('theme', theme);
    }

    protected override render() {
        return html`
            <vaadin-accordion>
                <vaadin-accordion-panel summary="Save Book">
                    <vaadin-vertical-layout theme="spacing">
                        <vaadin-form-layout .responsiveSteps="${this.responsiveSteps}">
                            <vaadin-text-field id="book-name"
                                               label="Book Name"
                                               colspan="3"
                                               ${field(this.binder.model.bookName)}></vaadin-text-field>
                            <vaadin-text-field id="book-author"
                                               label="Book Author"
                                               ${field(this.binder.model.bookAuthor)}></vaadin-text-field>
                            <vaadin-select id="genre" label="Genre"
                                           .items="${this.genres}"
                                           ${field(this.binder.model.genre)}></vaadin-select>
                            <vaadin-select id="language" label="Language"
                                           .items="${this.languages}"
                                           ${field(this.binder.model.language)}></vaadin-select>
                            <vaadin-number-field id="year-of-publish"
                                                 label="Year Of Publish"
                                                 ${field(this.binder.model.yearOfPublish)}></vaadin-number-field>
                            <vaadin-text-field id="publisher"
                                               label="Publisher"
                                               ${field(this.binder.model.publisher)}></vaadin-text-field>
                            <vaadin-text-field id="isbn"
                                               label="Isbn"
                                               ${field(this.binder.model.isbn)}></vaadin-text-field>
                            <vaadin-text-area id="description"
                                              label="Description"
                                              colspan="3"
                                              ${field(this.binder.model.description)}></vaadin-text-area>
                            <vaadin-text-area id="content"
                                              label="Content"
                                              colspan="3"
                                              ${field(this.binder.model.content)}></vaadin-text-area>
                        </vaadin-form-layout>
                        <vaadin-horizontal-layout theme="spacing">
                            <vaadin-button theme="primary"
                                           @click="${this.saveBook}"
                                           ?disabled=${this.binder.invalid}>Save
                            </vaadin-button>
                            <vaadin-button theme="secondary"
                                           @click="${this.closeSaveBookForm}">Cancel
                            </vaadin-button>
                        </vaadin-horizontal-layout>
                    </vaadin-vertical-layout>
            </vaadin-accordion>
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
            </vaadin-grid>`;
    }
}

export default Books;