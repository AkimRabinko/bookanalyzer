import {customElement, state} from "lit/decorators";
import {html, LitElement} from "lit";
import {applyTheme} from 'Frontend/generated/theme';
import type Pattern from "Frontend/generated/com/akimrabinko/bookanalyzer/analysis_module/lemma/model/Pattern";
import PatternModel from "Frontend/generated/com/akimrabinko/bookanalyzer/analysis_module/lemma/model/PatternModel";

import type Correction from "Frontend/generated/com/akimrabinko/bookanalyzer/analysis_module/lemma/model/Correction";
import CorrectionModel
    from "Frontend/generated/com/akimrabinko/bookanalyzer/analysis_module/lemma/model/CorrectionModel";
import CorrectionType from "Frontend/generated/com/akimrabinko/bookanalyzer/analysis_module/lemma/model/CorrectionType";
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
import '@vaadin/dialog';
import '@vaadin/details';
import '@vaadin/form-layout';
import {TextAreaValueChangedEvent} from "@vaadin/text-area";
import {columnBodyRenderer, GridColumnBodyLitRenderer} from "@vaadin/grid/lit";
import {DialogOpenedChangedEvent} from "@vaadin/dialog";
import {dialogHeaderRenderer, dialogRenderer} from "@vaadin/dialog/lit";
import {Binder, field} from "@hilla/form";


@customElement('lemma-analysis-layout')
export class LemmaAnalysis extends LitElement {

    @state()
    private dialogCorrectionOpened = false;

    @state()
    protected patterns: Pattern[] = [];

    @state()
    protected unverifiedCorrections: Correction[] = [];

    @state()
    protected verifiedCorrections: Correction[] = [];

    @state()
    protected manualCorrections: Correction[] = [];

    @state()
    protected manualPatterns: Pattern[] = [];

    @state()
    protected textForAnalysis: string = '';

    private ruleBinder = new Binder(this, PatternModel);

    private correctionBinder = new Binder(this, CorrectionModel);

    protected override createRenderRoot() {
        const root = super.createRenderRoot();
        applyTheme(root);
        return root;
    }

    protected override async firstUpdated() {
        this.patterns = await this.getAllPatterns();
        this.verifiedCorrections = await this.getVerifiedCorrections();
    }

    private getRuleDetailsById(ruleId: number): string {
        let pattern = this.patterns.find((pattern) => pattern.id === ruleId);
        if (pattern) {
            return 'ID: "' + pattern.id
                + '", Original Word Pattern: "' + pattern.originalWordPattern
                + '", Lemma word pattern: "' + pattern.lemmaWordPattern + '"';
        }
        return 'Undefined pattern';
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

    private getVerifiedCorrections(): Promise<Correction[]> {
        return client.call('LemmaController', 'getAllCorrections');
    }

    private correctionTypeColumnRenderer: GridColumnBodyLitRenderer<Correction> = (correction) => {
        return html`
            <span theme="badge error">
                <vaadin-icon
                        icon="vaadin:exclamation-circle-o"
                        style="padding: var(--lumo-space-xs)"></vaadin-icon>
                <span>${correction.correctionType}</span>
    </span>`
    };

    private ruleIdColumnRenderer: GridColumnBodyLitRenderer<Correction> = (correction) => {
        let spanId = 'span_rule_' + correction.ruleId + correction.id;
        let buttonId = 'button_rule_' + correction.ruleId + correction.id;
        let tooltipText = this.getRuleDetailsById(correction.ruleId);
        return html`
            <span id="${spanId}"
                  style="cursor: pointer; padding: 8px 13px;"
                  theme="badge">
                ${correction.ruleId}
            </span>
            <vaadin-tooltip
                    for="${spanId}"
                    text="${tooltipText}">
            </vaadin-tooltip>
            <vaadin-button id="${buttonId}" theme="icon small"
                           @click="${this.openCorrectionDialog}">
                <vaadin-icon icon="lumo:plus"></vaadin-icon>
                <vaadin-tooltip
                        for="${buttonId}"
                        text="Add rule or Correction">
                </vaadin-tooltip>
            </vaadin-button>`
    };

    private renderCorrectionDialog = () => html`
        <vaadin-tabsheet style="height: 100%">
            <vaadin-tabs slot="tabs" orientation="horizontal">
                <vaadin-tab id="add_rule">
                    <vaadin-icon theme="icon-on-left" icon="vaadin:filter"></vaadin-icon>
                    <span>Add Rule</span>
                </vaadin-tab>
                <vaadin-tab id="add_correction">
                    <vaadin-icon theme="icon-on-left" icon="lumo:edit"></vaadin-icon>
                    <span>Add Correction</span>
                </vaadin-tab>
            </vaadin-tabs>
            <div tab="add_rule">
                <vaadin-form-layout>
                    <vaadin-number-field label="Id" hidden="hidden"
                                         ${field(this.ruleBinder.model.id)}>-1
                    </vaadin-number-field>
                    <vaadin-text-field label="Original Word Pattern"
                                       ${field(this.ruleBinder.model.originalWordPattern)}>
                    </vaadin-text-field>
                    <vaadin-text-field label="Lemma Word Pattern"
                                       ${field(this.ruleBinder.model.lemmaWordPattern)}>
                    </vaadin-text-field>
                </vaadin-form-layout>
                <vaadin-horizontal-layout theme="spacing">
                    <vaadin-button theme="primary" @click="${this.addRule}">Add Rule</vaadin-button>
                </vaadin-horizontal-layout>
            </div>
            <div tab="add_correction">
                <vaadin-form-layout>
                    <vaadin-number-field label="Correction Type" hidden="hidden"
                                         ${field(this.correctionBinder.model.id)}>-1
                    </vaadin-number-field>
                    <vaadin-text-field label="Original Word"
                                       ${field(this.correctionBinder.model.originalWord)}>
                    </vaadin-text-field>
                    <vaadin-text-field label="Lemma Word"
                                       ${field(this.correctionBinder.model.lemmaWord)}>
                    </vaadin-text-field>
                    <vaadin-text-field label="Correction Type" hidden="hidden"
                                       ${field(this.correctionBinder.model.correctionType)}>
                        ${CorrectionType.MANUAL}
                    </vaadin-text-field>
                    <vaadin-number-field label="Rule Id" hidden="hidden"
                                         ${field(this.correctionBinder.model.ruleId)}>
                        0
                    </vaadin-number-field>
                </vaadin-form-layout>
                <vaadin-horizontal-layout theme="spacing">
                    <vaadin-button theme="primary" @click="${this.addCorrection}">Add Correction</vaadin-button>
                </vaadin-horizontal-layout>
            </div>
        </vaadin-tabsheet>`;

    private openCorrectionDialog() {
        this.dialogCorrectionOpened = true;
    }

    private closeCorrectionDialog() {
        this.dialogCorrectionOpened = false;
    }

    protected async addRule() {
        this.manualPatterns.push(this.ruleBinder.value);
    }

    protected async saveRulesAndDeleteUnverifiedData() {
        let saved = await this.saveRules();
        if (saved) {
            await this.deleteUnverifiedCorrections();
        }
    }

    protected async saveRules(): Promise<boolean> {
        let patterns = this.manualPatterns;
        return client.call('PatternController', 'savePatterns', {patterns});
    }

    protected async addCorrection() {
        this.manualCorrections.push(this.correctionBinder.value);
    }

    protected async saveCorrectionsAndDeleteUnverifiedData() {
       let saved = await this.saveCorrections();
       if (saved) {
           await this.deleteUnverifiedCorrections();
       }
    }

    private saveCorrections(): Promise<boolean> {
        let correctionsToSave = this.manualCorrections;
        return client.call('LemmaController', 'saveCorrections', {correctionsToSave});
    }

    private deleteUnverifiedCorrections(): Promise<boolean> {
        return client.call('LemmaController', 'deleteUnverifiedCorrection');
    }

    protected override render() {
        return html`
            <vaadin-details summary="Analysis & Results" opened>
                <vaadin-tabsheet style="height: 100%;">
                    <vaadin-tabs slot="tabs" orientation="horizontal">
                        <vaadin-tab id="lemma_word_analysis">
                            <vaadin-icon theme="icon-on-left" icon="lumo:eye"></vaadin-icon>
                            <span>Lemma Word Analysis</span>
                        </vaadin-tab>
                        <vaadin-tab id="patterns">
                            <vaadin-icon icon="vaadin:filter"></vaadin-icon>
                            <span>Patterns</span>
                        </vaadin-tab>
                        <vaadin-tab id="verified_corrections">
                            <vaadin-icon icon="lumo:edit"></vaadin-icon>
                            <span>Verified Corrections</span>
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
                        <vaadin-button theme="primary" @click="${this.runLemmaWordAnalysis}"
                                       ?disabled="${this.textForAnalysis.length === 0}">
                            Analyze
                        </vaadin-button>
                        <vaadin-grid .items="${this.unverifiedCorrections}">
                            <vaadin-grid-sort-column path="correctionType"
                                                     ${columnBodyRenderer(this.correctionTypeColumnRenderer, [])}>
                            </vaadin-grid-sort-column>
                            <vaadin-grid-sort-column path="id"></vaadin-grid-sort-column>
                            <vaadin-grid-sort-column path="lemmaWord"></vaadin-grid-sort-column>
                            <vaadin-grid-sort-column path="originalWord"></vaadin-grid-sort-column>
                            <vaadin-grid-sort-column path="ruleId"
                                                     ${columnBodyRenderer(this.ruleIdColumnRenderer, [])}>
                            </vaadin-grid-sort-column>
                        </vaadin-grid>
                    </div>
                    <div tab="verified_corrections" style="height: 90%">
                        <vaadin-grid .items="${this.verifiedCorrections}">
                            <vaadin-grid-sort-column path="id"></vaadin-grid-sort-column>
                            <vaadin-grid-sort-column path="correctionType"></vaadin-grid-sort-column>
                            <vaadin-grid-sort-column path="originalWord"></vaadin-grid-sort-column>
                            <vaadin-grid-sort-column path="lemmaWord"></vaadin-grid-sort-column>
                            <vaadin-grid-sort-column path="ruleId"></vaadin-grid-sort-column>
                        </vaadin-grid>
                    </div>
                </vaadin-tabsheet>
            </vaadin-details>
            <vaadin-details summary="Correction To Save">
                <vaadin-horizontal-layout>
                    <vaadin-button @click="${this.saveCorrectionsAndDeleteUnverifiedData}" theme="primary">
                        Save Corrections
                    </vaadin-button>
                </vaadin-horizontal-layout>
                <vaadin-grid .items="${this.manualCorrections}">
                    <vaadin-grid-sort-column path="id"></vaadin-grid-sort-column>
                    <vaadin-grid-sort-column path="correctionType"></vaadin-grid-sort-column>
                    <vaadin-grid-sort-column path="originalWord"></vaadin-grid-sort-column>
                    <vaadin-grid-sort-column path="lemmaWord"></vaadin-grid-sort-column>
                    <vaadin-grid-sort-column path="ruleId"></vaadin-grid-sort-column>
                </vaadin-grid>
            </vaadin-details>
            <vaadin-details summary="Rules To Save">
                <vaadin-horizontal-layout>
                    <vaadin-button @click="${this.saveRulesAndDeleteUnverifiedData}" theme="primary">
                        Save Rules
                    </vaadin-button>
                </vaadin-horizontal-layout>
                <vaadin-grid .items="${this.manualPatterns}">
                    <vaadin-grid-sort-column path="id"></vaadin-grid-sort-column>
                    <vaadin-grid-sort-column path="lemmaWordPattern"></vaadin-grid-sort-column>
                    <vaadin-grid-sort-column path="originalWordPattern"></vaadin-grid-sort-column>
                </vaadin-grid>
            </vaadin-details>
            <vaadin-dialog
                    header-title="Add correction or Pattern rule"
                    .opened="${this.dialogCorrectionOpened}"
                    @opened-changed="${(event: DialogOpenedChangedEvent) => {
                        this.dialogCorrectionOpened = event.detail.value;
                    }}"
                    ${dialogHeaderRenderer(() => html`
                                <vaadin-button theme="tertiary" @click="${this.closeCorrectionDialog}">
                                    <vaadin-icon icon="lumo:cross"></vaadin-icon>
                                </vaadin-button>`,
                            [])}
                    ${dialogRenderer(this.renderCorrectionDialog, [])}>
            </vaadin-dialog>`;
    }
}