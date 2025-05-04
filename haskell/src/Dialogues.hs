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
    Dialogue {
        di_personName = "sekretarz",
        di_placeName = "urząd",
        di_type = Ask,
        di_topicName = "a38",
        di_condition = alwaysTrue,
        di_effect = doNothing,
        di_content = [
            "Sekretarz: Zarejestrować okręt tak? Nie, źle was skierowano. Musicie zawrócić do kapitana portu.",
            "Asterix: Asterix: Co? Nie, chcemy rejestrować okrętu... On chyba jest głuchy",
            "Sekretarz: CO!?",
            "Obelix: Może trzeba na niego krzyknąć?",
            "Asterix: To by było niemiłe...",
            "",
            "Mieneła chwila, bohaterowie przemyśleli sprawę",
            "",
            "[Możesz wykrzyczeć coś do kogoś - shout(sekretarz, a38).]"
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
                "Sekretarz: Sekretarz: Aaaa, to wy z tymi formularzami...",
                "Sekretarz: Sekretarz: No dobrze. Skoro macie i niebieski, i fioletowy...",
                "Sekretarz: Udajcie się do okienka 77. Piętro 2, korytarz L, wejście K. Ale cicho!'",
                "",
                "[Nowa lokacja odblokowana: \"okienko77\"]"
            ]
        },
        Dialogue {
            di_personName = "sekretarz",
            di_placeName = "urząd",
            di_type = Shout,
            di_topicName = "a38",
            di_condition = alwaysTrue,
            di_effect = doNothing,
            di_content = [
                "Sekretarz: NIE KRZYCZ TUTAJ DOBRZE? CO ZA WYCHOWANIE! NA JOWISZA ZA KOGO WY SIE UWAŻACIE.",
                "Sekretarz: Poszukajcie okienka nr. 1. Korytarzem w lewo, ostatnie drzwi na prawo.",
                "",
                "[Nowa lokacja odblokowana: \"okienko1\"]",
                "[Możesz udać się do innego miejsca - go(okienko1).]"
            ]
        }
    ]


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