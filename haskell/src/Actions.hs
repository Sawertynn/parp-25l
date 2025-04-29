module Actions where

import Place
import State

import Data.List (find)


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
printInstructions :: State -> IO State
printInstructions state = do
    putStr (unlines instructionsText)
    return state

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
    "Asterix i Obelix udają się do urzędu. Wchodzą do budynku..."
    ]
printIntroduction :: State -> IO State
printIntroduction state = do
    putStr (unlines introductionText)
    return state

-- Places
descPlace :: State -> IO State
descPlace state = do 
    let description = pl_description (i_am_at state)
    putStr description
    return state
    

goPlace :: State -> String -> IO State
goPlace state placeName = 
    case findByName placeName allPlaces of
        Just place -> 
            if i_am_at state == place
                then do
                    putStrLn "Już tu jesteś"
                    return state
                else descPlace (state { i_am_at = place })
        Nothing -> do
            putStrLn "Nie ma takiego miejsca"
            return state

-- Objects
-- TODO