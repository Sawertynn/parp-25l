module Dialogues where

import State
import Place
import Item

import Data.List (nub, find)
import Data.Maybe (isJust)

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
            "[Możesz wykrzyczeć coś do kogoś - shout sekretarz a38]"
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
            "[Nowa lokacja odblokowana: \"okienko77\"]"
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
            "[Nowa lokacja odblokowana: \"okienko1\"]",
            "[Możesz udać się do innego miejsca - go okienko1]"
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
            "[Nowa lokacja odblokowana: \"szóste_piętro\"]"
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
            "[Nowa lokacja odblokowana: \"okienko2\"]"
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
            "[Nowa lokacja odblokowana: \"portiernia\"]"
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
