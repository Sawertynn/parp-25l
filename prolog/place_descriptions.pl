
describe(urząd) :-
    write('Wchodzisz do urzędu. Zapach pergaminu, starych sandałów i beznadziei wita cię jak stary znajomy.'), nl,
    write('Przy drzwiach siedzi sekretarz, który wygląda jakby nigdy nie mrugnął od objęcia stanowiska.'), nl,
    write('Sekretarz: "Czego tam?"'), nl.


describe(okienko1) :-
    write('Asterix i Obelix idą korytarzem, zgodnie z instrukcjami sekretarza: w lewo, ostatnie drzwi na prawo.'), nl,
    write('Problem w tym, że... po prawej stronie nie ma żadnych drzwi.'), nl,
    write('Zamiast tego, po lewej - jedyne widoczne wejście, lekko uchylone, jakby samo zapraszało do środka.'), nl,
    write('Wygląda na to, że sekretarz pomylił kierunki. Znowu.'), nl,
    nl,
    write('[Nowa lokacja odblokowana: "dziwne_biuro"]').

describe(dziwne_biuro) :-
    write('Za drzwiami nie ma biurka ani okienka, jak można by się spodziewać.'), nl,
    write('Zamiast tego - huśtawka. Na niej urzędnik w togach, obok dama w czerwonej tunice, zajęci rozmową.'), nl,
    write('Gdy Asterix i Obelix wchodzą, oboje zamierają.'), nl,
    write('Urzędnik (oburzony): "KTO WAM POZWOLIŁ WEJŚĆ DO MEGO BIURA?!"'), nl.

describe(szóste_piętro) :-
    write('Asterix i Obelix ledwo żywi docierają na szóste piętro po niezliczonych schodach.'), nl,
    write('Po drodze robią kilka przerw - na oddech, narzekanie i rozważenie powrotu do wioski.'), nl,
    write('Na ścianie wisi plan budynku...'), nl,
    write('...i wtedy uświadamiają sobie coś niepokojącego.'), nl,
    write('Okienko nr 1 znajduje się na parterze. Po prawej stronie od wejścia.'), nl,
    nl,
    write('[Nowy lokacja odblokowana: "parter"]'), nl.

describe(parter) :-
    write('Asterix i Obelix schodzą na parter, zgodnie z planem budynku.'), nl,
    write('Po prawej stronie od wejścia znajduje się coś, co najwyraźniej umknęło ich uwadze wcześniej:'), nl,
    write('skromne okienko z numerem "1", ledwo widoczne między doniczką a stojakiem na papirusy.'), nl,
    write('Za szybą siedzi urzędniczka z lekko znudzoną miną.'), nl,
    write('Urzędniczka: "W jakiej sprawie?"'), nl.

describe(okienko2) :-
    write('Asterix i Obelix docierają do okienka nr 2... a przynajmniej tak im się wydaje.'), nl,
    write('Numer ledwo widoczny, przekreślony i poprawiony kilka razy. Pod spodem naklejony "4".'), nl,
    write('Za szybą siedzi urzędniczka, która rzuca im krótkie, złowrogie spojrzenie.'), nl.

describe(portiernia) :-
    write('Asterix i Obelix docierają do portierni - małego pomieszczenia z drewnianą ladą i zapachem mokrej tuniki.'), nl,
    write('Za ladą siedzi portier - stary, znużony mężczyzna, którego powieki wydają się ważyć więcej niż cały Rzym.'), nl,
    write('Spogląda na nich nieobecnym wzrokiem, jakby wciąż próbował przypomnieć sobie, co tu właściwie robi.'), nl,
    write('Portier: ...?'), nl.

describe(trzecie_piętro) :-
    write('Asterix i Obelix docierają w końcu na trzecie piętro.'), nl,
    write('Na końcu długiego korytarza znajduje się okienko numer 2.'), nl,
    write('Za szybą siedzą dwie urzędniczki, pochłonięte ożywioną rozmową.'), nl,
    write('Jedna z nich rzuca krótkie spojrzenie w ich stronę, po czym wraca do plotek.'), nl.

describe(okienko8) :-
    write('Okienko numer 8 jest zamknięte.'), nl,
    write('Na drzwiach wisi krzywo przyklejona kartka: "Przerwa obiadowa - wracam za 15 minut".'), nl,
    write('Niestety, nie wiadomo od kiedy...'), nl.

describe(okienko8_po_otwarciu) :-
    write('Drzwi otwierają się. Pojawia się młoda urzędniczka,'), nl,
    write('która wita Asteriksa i Obeliksa z uprzejmym uśmiechem.'), nl,
    write('Urzędniczka: Dzień dobry! W czym mogę pomóc?'), nl.

describe(okienko35) :-
    write('Przy okienku siedzi urzędniczka z kamienną twarzą, przeglądająca stos pergaminów.'), nl,
    write('Asterix i Obelix podchodzą ostrożnie — już wiedzą, że każde okienko może być pułapką.'), nl.

describe(okienko42) :-
    write('Na końcu korytarza widać jasne światło...'), nl,
    write('...a nad okienkiem widnieje tabliczka: "NIEBIESKIE FORMULARZE DO A38".'), nl,
    write('Asterix i Obelix przystają, przecierają oczy i nie dowierzają.'), nl,
    write('Obelix: Asterix... czy my... czy my dobrze widzimy?'), nl,
    write('Asterix: Tak, Obelixie. To chyba naprawdę ono.'), nl,
    write('Za okienkiem siedzi uprzejma pani, która spogląda na nich z uśmiechem.'), nl,
    write('Urzędniczka: "Dzień dobry! W czym mogę pomóc?"'), nl.

describe(przed_urzędem) :-
    write('Asterix i Obelix stoją przed zamkniętym urzędem. Obelix siedzi na schodach i patrzy w niebo, mamrocząc coś o dziczyźnie.'), nl,
    write('Asterix tylko wzdycha i wyciąga z sakiewki bilet powrotny do wioski.'), nl,
    write('Asterix: Wiesz co, Obeliksie? Może lepiej pokonać Rzym siłą. To przynajmniej jest prostsze.'), nl,
    write('Obelix: I bez schodów...'), nl,
    write('[Możesz poczekać na ponowne otwarcie urzędu poleceniem "wait."]'), nl,
    write('[Możesz wrócić do wioski poleceniem "go(wioska)."]'), nl.

describe(wioska) :-
    write('Galijska wioska. Spokój, zapach dziczyzny i zero formularzy. Obelix rozsiada się przy ogniu, a Asterix w końcu się uśmiecha.'), nl,
    write('Obelix: Wiedziałem, że to był dobry pomysł!'), nl,
    finish.

describe(okienko77) :-
    write('Po niezliczonych schodach, korytarzach i nieporozumieniach, Asterix i Obelix stają w końcu przed legendarnym okienkiem 77.'), nl,
    write('Drzwi są lekko uchylone, jakby czekały właśnie na nich.'), nl,
    write('W środku panuje niespodziewany spokój. Za biurkiem siedzi starsza pani urzędniczka, z twarzą wyrażającą absolutny spokój i... zrozumienie?'), nl.

describe(gabinet_kwestora) :-
    holding(a38),
    write('Gabinet kwestora pachnie papirusami i świeżo zmieloną kawą.'), nl,
    write('Kwestor siedzi za wielkim biurkiem i unosi wzrok, gdy wchodzą Asterix i Obelix.'), nl,
    write('Kwestor: Wróciliście. Udało się zdobyć A38?'), nl,
    write('Asterix: Tak jest!'), nl,
    write('Kwestor: Jeśli rzeczywiście go macie, pokażcie mi ten dokument.'), nl,
    write('[Możesz go położyć na biurku poleceniem "drop"]'), nl.

describe(gabinet_kwestora) :-
    write('Gabinet kwestora pachnie papirusami i świeżo zmieloną kawą.'), nl,
    write('Kwestor siedzi za wielkim biurkiem i unosi wzrok, gdy wchodzą Asterix i Obelix.'), nl,
    write('Kwestor: Wróciliście. Ale gdzie A38?'), nl,
    write('Asterix: Hmm... Jeszcze nie dotarliśmy do samego końca.'), nl,
    write('Kwestor: Cóż, nie poddawajcie się. Biurokracja nie zna litości.'), nl,
    write('[Musisz najpierw zdobyć A38, by zakończyć zadanie.]'), nl.
