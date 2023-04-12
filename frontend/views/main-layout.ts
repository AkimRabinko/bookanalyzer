import {css, html, LitElement} from 'lit';
import {customElement} from 'lit/decorators.js';

import '@vaadin/app-layout';
import '@vaadin/app-layout/vaadin-drawer-toggle';
import '@vaadin/icon';
import '@vaadin/icons';
import '@vaadin/tabsheet';
import '@vaadin/tabs';
import '@vaadin/accordion';
import {applyTheme} from 'Frontend/generated/theme';
import './books';
import './books-analysis'
import './lemma-analysis'


@customElement('main-layout')
export class MainLayout extends LitElement {
    static override styles = css`
      h1 {
        font-size: var(--lumo-font-size-l);
        margin: 0;
      }
    `;

    protected override createRenderRoot() {
        const root = super.createRenderRoot();
        applyTheme(root);
        return root;
    }

    protected override render() {
        return html`
            <vaadin-tabsheet style="height: 100%;">
                <h1 slot="prefix">Book Analyzer</h1>
                <vaadin-tabs slot="tabs" orientation="horizontal">
                    <vaadin-tab id="main">
                        <vaadin-icon icon="vaadin:book"></vaadin-icon>
                        <span>Books</span>
                    </vaadin-tab>
                    <vaadin-tab id="analyzed_books">
                        <vaadin-icon theme="icon-on-left" icon="vaadin:info-circle-o"></vaadin-icon>
                        <span>Books Analysis</span>
                    </vaadin-tab>
                    <vaadin-tab id="lemma_analysis">
                        <vaadin-icon theme="icon-on-left" icon="vaadin:magic"></vaadin-icon>
                        <span>Lemma Analysis</span>
                    </vaadin-tab>
                </vaadin-tabs>
                <div tab="main" style="height: 90%">
                    <books-template></books-template>
                </div>
                <div tab="analyzed_books" style="height: 90%">
                    <books-analysis-template></books-analysis-template>
                </div>
                <div tab="lemma_analysis" style="height: 90%">
                    <lemma-analysis-layout></lemma-analysis-layout>
                </div>
            </vaadin-tabsheet>
        `;
    }
}