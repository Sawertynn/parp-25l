Object subclass: Location [

    places := nil.

    Location class >> setupPlaces [
        places := Dictionary new.

        places at: 'urząd' put: (Place name: 'urząd' description: #(
            'Wchodzisz do urzędu. Zapach pergaminu, starych sandałów i beznadziei wita cię jak stary znajomy.'
            'Przy drzwiach siedzi sekretarz, który wygląda jakby nigdy nie mrugnął od objęcia stanowiska.'
            'Sekretarz: "Czego tam?"'
            ''
            '[Możesz spawdzić o czym możesz z nim porozmawiać - talk sekretarz]'
            '[Jeśli znasz już temat, zapytaj - ask sekretarz temat]')).

        places at: 'okienko1' put: (Place name: 'okienko1' description: #(
            'Asterix i Obelix idą korytarzem, zgodnie z instrukcjami sekretarza: w lewo, ostatnie drzwi na prawo.'
            'Problem w tym, że... po prawej stronie nie ma żadnych drzwi.'
            'Zamiast tego, po lewej - jedyne widoczne wejście, lekko uchylone, jakby samo zapraszało do środka.'
            'Wygląda na to, że sekretarz pomylił kierunki. Znowu.'
            ''
            '[Nowa lokacja odblokowana: "dziwne_biuro"]')).

        places at: 'dziwne_biuro' put: (Place name: 'dziwne_biuro' description: #(
            'Za drzwiami nie ma biurka ani okienka, jak można by się spodziewać.'
            'Zamiast tego - huśtawka. Na niej urzędnik w togach, obok dama w czerwonej tunice, zajęci rozmową.'
            'Gdy Asterix i Obelix wchodzą, oboje zamierają.'
            'Urzędnik (oburzony): "KTO WAM POZWOLIŁ WEJŚĆ DO MEGO BIURA?!"')).

        places at: 'szóste_piętro' put: (Place name: 'szóste_piętro' description: #(
            'Asterix i Obelix ledwo żywi docierają na szóste piętro po niezliczonych schodach.'
            'Po drodze robią kilka przerw - na oddech, narzekanie i rozważenie powrotu do wioski.'
            'Na ścianie wisi plan budynku...'
            '...i wtedy uświadamiają sobie coś niepokojącego.'
            'Okienko nr 1 znajduje się na parterze. Po prawej stronie od wejścia.'
            ''
            '[Nowa lokacja odblokowana: "parter"]')).

        places at: 'parter' put: (Place name: 'parter' description: #(
            'Asterix i Obelix schodzą na parter, zgodnie z planem budynku.'
            'Po prawej stronie od wejścia znajduje się coś, co najwyraźniej umknęło ich uwadze wcześniej:'
            'skromne okienko z numerem "1", ledwo widoczne między doniczką a stojakiem na papirusy.'
            'Za szybą siedzi urzędniczka z lekko znudzoną miną.'
            'Urzędniczka: "W jakiej sprawie?"')).

        places at: 'okienko2' put: (Place name: 'okienko2' description: #(
            'Asterix i Obelix docierają do okienka nr 2... a przynajmniej tak im się wydaje.'
            'Numer ledwo widoczny, przekreślony i poprawiony kilka razy. Pod spodem naklejony "4".'
            'Za szybą siedzi urzędniczka, która rzuca im krótkie, złowrogie spojrzenie.')).

        places at: 'portiernia' put: (Place name: 'portiernia' description: #(
            'Asterix i Obelix docierają do portierni - małego pomieszczenia z drewnianą ladą i zapachem mokrej tuniki.'
            'Za ladą siedzi portier - stary, znużony mężczyzna, którego powieki wydają się ważyć więcej niż cały Rzym.'
            'Spogląda na nich nieobecnym wzrokiem, jakby wciąż próbował przypomnieć sobie, co tu właściwie robi.'
            'Portier: ...?')).

        places at: 'trzecie_piętro' put: (Place name: 'trzecie_piętro' description: #(
            'Asterix i Obelix docierają w końcu na trzecie piętro.'
            'Na końcu długiego korytarza znajduje się okienko numer 2.'
            'Za szybą siedzą dwie urzędniczki, pochłonięte ożywioną rozmową.'
            'Jedna z nich rzuca krótkie spojrzenie w ich stronę, po czym wraca do plotek.')).

        places at: 'okienko8' put: (Place name: 'okienko8' description: #(
            'Okienko numer 8 jest zamknięte.'
            'Na drzwiach wisi krzywo przyklejona kartka: "Przerwa obiadowa - wracam za 15 minut".'
            'Niestety, nie wiadomo od kiedy...')).

        places at: 'otwarte_okienko8' put: (Place name: 'otwarte_okienko8' description: #(
            'Drzwi są otwarte. Pojawia się młoda urzędniczka,'
            'która wita Asteriksa i Obeliksa z uprzejmym uśmiechem.'
            'Urzędniczka: "Dzień dobry! W czym mogę pomóc?"')).

        places at: 'okienko35' put: (Place name: 'okienko35' description: #(
            'Przy okienku siedzi urzędniczka z kamienną twarzą, przeglądająca stos pergaminów.'
            'Asterix i Obelix podchodzą ostrożnie — już wiedzą, że każde okienko może być pułapką.')).

        places at: 'okienko42' put: (Place name: 'okienko42' description: #(
            'Na końcu korytarza widać jasne światło...'
            '...a nad okienkiem widnieje tabliczka: "NIEBIESKIE FORMULARZE DO A38".'
            'Asterix i Obelix przystają, przecierają oczy i nie dowierzają.'
            'Obelix: Asterix... czy my... czy my dobrze widzimy?'
            'Asterix: Tak, Obelixie. To chyba naprawdę ono.'
            'Za okienkiem siedzi uprzejma pani, która spogląda na nich z uśmiechem.'
            'Urzędniczka: "Dzień dobry! W czym mogę pomóc?"')).

        places at: 'okienko77' put: (Place name: 'okienko77' description: #(
            'Po niezliczonych schodach, korytarzach i nieporozumieniach,'
            'Asterix i Obelix stają w końcu przed legendarnym okienkiem 77.'
            'Drzwi są lekko uchylone, jakby czekały właśnie na nich.'
            'W środku panuje niespodziewany spokój.'
            'Za biurkiem siedzi starsza pani urzędniczka, z twarzą wyrażającą absolutny spokój i... zrozumienie?')).

        places at: 'gabinet_kwestora' put: (Place name: 'gabinet_kwestora' description: #(
            'Gabinet kwestora pachnie papirusami i świeżo zmieloną kawą.'
            'Kwestor siedzi za wielkim biurkiem i spogląda na Asteriksa i Obeliksa z zaciekawieniem.'
            'Kwestor: Wróciliście. Czy udało wam się zdobyć formularz A38?'
            'Asterix: Cóż... to zależy, co pan rozumie przez "zdobyć".'
            'Kwestor: Jeśli naprawdę go macie, proszę go położyć na biurku.'
            ''
            '[Użyj komendy: drop a38]')).

        places at: 'wioska' put: (Place name: 'wioska' description: #(
            'Galijska wioska. Cisza, zapach pieczonego dzika i ani śladu urzędników.'
            'Obelix siada przy ogniu, rozciąga nogi i uśmiecha się szeroko.'
            'Asterix zdejmuje sandały i wzdycha z ulgą.'
            ''
            'Obelix: Widzisz? Mówiłem, że trzeba było wrócić wcześniej.'
            'Asterix: Może i tak... Ale przynajmniej mamy święty spokój.'
            '*zakończono - powrót do wioski*')).


        places at: 'przed_urzędem' put: (Place name: 'przed_urzędem' description: #(
            'Asterix i Obelix stoją przed zamkniętym urzędem. Obelix siedzi na schodach i patrzy w niebo,'
            'mamrocząc coś o dziczyźnie. Asterix tylko wzdycha i wyciąga z sakiewki bilet powrotny do wioski.'
            'Asterix: Wiesz co, Obeliksie? Może lepiej pokonać Rzym siłą. To przynajmniej jest prostsze.'
            'Obelix: I bez schodów...'
            ''
            '[Możesz poczekać na ponowne otwarcie urzędu poleceniem "wait"]'
            '[Możesz wrócić do wioski poleceniem "go wioska"]')).

    ]

    Location class >> allPlaces [
        places isNil ifTrue: [ self setupPlaces ].
        ^ places
    ]

    Location class >> findByName: name [
        ^ self allPlaces at: name ifAbsent: [ nil ]
    ]
]
