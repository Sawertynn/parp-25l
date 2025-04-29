module Help where

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

#!TODO - update instructions
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

printInstructions :: IO ()
printInstructions = putStr (unlines instructionsText)

printIntroduction :: IO ()
printIntroduction = putStr (unlines introductionText)
