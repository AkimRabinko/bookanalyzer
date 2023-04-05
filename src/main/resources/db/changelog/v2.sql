CREATE SCHEMA IF NOT EXISTS correction_en;

CREATE TABLE correction_en.rules
(
    ID                    SERIAL                NOT NULL PRIMARY KEY,
    ORIGINAL_WORD_PATTERN CHARACTER VARYING(10) NOT NULL,
    LEMMA_WORD_PATTERN    CHARACTER VARYING(10) NOT NULL
);

INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-a', '-ae');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-a', '-as');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-a', '-ae');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-a', '-as');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-a', '-ata');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-an', '-en');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-ch', '-ches');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-eau', '-eaus');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-eau', '-eaux');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-en', '-ens');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-en', '-ina');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-ex', '-ices');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-ex', '-exes');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-ex', '-ices');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-f(e)', '-ves');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-ieu', '-ieus');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-ieu', '-ieux');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-is', '-es');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-is', '-ises');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-is', '-ides');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-ix', '-ixes');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-ix', '-ices');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-nx', '-nxes');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-nx', '-nges');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-o', '-oes');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-o', '-os');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-o', '-i');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-o', '-os');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-o', '-i');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-on', '-a');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-on', '-ons');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-on', '-a');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-oo-', '-ee-');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-oof', '-oofs');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-oof', '-ooves');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-s', '-s');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-s', '-ses');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-sh', '-shes');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-um', '-a');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-um', '-ums');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-um', '-a');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-us', '-era');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-us', '-i');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-us', '-uses');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-us', '-era');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-us', '-uses');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-us', '-i');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-us', '-uses');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-us', '-ora');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-us', '-uses');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-us', '-us');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-x', '-xes');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-y', '-ies');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-zoon', '-zoa');
INSERT INTO correction_en.rules (ORIGINAL_WORD_PATTERN, LEMMA_WORD_PATTERN) VALUES ('-s', '-im');


CREATE TABLE correction_en.common_correction
(
    ID            SERIAL                 NOT NULL PRIMARY KEY,
    ORIGINAL_WORD CHARACTER VARYING(100) NOT NULL,
    LEMMA_WORD    CHARACTER VARYING(100) NOT NULL,
    VERIFIED      BOOLEAN                NOT NULL,
    RULE_ID       INTEGER DEFAULT 0
);

CREATE TABLE correction_en.manual_correction
(
    ID            SERIAL                 NOT NULL PRIMARY KEY,
    ORIGINAL_WORD CHARACTER VARYING(100) NOT NULL,
    LEMMA_WORD    CHARACTER VARYING(100) NOT NULL,
    VERIFIED      BOOLEAN                NOT NULL,
    RULE_ID       INTEGER DEFAULT 0
);

CREATE TABLE correction_en.hybrid_correction
(
    ID            SERIAL                 NOT NULL PRIMARY KEY,
    ORIGINAL_WORD CHARACTER VARYING(100) NOT NULL,
    LEMMA_WORD    CHARACTER VARYING(100) NOT NULL,
    VERIFIED      BOOLEAN                NOT NULL,
    RULE_ID       INTEGER DEFAULT 0
);

INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('fly', 'flown', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('know', 'known', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('bleed', 'bled', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('lend', 'lent', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('fall', 'fallen', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('ring', 'rung', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('bend', 'bent', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('do', 'did', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('run', 'ran', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('swear', 'sworn', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('choose', 'chose', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('fly', 'flew', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('hide', 'hidden', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('begin', 'begun', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('lead', 'led', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('stick', 'stuck', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('become', 'become', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('shut', 'shut', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('wake', 'woke', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('speed', 'sped', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('leave', 'left', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('shrink', 'shrunk', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('rise', 'rose', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('forgive', 'forgiven', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('sing', 'sung', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('understand', 'understood', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('come', 'come', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('wear', 'wore', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('get', 'got', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('sink', 'sank', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('cut', 'cut', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('rise', 'risen', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('shake', 'shook', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('think', 'thought', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('break', 'broken', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('bite', 'bit', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('let', 'let', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('teach', 'taught', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('grow', 'grown', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('shoot', 'shot', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('put', 'put', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('catch', 'caught', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('mean', 'meant', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('swim', 'swam', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('say', 'said', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('speak', 'spoken', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('build', 'built', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('drive', 'drove', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('eat', 'ate', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('write', 'written', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('hit', 'hit', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('draw', 'drew', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('draw', 'drawn', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('send', 'sent', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('beat', 'beaten', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('win', 'won', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('go', 'went', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('spread', 'spread', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('forget', 'forgotten', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('burn', 'burned', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('cost', 'cost', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('hide', 'hid', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('begin', 'began', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('drink', 'drunk', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('stand', 'stood', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('buy', 'bought', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('take', 'took', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('dig', 'dug', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('fight', 'fought', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('stink', 'stank', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('hurt', 'hurt', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('shine', 'shone', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('shrink', 'shrank', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('sting', 'stung', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('give', 'given', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('steal', 'stolen', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('tear', 'torn', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('hold', 'held', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('swear', 'swore', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('burn', 'burnt', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('breed', 'bred', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('feel', 'felt', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('have', 'had', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('throw', 'thrown', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('ride', 'ridden', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('stink', 'stunk', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('swim', 'swum', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('spend', 'spent', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('do', 'done', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('shake', 'shaken', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('show', 'shown', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('meet', 'met', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('tear', 'tore', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('bet', 'bet', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('break', 'broke', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('set', 'set', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('drink', 'drank', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('spill', 'spilled', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('blow', 'blown', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('pay', 'paid', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('throw', 'threw', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('sink', 'sunk', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('steal', 'stole', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('give', 'gave', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('forget', 'forgot', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('keep', 'kept', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('spill', 'spilt', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('lay', 'laid', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('bite', 'bitten', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('choose', 'chosen', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('come', 'came', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('write', 'wrote', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('ring', 'rang', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('lose', 'lost', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('see', 'saw', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('lean', 'leant', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('make', 'made', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('dream', 'dreamed', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('eat', 'eaten', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('lean', 'leaned', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('blow', 'blew', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('freeze', 'frozen', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('speak', 'spoke', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('take', 'taken', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('feed', 'fed', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('find', 'found', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('sell', 'sold', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('grow', 'grew', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('bring', 'brought', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('sit', 'sat', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('beat', 'beat', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('shoe', 'shod', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('sleep', 'slept', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('sweep', 'swept', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('show', 'showed', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('wake', 'woken', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('wear', 'worn', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('ride', 'rode', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('read', 'read', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('go', 'gone', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('run', 'run', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('tell', 'told', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('sing', 'sang', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('freeze', 'froze', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('swing', 'swung', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('hear', 'heard', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('drive', 'driven', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('see', 'seen', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('become', 'became', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('forgive', 'forgave', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('quit', 'quit', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('know', 'knew', true);
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD, VERIFIED) VALUES ('fall', 'fell', true);