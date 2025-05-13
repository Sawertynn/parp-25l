module Dialogues where

import State
import Place
import Item
import ItemsActions

import Data.List (nub, find)
import Data.Maybe (isJust)
import qualified Data.Map as Map

data DialogueType = Ask | Shout
    deriving (Eq, Show)

data Dialogue = Dialogue {
    di_personName :: String,
    di_placeName :: String,
    di_type :: DialogueType,
    di_topicName :: String,
    di_condition :: State -> Bool,
    di_effect :: State -> State,
    di_content :: [String]
    }

-- Default condition: always available
alwaysTrue :: State -> Bool
alwaysTrue _ = True

-- Default effect: no state change
doNothing :: State -> State
doNothing = id

allDialogues :: [Dialogue]
allDialogues = [
    -- Sekretarz
    Dialogue {
        di_personName = "sekretarz",
        di_placeName = "urząd",
        di_type = Ask,
        di_topicName = "a38",
        di_condition = alwaysTrue,
        di_effect = doNothing,
        di_content = [
            "Sekretarz: Zarejestrować okręt tak? Nie, źle was skierowano. Musicie zawrócić do kapitana portu.",
            "Asterix: Co? Nie, nie chcemy rejestrować okrętu... On chyba jest głuchy.",
            "Sekretarz: CO!?",
            "Obelix: Może trzeba na niego krzyknąć?",
            "Asterix: To by było niemiłe...",
            "",
            "Asterix: Bohaterowie przemyśleli sprawę.",
            "*Możesz wykrzyczeć coś do kogoś - shout sekretarz a38*"
        ]
    },
    Dialogue {
        di_personName = "sekretarz",
        di_placeName = "urząd",
        di_type = Shout,
        di_topicName = "a38",
        di_condition = \state -> areItemsInHolding ["niebieski_formularz", "fioletowy_formularz"] state,
        di_effect = doNothing,
        di_content = [
            "Sekretarz: Aaaa, to wy z tymi formularzami...",
            "Sekretarz: No dobrze. Skoro macie i niebieski, i fioletowy...",
            "Sekretarz: Udajcie się do okienka 77. Piętro 2, korytarz L, wejście K. Ale cicho!",
            "*Nowa lokacja odblokowana: \"okienko77\"*"
        ]
    },
    Dialogue {
        di_personName = "sekretarz",
        di_placeName = "urząd",
        di_type = Shout,
        di_topicName = "a38",
        di_condition = \state -> not (areItemsInHolding ["niebieski_formularz", "fioletowy_formularz"] state),
        di_effect = doNothing,
        di_content = [
            "Sekretarz: NIE KRZYCZ TUTAJ DOBRZE? CO ZA WYCHOWANIE! NA JOWISZA ZA KOGO WY SIE UWAŻACIE.",
            "Sekretarz: Poszukajcie okienka nr. 1. Korytarzem w lewo, ostatnie drzwi na prawo.",
            "*Nowa lokacja odblokowana: \"okienko1\"*",
            "*Możesz udać się do innego miejsca - go okienko1*"
        ]
    },
    Dialogue {
        di_personName = "urzędnik",
        di_placeName = "dziwne_biuro",
        di_type = Ask,
        di_topicName = "okienko1",
        di_condition = alwaysTrue,
        di_effect = doNothing,
        di_content = [
            "Urzędnik: Sprawdźcie plan. Szóste piętro. I proszę zamknąć za sobą drzwi. Co za bezczelność... Proszę dalej, panienko.",
            "Asterix: Chyba kogoś przeszkodziliśmy...",
            "*Nowa lokacja odblokowana: \"szóste_piętro\"*"
        ]
    },
    Dialogue {
        di_personName = "urzędniczka",
        di_placeName = "parter",
        di_type = Ask,
        di_topicName = "a38",
        di_condition = alwaysTrue,
        di_effect = doNothing,
        di_content = [
            "Urzędniczka: A38? Nie, źle was poinformowano. Musicie iść do okienka nr. 2.",
            "Asterix: Czyli musimy iść dalej...",
            "*Nowa lokacja odblokowana: \"okienko2\"*"
        ]
    },
    Dialogue {
        di_personName = "urzędniczka",
        di_placeName = "okienko2",
        di_type = Ask,
        di_topicName = "a38",
        di_condition = alwaysTrue,
        di_effect = doNothing,
        di_content = [
            "Urzędniczka: Numer 2? Hm... Nie, to nie tutaj. Tutaj jest okienko numer 4. To obok to numer 8.",
            "Urzędniczka: Jeśli bardzo państwu zależy, proszę popytać portiera.",
            "Asterix: Okienko 2, które jest czwórką, a obok ósemka...",
            "Obelix: A może by tak rzucić to wszystko i wrócić do dzików?",
            "*Nowa lokacja odblokowana: \"portiernia\"*"
        ]
    },
    Dialogue {
        di_personName = "portier",
        di_placeName = "portiernia",
        di_type = Ask,
        di_topicName = "okienko2",
        di_condition = alwaysTrue,
        di_effect = doNothing,
        di_content = [
            "Portier: CO?",
            "Asterix: Chyba potrzebujemy formularza A39, żeby nas ktoś usłyszał."
        ]
    },
    Dialogue {
        di_personName = "portier",
        di_placeName = "portiernia",
        di_type = Shout,
        di_topicName = "okienko2",
        di_condition = alwaysTrue,
        di_effect = doNothing,
        di_content = [
            "Portier: COOOOO?!?!?!",
            "Rozmowę przypadkiem usłyszał przechodzący obok prefekt.",
            "Prefekt: No, no… tylko spokojnie. Tutaj przecież ludzie pracują.",
            "Prefekt: Przyjacielu, powiedz — czego potrzebujesz?"
        ]
    },
    Dialogue {
        di_personName = "prefekt",
        di_placeName = "portiernia",
        di_type = Ask,
        di_topicName = "okienko2",
        di_condition = alwaysTrue,
        di_effect = doNothing,
        di_content = [
            "Prefekt: Numer 2? Zaraz... gdzie ono się teraz znajduje?",
            "Portier: Gdy widziałem je po raz ostatni, Panie Prefekcie, było na trzecim piętrze, korytarz szósty. Łatwo trafić.",
            "Prefekt: No, widzicie Panowie? Teraz już wszystko jasne. I po co to całe zamieszanie?",
            "*Nowa lokacja odblokowana: \"trzecie_piętro\"*"
        ]
    },
    Dialogue {
        di_personName = "prefekt",
        di_placeName = "portiernia",
        di_type = Ask,
        di_topicName = "a38",
        di_condition = alwaysTrue,
        di_effect = doNothing,
        di_content = [
            "Asterix: Prefekt, czy wie Pan, gdzie znajduje się formularz A38?",
            "Prefekt: A38? O nie, znowu ten koszmar...",
            "Prefekt: Proszę wybaczyć, ale kawa mi stygnie, a formularze to nie moja działka.",
            "Prefekt: Na trzecim piętrze na pewno ktoś będzie wiedział więcej. Jeśli jeszcze pamiętają.",
            "Asterix: Zaczynam się zastanawiać, czy ten formularz w ogóle istnieje.",
            "Obelix: A ja zaczynam podejrzewać, że nie zdążymy dziś na obiad..."
        ]
    },
    Dialogue {
        di_personName = "urzędniczka",
        di_placeName = "trzecie_piętro",
        di_type = Ask,
        di_topicName = "a38",
        di_condition = alwaysTrue,
        di_effect = doNothing,
        di_content = [
            "Urzędniczka: Nie widzi Pan, że jestem zajęta? Proszę poczekać.",
            "Urzędniczki wracają do rozmowy o znajomej i jej domniemanych aferach, zupełnie ignorując obecność Galów."
        ]
    },
    Dialogue {
        di_personName = "urzędniczka",
        di_placeName = "trzecie_piętro",
        di_type = Shout,
        di_topicName = "a38",
        di_condition = alwaysTrue,
        di_effect = doNothing,
        di_content = [
            "Urzędniczka: Och, ci ludzie są naprawdę niemożliwi. Krzyczeć w biurze? To przecież skandal!",
            "Urzędniczka: Zaświadczenie A38, tak? A czy ma pan niebieski formularz?",
            "*Możesz teraz zapytać o niebieski_formularz*"
        ]
    },
    Dialogue {
        di_personName = "urzędniczka",
        di_placeName = "trzecie_piętro",
        di_type = Ask,
        di_topicName = "niebieski_formularz",
        di_condition = alwaysTrue,
        di_effect = doNothing,
        di_content = [
            "Urzędniczka: W celu uzyskania zaświadczenia A38 należy najpierw przedstawić niebieski formularz.",
            "Urzędniczka: Proszę udać się do okienka nr 8.",
            "Asterix: Och... Przecież już tam byliśmy...",
            "*Nowa lokacja odblokowana: \"okienko8\"*"
        ]
    },
    Dialogue {
        di_personName = "urzędniczka",
        di_placeName = "otwarte_okienko8",
        di_type = Ask,
        di_topicName = "niebieski_formularz",
        di_condition = alwaysTrue,
        di_effect = doNothing,
        di_content = [
            "Urzędniczka: Niebieski formularz? To nie tutaj. Okienko 35, czwarte piętro.",
            "Asterix: Ciekawe, ile w tym budynku jest pięter...",
            "Obelix: Mam nadzieję, że na czwartym piętrze mają coś do jedzenia.",
            "*Nowa lokacja odblokowana: \"okienko35\"*"
        ]
    },
    Dialogue {
        di_personName = "urzędniczka",
        di_placeName = "okienko35",
        di_type = Ask,
        di_topicName = "niebieski_formularz",
        di_condition = \state -> areItemsInHolding ["fioletowy_formularz"] state,
        di_effect = doNothing,
        di_content = [
            "Urzędniczka: Przecież macie już fioletowy formularz w ręku! Nie wiem nic o niebieskim formularzu. Dajcie mi spokój.",
            "Urzędniczka: Idźcie do okienka 42, bo urząd się zaraz zamknie!"
        ]
    },
    Dialogue {
        di_personName = "urzędniczka",
        di_placeName = "okienko35",
        di_type = Ask,
        di_topicName = "niebieski_formularz",
        di_condition = \state -> not (areItemsInHolding ["fioletowy_formularz"] state) && not (isItemHere "fioletowy_formularz" state),
        di_effect = \state -> putItemHere fioletowy_formularz state,
        di_content = [
            "Urzędniczka: Dobrze, już wam go kładę. Macie ten fioletowy formularz w zasięgu ręki.",
            "Urzędniczka: Podnieście go i przestańcie zawracać głowę z tym niebieskim formularzem.",
            "Urzędniczka: Idźcie do okienka 42, bo urząd zaraz zamyka drzwi!",
            "*Fioletowy formularz jest dostępny do wzięcia przez polecenie \"take fioletowy_formularz\"*"
        ]
    },
    Dialogue {
        di_personName = "urzędniczka",
        di_placeName = "okienko35",
        di_type = Ask,
        di_topicName = "niebieski_formularz",
        di_condition = \state -> isItemHere "fioletowy_formularz" state,
        di_effect = doNothing,
        di_content = [
            "Urzędniczka: Przecież fioletowy formularz już tu leży! Macie go w zasięgu ręki. Dajcie mi spokój z tym niebieskim formularzem.",
            "Urzędniczka: Idźcie do okienka 42, bo urząd zaraz zamyka drzwi!",
            "*Nowa lokacja odblokowana: \"okienko42\"*"
        ]
    },
    Dialogue {
        di_personName = "urzędniczka",
        di_placeName = "okienko42",
        di_type = Ask,
        di_topicName = "a38",
        di_condition = \state -> not (areItemsInHolding ["fioletowy_formularz"] state),
        di_effect = doNothing,
        di_content = [
            "Urzędniczka: Najpierw będziecie potrzebować fioletowego formularza.",
            "*Wróćcie do okienka 35 poleceniem \"go okienko35\"*"
        ]
    },
    Dialogue {
        di_personName = "urzędniczka",
        di_placeName = "okienko42",
        di_type = Ask,
        di_topicName = "a38",
        di_condition = \state ->
            areItemsInHolding ["fioletowy_formularz"] state &&
            not (areItemsInHolding ["niebieski_formularz"] state) &&
            not (isItemHere "niebieski_formularz" state),
        di_effect = \state -> putItemHere niebieski_formularz state,
        di_content = [
            "Urzędniczka: O, to dobrze - fioletowy formularz macie.",
            "Urzędniczka: To jeszcze niebieski - proszę bardzo, kładę go tu. Z tymi formularzami możecie już iść dalej.",
            "Urzędniczka: Okienko 77. Piętro 2, korytarz L, wejście K. Tam powinni wam pomóc.",
            "*\"niebieski_formularz\" jest dostępny do wzięcia przez polecenie \"take\"*",
            "*Nowa lokacja odblokowana: \"okienko77\"*"
        ]
    },
    Dialogue {
        di_personName = "urzędniczka",
        di_placeName = "okienko42",
        di_type = Ask,
        di_topicName = "a38",
        di_condition = \state ->
            areItemsInHolding ["fioletowy_formularz"] state &&
            isItemHere "niebieski_formularz" state,
        di_effect = doNothing,
        di_content = [
            "Urzędniczka: Niebieski formularz już tu leży, proszę go po prostu zabrać."
        ]
    },
    Dialogue {
        di_personName = "urzędniczka",
        di_placeName = "okienko77",
        di_type = Ask,
        di_topicName = "a38",
        di_condition = \state ->
            areItemsInHolding ["niebieski_formularz", "fioletowy_formularz"] state &&
            not (isItemHere "a38" state) && not (areItemsInHolding ["a38"] state),
        di_effect = \state -> putItemHere a38 state,
        di_content = [
            "Asterix i Obelix bez słowa podają niebieski i fioletowy pergamin.",
            "Urzędniczka przybija pieczątkę z godłem Cesarstwa, owija wszystko w czerwoną wstążkę i kładzie A38 na biurku.",
            "Urzędniczka: Gratuluję. Kwestor kazał przekazać wam, że będzie czekał na was w jego gabinecie.",
            "Obelix (z niedowierzaniem): To już?",
            "Asterix: Tak. Chyba naprawdę to mamy.",
            "Obelix: Mogę teraz zjeść dzika?",
            "*\"a38\" jest dostępny do wzięcia przez polecenie \"take a38\"*",
            "*Nowa lokacja odblokowana: \"gabinet_kwestora\"*"
        ]
    },
    Dialogue {
        di_personName = "urzędniczka",
        di_placeName = "okienko77",
        di_type = Ask,
        di_topicName = "a38",
        di_condition = \state -> isItemHere "a38" state,
        di_effect = doNothing,
        di_content = [
            "Urzędniczka: A38 leży tu na biurku. Proszę zabrać."
        ]
    },
    Dialogue {
        di_personName = "urzędniczka",
        di_placeName = "okienko77",
        di_type = Ask,
        di_topicName = "a38",
        di_condition = \state -> not (areItemsInHolding ["niebieski_formularz"] state) &&
            not (areItemsInHolding ["a38"] state) && not (isItemHere "a38" state),
        di_effect = doNothing,
        di_content = [
            "Urzędniczka: Przykro mi, potrzebuję niebieskiego formularza.",
            "Obelix: Skąd mamy wziąć ten niebieski bulbularz?",
            "Urzędniczka: Może na trzecim piętrze coś będą wiedzieć",
            "*Możesz wrócić na trzecię piętro poleceniem \"go trzecie_piętro\"*"
        ]
    },
    Dialogue {
        di_personName = "urzędniczka",
        di_placeName = "okienko77",
        di_type = Ask,
        di_topicName = "a38",
        di_condition = \state -> not (areItemsInHolding ["fioletowy_formularz"] state) &&
            not (areItemsInHolding ["a38"] state) && not (isItemHere "a38" state),
        di_effect = doNothing,
        di_content = [
            "Urzędniczka: Przykro mi, potrzebuję fioletowego formularza.",
            "Obelix: Skąd mamy wziąć ten fioletowego bulbularz?",
            "Urzędniczka: Może na trzecim piętrze będą coś wiedzieć",
            "*Możesz wrócić na trzecię piętro poleceniem \"go trzecie_piętro\"*"
        ]
    },
    Dialogue {
        di_personName = "urzędniczka",
        di_placeName = "okienko77",
        di_type = Ask,
        di_topicName = "a38",
        di_condition = \state -> areItemsInHolding ["a38"] state,
        di_effect = doNothing,
        di_content = [
            "Urzędniczka: Skoro już macie a38, to wystarczy pójśc do gabinetu kwestora."
        ]
    }]


availableDialogues :: State -> [Dialogue] -> [Dialogue]
availableDialogues gs ds = filter (\d -> di_condition d gs) ds

applyDialogue :: Dialogue -> State -> State
applyDialogue d gs = di_effect d gs

personsAtPlace :: State -> [String]
personsAtPlace state =
    let placeName = pl_name (i_am_at state)
    in nub [ di_personName d
           | d <- allDialogues
           , di_placeName d == placeName
           , di_condition d state
           ]

areItemsInHolding :: [String] -> State -> Bool
areItemsInHolding itemNames state =
    all (\itemName -> isJust (findItemByName itemName (holding state))) itemNames

isItemHere :: String -> State -> Bool
isItemHere itemName state =
    let placeName = pl_name (i_am_at state)
    in case Map.lookup placeName (itemsAt state) of
        Nothing -> False
        Just items -> any (\item -> it_name item == itemName) items

closingOfficeDialogue = [
    "Mineła 16:00, urząd się zamyka",
    "Asterix: Ehhh.... ",
    "Asterix i Obelix błąkają się po urzędzie bez końca. Formularz prowadzi do formularza, ten do kolejnego - i tak w nieskończoność.",
    "W końcu Obelix nie wytrzymuje. Zaczyna chodzić w kółko, wymachując rękami, krzycząc i z każdym krokiem rośnie jego frustracja.",
    "Obelix: Nigdy stąd nie wyjdziemy, Asteriksie... Tu chyba nie ma nadziei, a formularz za formularzem...",
    "Asterix: Spokojnie, Obelix. Może coś się jeszcze uda załatwić..., ",
    "Nagle pojawia się ochrona. Zauważyli hałas i zaczynają podejście do Galów.",
    "Ochroniarz: Panowie, spokojnie... W urzędzie nie krzyczymy.",
    "Bez zbędnych słów wyprowadzają Asteriksa i Obeliksa na zewnątrz.",
    "Asterix i Obelix stoją teraz przed urzędowym budynkiem, nie wiedząc, co zrobić dalej.",
    "Ochroniarz: A tak w ogóle, jaki był powód tej awantury?",
    "Obelix: Eee... formularze. Znowu formularze... Cały ten urząd to jedno wielkie zamieszanie!",
    "Asterix: Spokojnie, Obelix. Wiesz, jak to bywa... biurokracja...",
    "Ochroniarz: Biurokracja, mówicie... No cóż, w takim razie życzę powodzenia, panowie. W urzędzie wszystko ma swój czas... a wasz czas skończył się na dziś.",
    "[Możesz rozejrzeć się poleceniem look]"
    ]
