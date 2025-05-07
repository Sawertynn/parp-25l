module Actions where

import Place
import State
import Item
import Dialogues

import Data.List (find)
import qualified Data.Map as Map


-- Actions
instructionsText = [
    "",
    "Używaj standardowej składni Haskella do wpisywania poleceń.",
    "Dostępne polecenia:",
    "start                -- rozpocznij grę.",
    "go Miejsce           -- przejdź do wskazanego miejsca.",
    "look                 -- rozejrzyj się dookoła.",
    "take Przedmiot       -- podnieś przedmiot.",
    "drop Przedmiot       -- upuść przedmiot.",
    "talk Postać          -- zobacz, o co możesz zapytać daną postać.",
    "ask Postać Temat     -- zapytaj postać o dany temat.",
    "shout Postać Temat   -- krzyknij coś na dany temat.",
    "instructions         -- pokaż tę pomoc jeszcze raz.",
    "wait                 -- zaczekaj chwilę.",
    "quit                 -- zakończ grę.",
    ""
    ]
printInstructions :: State -> State
printInstructions state =
    state { message = instructionsText }

-- Introductions
introductionText = [
    "",
    "W ramach legendarnych 12 prac, które mają udowodnić wyższość Galów nad Rzymianami,",
    "Asterix i Obelix mają już za sobą sześć zadań.",
    "Pokonali dzikie bestie, przechytrzyli hipnotyzera i najedli się u kucharza olimpijskiego.'), ",
    "Teraz przygotowują się na kolejne wyzwanie. Tym razem jednak nie czeka ich walka na arenie,",
    "lecz coś znacznie gorszego... biurokracja.'), ",
    "Kwestor: Waszym kolejnym zadaniem będzie zdobycie zaświadczenia A38,",
    "które pozwoli wam uczestniczyć w następnej próbie.",
    "Asterix: Aaaa, chodzi o zwykłą administracyjną formalność?",
    "Kwestor: Tak jest, administracyjna, formalność, musicie poprosić o zaświadczenie A38'), ",
    "Asterix i Obelix udają się do urzędu. Wchodzą do budynku...",
    "",
    "[Możesz rozejrzeć się poleceniem \"look\"]"
    ]
printIntroduction :: State -> State
printIntroduction state =
    state { message = introductionText }

-- Places
descPlace :: State -> State
descPlace state =
    let description = pl_description (i_am_at state)
    in state { message = [description] }


look :: State -> State
look state =
    let place = i_am_at state
        placeName = pl_name place
        desc = pl_description place
        itemsHere = Map.findWithDefault [] placeName (itemsAt state)
        itemsMsg = if not (null itemsHere)
                   then "Widzisz tu przedmioty:" : map (\i -> "- " ++ it_name i ++ ": " ++ it_description i) itemsHere
                   else []
        persons = personsAtPlace state
        personsMsg = if not (null persons)
                     then "Są tu osoby:" : map ("- " ++) persons
                     else []
        fullMsg = [desc] ++ itemsMsg ++ personsMsg
    in state { message = fullMsg }


goPlace :: State -> String -> State
goPlace state placeName =
    case findByName placeName allPlaces of
        Just place ->
            if i_am_at state == place
            then state { message = ["Już tu jesteś"] }
            else descPlace (state { i_am_at = place})
        Nothing ->
            state { message = ["Nie ma takiego miejsca"] }

-- Talk
talkPerson :: State -> String -> State
talkPerson state personName =
    let place = i_am_at state
        placeName = pl_name place
        topics = [ di_topicName d | d <- allDialogues
                                  , di_personName d == personName
                                  , di_placeName d == placeName
                                  , di_type d == Ask
                                  , di_condition d state ]
        msg = if null topics
              then ["Nie ma tu takiej osoby, rozejrzyj się poleceniem \"look\""]
              else ("Tematy do rozmowy z " ++ personName ++ ":") : map ("- " ++) topics
    in state { message = msg }


handleDialogue :: State -> String -> String -> DialogueType -> [String] -> State
handleDialogue state personName topicName typ fallbackMessage =
    let placeName = pl_name (i_am_at state)
        personDialogues = filter (\d ->
            di_placeName d == placeName &&
            di_personName d == personName &&
            di_type d == typ
            ) allDialogues
    in if null personDialogues
        then state { message = ["Nie ma tu takiej osoby."] }
        else
            let topicDialogues = filter (\d -> di_topicName d == topicName) personDialogues
            in if null topicDialogues
                then state { message = ["Osoba nic nie wie o " ++ topicName] }
                else case find (\d -> di_condition d state) topicDialogues of
                        Just d  -> (di_effect d state) { message = di_content d }
                        Nothing -> state { message = fallbackMessage }


askPerson :: State -> String -> String -> State
askPerson state personName topicName =
    handleDialogue state personName topicName Ask ["Nie możesz teraz poruszyć tego tematu."]

shoutPerson :: State -> String -> String -> State
shoutPerson state personName topicName =
    handleDialogue state personName topicName Shout ["To krzyczenie nic nie daje."]

wait :: State -> State
wait state
  | pl_name (i_am_at state) == "okienko8" = newState
  | otherwise = state
  where
    newState = updated { message = [baseMessage ++ "\n\n" ++ desc] }
    updated = goPlace state "otwarte_okienko8"
    baseMessage = "Mija chwila w niezręcznej ciszy. Nagle drzwi skrzypią, a zza nich wyłania się młoda urzędniczka."
    desc = pl_description (i_am_at updated)
