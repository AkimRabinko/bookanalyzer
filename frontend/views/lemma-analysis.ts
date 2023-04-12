import {customElement, state} from "lit/decorators";
import {html, LitElement} from "lit";
import {applyTheme} from 'Frontend/generated/theme';
import type Pattern from "Frontend/generated/com/akimrabinko/bookanalyzer/analysis_module/lemma/model/Pattern";
import type Correction from "Frontend/generated/com/akimrabinko/bookanalyzer/analysis_module/lemma/model/Correction";
import client from 'Frontend/generated/connect-client.default';

import '@vaadin/tabsheet';
import '@vaadin/tabs';
import '@vaadin/grid';
import '@vaadin/grid/vaadin-grid-sort-column.js';
import '@vaadin/icon';
import '@vaadin/icons';
import '@vaadin/text-field';
import '@vaadin/tooltip';
import '@vaadin/vaadin-lumo-styles/vaadin-iconset.js';
import '@vaadin/button';
import '@vaadin/horizontal-layout';
import {TextAreaValueChangedEvent} from "@vaadin/text-area";
import {columnBodyRenderer, GridColumnBodyLitRenderer} from "@vaadin/grid/lit";


@customElement('lemma-analysis-layout')
export class LemmaAnalysis extends LitElement {

    @state()
    protected patterns: Pattern[] = [];
    @state()
    protected unverifiedCorrections: Correction[] = [];

    @state()
    protected textForAnalysis: string = '';

    protected override createRenderRoot() {
        const root = super.createRenderRoot();
        applyTheme(root);
        return root;
    }

    protected override async firstUpdated() {
        this.patterns = await this.getAllPatterns();
    }

    private getRuleDetailsById(ruleId: number): string {
        let pattern = this.patterns.find((pattern) => pattern.id === ruleId);
        if (pattern) {
            return 'ID: "' + pattern.id
                + '", Original Word Pattern: "' + pattern.originalWordPattern
                + '", Lemma word pattern: "' + pattern.lemmaWordPattern + '"';
        }
        return '';
    }

    private getAllPatterns(): Promise<Pattern[]> {
        return client.call('PatternController', 'getAllPatterns');
    }

    protected async runLemmaWordAnalysis() {
        let status = await this.runLemmaAnalysisOnText(this.textForAnalysis);
        if (status) {
            this.unverifiedCorrections = await this.getUnverifiedCorrections();
        }
    }

    private runLemmaAnalysisOnText(text: string): Promise<boolean> {
        return client.call('LemmaAnalysisController', 'runLemmaAnalysisOnText', {text});
    }

    private saveVerifiedAnalysis(verifiedCorrections: Correction[]): Promise<boolean> {
        return client.call('LemmaAnalysisController', 'saveVerifiedAnalysis', {verifiedCorrections});
    }

    private getUnverifiedCorrections(): Promise<Correction[]> {
        return client.call('LemmaController', 'getUnverifiedCorrections');
    }

    private ruleIdColumnRenderer: GridColumnBodyLitRenderer<Correction> = (correction) => {
        let buttonId = 'button_rule_' + correction.ruleId + correction.id;
        let tooltipText = this.getRuleDetailsById(correction.ruleId);
        return html`
            <span id="${buttonId}" style="cursor: pointer">${correction.ruleId}</span>
            <vaadin-tooltip
                    for="${buttonId}"
                    text="${tooltipText}">
            </vaadin-tooltip>`
    };

    protected override render() {
        return html`
            <vaadin-tabsheet style="height: 100%;">
                <vaadin-tabs slot="tabs" orientation="horizontal">
                    <vaadin-tab id="patterns">
                        <vaadin-icon icon="vaadin:filter"></vaadin-icon>
                        <span>Patterns</span>
                    </vaadin-tab>
                    <vaadin-tab id="lemma_word_analysis">
                        <vaadin-icon theme="icon-on-left" icon="lumo:eye"></vaadin-icon>
                        <span>Lemma Word Analysis</span>
                    </vaadin-tab>
                </vaadin-tabs>
                <div tab="patterns" style="height: 90%">
                    <vaadin-grid .items="${this.patterns}">
                        <vaadin-grid-sort-column path="id"></vaadin-grid-sort-column>
                        <vaadin-grid-sort-column path="lemmaWordPattern"></vaadin-grid-sort-column>
                        <vaadin-grid-sort-column path="originalWordPattern"></vaadin-grid-sort-column>
                    </vaadin-grid>
                </div>
                <div tab="lemma_word_analysis" style="height: 90%">
                    <vaadin-horizontal-layout>
                        <vaadin-text-area
                                style="width: 100%; max-height: 400px;"
                                label="Put text and press 'Analyze' to start analysis"
                                .value="${this.textForAnalysis}"
                                @value-changed="${(event: TextAreaValueChangedEvent) => {
                                    this.textForAnalysis = event.detail.value;
                                }}"
                        ></vaadin-text-area>
                    </vaadin-horizontal-layout>
                    <vaadin-button theme="primary" @click="${this.runLemmaWordAnalysis}">Analyze</vaadin-button>
                    <vaadin-grid .items="${this.unverifiedCorrections}">
                        <vaadin-grid-sort-column path="correctionType"></vaadin-grid-sort-column>
                        <vaadin-grid-sort-column path="id"></vaadin-grid-sort-column>
                        <vaadin-grid-sort-column path="lemmaWord"></vaadin-grid-sort-column>
                        <vaadin-grid-sort-column path="originalWord"></vaadin-grid-sort-column>
                        <vaadin-grid-sort-column path="ruleId"
                                                 ${columnBodyRenderer(this.ruleIdColumnRenderer, [])}>
                        </vaadin-grid-sort-column>
                    </vaadin-grid>
                </div>
            </vaadin-tabsheet>
        `;
    }
}