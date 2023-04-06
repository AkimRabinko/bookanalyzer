CREATE SCHEMA IF NOT EXISTS correction_en;

CREATE TABLE correction_en.rules
(
    ID                    BIGSERIAL                NOT NULL PRIMARY KEY,
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
    ID            BIGSERIAL                 NOT NULL PRIMARY KEY,
    ORIGINAL_WORD CHARACTER VARYING(100) NOT NULL,
    LEMMA_WORD    CHARACTER VARYING(100) NOT NULL,
    RULE_ID       INTEGER DEFAULT 0
);

CREATE TABLE correction_en.manual_correction
(
    ID            BIGSERIAL                 NOT NULL PRIMARY KEY,
    ORIGINAL_WORD CHARACTER VARYING(100) NOT NULL,
    LEMMA_WORD    CHARACTER VARYING(100) NOT NULL,
    RULE_ID       INTEGER DEFAULT 0
);

CREATE TABLE correction_en.hybrid_correction
(
    ID            BIGSERIAL                 NOT NULL PRIMARY KEY,
    ORIGINAL_WORD CHARACTER VARYING(100) NOT NULL,
    LEMMA_WORD    CHARACTER VARYING(100) NOT NULL,
    RULE_ID       INTEGER DEFAULT 0
);

CREATE TABLE correction_en.tmp_correction
(
    ID            BIGSERIAL                 NOT NULL PRIMARY KEY,
    ORIGINAL_WORD CHARACTER VARYING(100) NOT NULL,
    LEMMA_WORD    CHARACTER VARYING(100) NOT NULL,
    RULE_ID       INTEGER DEFAULT 0
);

INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('fly', 'flown');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('know', 'known');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('bleed', 'bled');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('lend', 'lent');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('fall', 'fallen');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('ring', 'rung');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('bend', 'bent');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('do', 'did');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('run', 'ran');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('swear', 'sworn');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('choose', 'chose');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('fly', 'flew');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('hide', 'hidden');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('begin', 'begun');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('lead', 'led');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('stick', 'stuck');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('become', 'become');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('shut', 'shut');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('wake', 'woke');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('speed', 'sped');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('leave', 'left');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('shrink', 'shrunk');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('rise', 'rose');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('forgive', 'forgiven');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('sing', 'sung');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('understand', 'understood');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('come', 'come');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('wear', 'wore');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('get', 'got');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('sink', 'sank');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('cut', 'cut');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('rise', 'risen');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('shake', 'shook');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('think', 'thought');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('break', 'broken');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('bite', 'bit');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('let', 'let');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('teach', 'taught');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('grow', 'grown');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('shoot', 'shot');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('put', 'put');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('catch', 'caught');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('mean', 'meant');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('swim', 'swam');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('say', 'said');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('speak', 'spoken');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('build', 'built');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('drive', 'drove');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('eat', 'ate');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('write', 'written');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('hit', 'hit');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('draw', 'drew');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('draw', 'drawn');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('send', 'sent');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('beat', 'beaten');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('win', 'won');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('go', 'went');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('spread', 'spread');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('forget', 'forgotten');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('burn', 'burned');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('cost', 'cost');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('hide', 'hid');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('begin', 'began');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('drink', 'drunk');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('stand', 'stood');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('buy', 'bought');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('take', 'took');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('dig', 'dug');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('fight', 'fought');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('stink', 'stank');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('hurt', 'hurt');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('shine', 'shone');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('shrink', 'shrank');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('sting', 'stung');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('give', 'given');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('steal', 'stolen');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('tear', 'torn');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('hold', 'held');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('swear', 'swore');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('burn', 'burnt');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('breed', 'bred');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('feel', 'felt');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('have', 'had');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('throw', 'thrown');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('ride', 'ridden');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('stink', 'stunk');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('swim', 'swum');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('spend', 'spent');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('do', 'done');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('shake', 'shaken');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('show', 'shown');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('meet', 'met');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('tear', 'tore');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('bet', 'bet');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('break', 'broke');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('set', 'set');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('drink', 'drank');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('spill', 'spilled');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('blow', 'blown');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('pay', 'paid');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('throw', 'threw');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('sink', 'sunk');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('steal', 'stole');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('give', 'gave');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('forget', 'forgot');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('keep', 'kept');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('spill', 'spilt');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('lay', 'laid');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('bite', 'bitten');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('choose', 'chosen');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('come', 'came');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('write', 'wrote');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('ring', 'rang');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('lose', 'lost');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('see', 'saw');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('lean', 'leant');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('make', 'made');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('dream', 'dreamed');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('eat', 'eaten');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('lean', 'leaned');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('blow', 'blew');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('freeze', 'frozen');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('speak', 'spoke');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('take', 'taken');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('feed', 'fed');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('find', 'found');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('sell', 'sold');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('grow', 'grew');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('bring', 'brought');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('sit', 'sat');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('beat', 'beat');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('shoe', 'shod');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('sleep', 'slept');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('sweep', 'swept');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('show', 'showed');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('wake', 'woken');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('wear', 'worn');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('ride', 'rode');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('read', 'read');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('go', 'gone');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('run', 'run');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('tell', 'told');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('sing', 'sang');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('freeze', 'froze');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('swing', 'swung');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('hear', 'heard');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('drive', 'driven');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('see', 'seen');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('become', 'became');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('forgive', 'forgave');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('quit', 'quit');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('know', 'knew');
INSERT INTO correction_en.common_correction (ORIGINAL_WORD, LEMMA_WORD) VALUES ('fall', 'fell');