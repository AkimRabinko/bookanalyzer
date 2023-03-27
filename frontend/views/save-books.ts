import {html, LitElement} from "lit";
import BookModel from "Frontend/generated/com/akimrabinko/bookanalyzer/model/BookModel";
import Book from "Frontend/generated/com/akimrabinko/bookanalyzer/model/Book";
import {customElement, state} from "lit/decorators.js";
import '@vaadin/form-layout';
import '@vaadin/text-field';
import '@vaadin/text-area';
import '@vaadin/number-field';
import '@vaadin/select';
import {applyTheme} from 'Frontend/generated/theme';
import {FormLayoutResponsiveStep} from "@vaadin/form-layout";
import {formatData, getGenres, getLanguages} from "Frontend/views/utils/enums";
import {Binder, field} from "@hilla/form";
import client from 'Frontend/generated/connect-client.default';

@customElement('save-books-template')
class SaveBooks extends LitElement {
    @state()
    protected genres: Object[] = [];
    @state()
    protected languages: Object[] = [];

    private binder = new Binder(this, BookModel);


    private responsiveSteps: FormLayoutResponsiveStep[] = [
        {minWidth: 0, columns: 1},
        {minWidth: '600px', columns: 3}
    ];

    protected override async firstUpdated() {
        let genres = await getGenres();
        this.genres = formatData(genres);
        let languages = await getLanguages();
        this.languages = formatData(languages);
    }

    protected override createRenderRoot() {
        const root = super.createRenderRoot();
        applyTheme(root);
        return root;
    }

    protected async saveBook() {
        let book: Book = this.binder.value;
        await this.callSaveBook(book);
        this.binder.clear();
    }

    private async callSaveBook(book: Book) {
        client.call('BookController', 'importBook', {book});
    }


    protected override render() {
        return html`
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
                    <vaadin-button theme="secondary">Cancel</vaadin-button>
                </vaadin-horizontal-layout>
            </vaadin-vertical-layout>`;
    }
}

export default SaveBooks;