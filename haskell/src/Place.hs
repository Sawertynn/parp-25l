module Place where

import Data.List (find)

data Place = Place{
    pl_name :: String,
    pl_description :: String
    }
    deriving (Eq, Show)

allPlaces :: [Place]
allPlaces = [
    Place {
        pl_name = "urząd",
        pl_description = "Wchodzisz do urzędu. Zapach pergaminu, starych sandałów i beznadziei wita cię jak stary znajomy.\n\
        \Przy drzwiach siedzi sekretarz, który wygląda jakby nigdy nie mrugnął od objęcia stanowiska.\n\
        \Sekretarz: \"Czego tam?\"\n\n\
        \[Możesz spawdzić o czym możesz z nim porozmawiać - talk sekretarz]\n\
        \[Jeśli znasz już temat, zapytaj - ask sekretarz temat]\n"
        },
    Place {
        pl_name = "okienko1",
        pl_description = "Asterix i Obelix idą korytarzem, zgodnie z instrukcjami sekretarza: w lewo, ostatnie drzwi na prawo.\n\
        \Problem w tym, że... po prawej stronie nie ma żadnych drzwi.\n\
        \Zamiast tego, po lewej - jedyne widoczne wejście, lekko uchylone, jakby samo zapraszało do środka.\n\
        \Wygląda na to, że sekretarz pomylił kierunki. Znowu.\n\n\
        \[Nowa lokacja odblokowana: \"dziwne_biuro\"]"
        },
    Place {
        pl_name="dziwne_biuro",
        pl_description = "Za drzwiami nie ma biurka ani okienka, jak można by się spodziewać.\n\
        \Zamiast tego - huśtawka. Na niej urzędnik w togach, obok dama w czerwonej tunice, zajęci rozmową.\n\
        \Gdy Asterix i Obelix wchodzą, oboje zamierają.\n\
        \Urzędnik (oburzony): \"KTO WAM POZWOLIŁ WEJŚĆ DO MEGO BIURA?!\""
        },
    Place {
        pl_name = "szóste_piętro",
        pl_description = "Asterix i Obelix ledwo żywi docierają na szóste piętro po niezliczonych schodach.\n\
        \Po drodze robią kilka przerw - na oddech, narzekanie i rozważenie powrotu do wioski.\n\
        \Na ścianie wisi plan budynku...\n\
        \...i wtedy uświadamiają sobie coś niepokojącego.\n\
        \Okienko nr 1 znajduje się na parterze. Po prawej stronie od wejścia.\n\n\
        \[Nowa lokacja odblokowana: \"parter\"]"
    },
    Place {
        pl_name = "parter",
        pl_description = "Asterix i Obelix schodzą na parter, zgodnie z planem budynku.\n\
        \Po prawej stronie od wejścia znajduje się coś, co najwyraźniej umknęło ich uwadze wcześniej:\n\
        \skromne okienko z numerem \"1\", ledwo widoczne między doniczką a stojakiem na papirusy.\n\
        \Za szybą siedzi urzędniczka z lekko znudzoną miną.\n\
        \Urzędniczka: \"W jakiej sprawie?\""
    },
    Place {
        pl_name = "okienko2",
        pl_description = "Asterix i Obelix docierają do okienka nr 2... a przynajmniej tak im się wydaje.\n\
        \Numer ledwo widoczny, przekreślony i poprawiony kilka razy. Pod spodem naklejony \"4\".\n\
        \Za szybą siedzi urzędniczka, która rzuca im krótkie, złowrogie spojrzenie."
    },
    Place {
        pl_name = "portiernia",
        pl_description = "Asterix i Obelix docierają do portierni - małego pomieszczenia z drewnianą ladą i zapachem mokrej tuniki.\n\
        \Za ladą siedzi portier - stary, znużony mężczyzna, którego powieki wydają się ważyć więcej niż cały Rzym.\n\
        \Spogląda na nich nieobecnym wzrokiem, jakby wciąż próbował przypomnieć sobie, co tu właściwie robi.\n\
        \Portier: ...?"
    },
    Place {
        pl_name = "trzecie_piętro",
        pl_description = "Asterix i Obelix docierają w końcu na trzecie piętro.\n\
        \Na końcu długiego korytarza znajduje się okienko numer 2.\n\
        \Za szybą siedzą dwie urzędniczki, pochłonięte ożywioną rozmową.\n\
        \Jedna z nich rzuca krótkie spojrzenie w ich stronę, po czym wraca do plotek."
    },
    Place {
        pl_name = "okienko8",
        pl_description = "Okienko numer 8 jest zamknięte.\n\
            \Na drzwiach wisi krzywo przyklejona kartka: \"Przerwa obiadowa - wracam za 15 minut\".\n\
            \Niestety, nie wiadomo od kiedy..."
    },
    Place {
        pl_name = "otwarte_okienko8",
        pl_description = "Drzwi są otwarte. Pojawia się młoda urzędniczka,\n\
            \która wita Asteriksa i Obeliksa z uprzejmym uśmiechem.\n\
            \Urzędniczka: \"Dzień dobry! W czym mogę pomóc?\""
    },
    Place {
        pl_name = "okienko35",
        pl_description =
            "Przy okienku siedzi urzędniczka z kamienną twarzą, przeglądająca stos pergaminów.\n\
            \Asterix i Obelix podchodzą ostrożnie — już wiedzą, że każde okienko może być pułapką."
    },
    Place {
        pl_name = "okienko42",
        pl_description = "Na końcu korytarza widać jasne światło...\n\
            \...a nad okienkiem widnieje tabliczka: \"NIEBIESKIE FORMULARZE DO A38\".\n\
            \Asterix i Obelix przystają, przecierają oczy i nie dowierzają.\n\
            \Obelix: Asterix... czy my... czy my dobrze widzimy?\n\
            \Asterix: Tak, Obelixie. To chyba naprawdę ono.\n\
            \Za okienkiem siedzi uprzejma pani, która spogląda na nich z uśmiechem.\n\
            \Urzędniczka: \"Dzień dobry! W czym mogę pomóc?\""
    },
    Place {
        pl_name = "okienko77",
        pl_description = "Po niezliczonych schodach, korytarzach i nieporozumieniach,\n\
            \Asterix i Obelix stają w końcu przed legendarnym okienkiem 77.\n\
            \Drzwi są lekko uchylone, jakby czekały właśnie na nich.\n\
            \W środku panuje niespodziewany spokój.\n\
            \Za biurkiem siedzi starsza pani urzędniczka, z twarzą wyrażającą absolutny spokój i... zrozumienie?"
    },
    Place {
        pl_name = "gabinet_kwestora",
        pl_description =
            "Gabinet kwestora pachnie papirusami i świeżo zmieloną kawą.\n\
            \Kwestor siedzi za wielkim biurkiem i spogląda na Asteriksa i Obeliksa z zaciekawieniem.\n\
            \Kwestor: Wróciliście. Czy udało wam się zdobyć formularz A38?\n\
            \Asterix: Cóż... to zależy, co pan rozumie przez \"zdobyć\".\n\
            \Kwestor: Jeśli naprawdę go macie, proszę go położyć na biurku.\n\
            \\n\
            \[Użyj komendy: drop a38]"
    },
    Place {
        pl_name = "wioska",
        pl_description =
            "Galijska wioska. Cisza, zapach pieczonego dzika i ani śladu urzędników.\n\
            \Obelix siada przy ogniu, rozciąga nogi i uśmiecha się szeroko.\n\
            \Asterix zdejmuje sandały i wzdycha z ulgą.\n\
            \\n\
            \Obelix: Widzisz? Mówiłem, że trzeba było wrócić wcześniej.\n\
            \Asterix: Może i tak... Ale przynajmniej mamy święty spokój.\n\
            \*zakończono - powrót do wioski*"
    },
    -- in this place: officeClosed from state should be set to True, then wait command will change it False
    Place {
    pl_name = "przed_urzędem",
    pl_description =
        "Asterix i Obelix stoją przed zamkniętym urzędem. Obelix siedzi na schodach i patrzy w niebo,\n\
        \mamrocząc coś o dziczyźnie. Asterix tylko wzdycha i wyciąga z sakiewki bilet powrotny do wioski.\n\
        \Asterix: Wiesz co, Obeliksie? Może lepiej pokonać Rzym siłą. To przynajmniej jest prostsze.\n\
        \Obelix: I bez schodów...\n\
        \\n\
        \[Możesz poczekać na ponowne otwarcie urzędu poleceniem \"wait\"]\n\
        \[Możesz wrócić do wioski poleceniem \"go wioska\"]"
    }]


findByName :: String -> [Place] -> Maybe Place
findByName targetName = find (\p -> pl_name p == targetName)
