# PARP 25L Projekt

## Tytuł gry: A38

## Zespół nr 12

- Abramowski Sebastian
- Kurzela Tomasz
- Stanoch Aleksander

## Terminy

- Prolog: 6. kwietnia
- Haskell: 11. maja
- Smalltalk: 1. czerwca

## Fabuła

[start]<br>
W ramach legendarnych 12 prac, które mają udowodnić wyższość Galów nad Rzymianami,
Asterix i Obelix mają już za sobą sześć zadań.
Pokonali dzikie bestie, przechytrzyli hipnotyzera i najedli się u kucharza olimpijskiego.

Teraz przygotowują się na kolejne wyzwanie. Tym razem jednak nie czeka ich walka na arenie,
lecz coś znacznie gorszego... biurokracja.

Kwestor: Waszym kolejnym zadaniem będzie zdobycie zaświadczenia A38,
które pozwoli wam uczestniczyć w następnej próbie.
Asterix: Aaaa, chodzi o zwykłą administracyjną formalność?
Kwestor: Tak jest, administracyjna, formalność, musicie poprosić o zaświadczenie A38

Asterix i Obelix udają się do urzędu. Wchodzą do budynku...

[look]<br>
Wchodzisz do urzędu. Zapach pergaminu, starych sandałów i beznadziei wita cię jak stary znajomy. Przy drzwiach siedzi sekretarz, który wygląda jakby nigdy nie mrugnął od objęcia stanowiska.
Sekretarz: "Czego tam?"

[talk(sekretarz)]<br>
(Możesz zapytać sekretarz o: a38)

[ask(sekretarz, a38)]<br>
Sekretarz: Zarejestrować okręt tak? Nie, źle was skierowano. Musicie zawrócić do kapitana portu.
Asterix: Co? Nie, nie chcemy rejestrować okrętu... On chyba jest głuchy.
Sekretarz: CO!?
Obelix: Może trzeba na niego krzyknąć?
Asterix: To by było niemiłe...

(Możesz wykrzyczeć coś do kogoś - shout(sekretarz, a38))

[shout(sekretarz, a38)]<br>
Krzyczysz do sekretarz: "a38!!"
Sekretarz: NIE KRZYCZ TUTAJ DOBRZE? CO ZA WYCHOWANIE! NA JOWISZA ZA KOGO WY SIE UWAŻACIE.
Sekretarz: Poszukajcie okienka nr. 1. Korytarzem w lewo, ostatnie drzwi na prawo.

(Nowa lokacja odblokowana: okienko1)

[go(okienko1)]<br>
(Trwało to 60 minut, jest około godziny 9)

Asterix i Obelix idą korytarzem... Problem w tym, że po prawej stronie nie ma żadnych drzwi.
Po lewej stronie — jedyne wejście, lekko uchylone.

(Nowa lokacja odblokowana: dziwne_biuro)

[go(dziwne_biuro)]<br>
(Trwało to 60 minut, jest około godziny 10)

Za drzwiami nie ma biurka ani okienka. Zamiast tego – huśtawka. Urzędnik w togach i dama w tunice przerywają rozmowę.

Urzędnik (oburzony): "KTO WAM POZWOLIŁ WEJŚĆ DO MEGO BIURA?!"

[talk(urzędnik)]<br>
(Możesz zapytać urzędnik o: okienko1)

[ask(urzędnik, okienko1)]<br>
Urzędnik: Sprawdźcie plan. Szóste piętro. I proszę zamknąć za sobą drzwi.

(Nowa lokacja odblokowana: szóste_piętro)

[go(szóste_piętro)]<br>
(Trwało to 60 minut, jest około godziny 11)

Asterix i Obelix odkrywają, że okienko nr 1 znajduje się… na parterze, po prawej stronie od wejścia.

(Nowy lokacja odblokowana: parter)

[go(parter)]<br>
(Trwało to 60 minut, jest około godziny 12)

Za skromnym okienkiem nr 1 urzędniczka pyta: "W jakiej sprawie?"

[talk(urzędniczka)]<br>
(Możesz zapytać urzędniczka o: a38)

[ask(urzędniczka, a38)]<br>
Urzędniczka: A38? Nie, źle was poinformowano. Musicie iść do okienka nr. 2.

(Nowa lokacja odblokowana: okienko2)

[go(okienko2)]<br>
(Trwało to 60 minut, jest około godziny 13)

Numer przekreślony, naklejony „4”. Obok „8”. Urzędniczka rzuca złowrogie spojrzenie.

[talk(urzędniczka)]<br>
(Możesz zapytać urzędniczka o: a38)

[ask(urzędniczka, a38)]<br>
Urzędniczka: Numer 2? Nie, to nie tutaj. Tu jest 4. Obok 8. Proszę zapytać portiera.

(Nowa lokacja odblokowana: portiernia)

[go(portiernia)]<br>
(Trwało to 60 minut, jest około godziny 14)

(Portier wygląda jakby nie pamiętał, po co tu jest.)

[talk(portier)]<br>
(Możesz zapytać portier o: okienko2)

[ask(portier, okienko2)]<br>
Portier: CO?
Asterix: Chyba potrzebujemy formularza A39, żeby nas ktoś usłyszał.

[shout(portier, okienko2)]<br>
Portier: COOOOO?!?!?!
Prefekt (przypadkiem słyszy): No, no… spokojnie. Tutaj ludzie pracują.

(Prefekt oferuje pomoc.)

[talk(prefekt)]<br>
(Możesz zapytać prefekt o: okienko2, a38)

[ask(prefekt, okienko2)]<br>
Prefekt: Numer 2? Portier widział je ostatnio na trzecim piętrze, korytarz szósty.

(Nowa lokacja odblokowana: trzecie_piętro)

[ask(prefekt, a38)]<br>
Prefekt: A38? O nie, znowu ten koszmar... Proszę pytać na trzecim piętrze.

[go(trzecie_piętro)]<br>
(Trwało to 60 minut, jest około godziny 15)

(Na końcu korytarza — okienko nr 2. Urzędniczki plotkują.)

[talk(urzędniczka)]<br>
(Możesz zapytać urzędniczka o: a38, niebieski_formularz)

[ask(urzędniczka, a38)]<br>
Urzędniczka: Nie widzi pan, że jestem zajęta? Proszę poczekać.

[shout(urzędniczka, a38)]<br>
Urzędniczka: Skandal! Zaświadczenie A38? A czy ma pan niebieski formularz?

[ask(urzędniczka, niebieski_formularz)]<br>
Urzędniczka: Proszę udać się do okienka nr 8.

(Nowa lokacja odblokowana: okienko8)

[go(okienko8)]<br>
(Mineła 16:00, urząd się zamyka)
Asterix: Ehhh....

Asterix i Obelix błąkają się po urzędzie bez końca. Formularz prowadzi do formularza, ten do kolejnego - i tak w nieskończoność.
W końcu Obelix nie wytrzymuje. Zaczyna chodzić w kółko, wymachując rękami, krzycząc i z każdym krokiem rośnie jego frustracja.
Obelix: Nigdy stąd nie wyjdziemy, Asteriksie... Tu chyba nie ma nadziei, a formularz za formularzem...
Asterix: Spokojnie, Obelix. Może coś się jeszcze uda załatwić...

Nagle pojawia się ochrona. Zauważyli hałas i zaczynają podejście do Galów.
Ochroniarz: Panowie, spokojnie... W urzędzie nie krzyczymy.
Bez zbędnych słów wyprowadzają Asteriksa i Obeliksa na zewnątrz.
Asterix i Obelix stoją teraz przed urzędowym budynkiem, nie wiedząc, co zrobić dalej.
Ochroniarz: A tak w ogóle, jaki był powód tej awantury?
Obelix: Eee... formularze. Znowu formularze... Cały ten urząd to jedno wielkie zamieszanie!
Asterix: Spokojnie, Obelix. Wiesz, jak to bywa... biurokracja...
Ochroniarz: Biurokracja, mówicie... No cóż, w takim razie życzę powodzenia, panowie. W urzędzie wszystko ma swój czas... a wasz czas skończył się na dziś.

[look]<br>
Asterix i Obelix stoją przed zamkniętym urzędem. Obelix siedzi na schodach i patrzy w niebo, mamrocząc coś o dziczyźnie.
Asterix tylko wzdycha i wyciąga z sakiewki bilet powrotny do wioski.
Asterix: Wiesz co, Obeliksie? Może lepiej pokonać Rzym siłą. To przynajmniej jest prostsze.
Obelix: I bez schodów...

[wait]<br>
Asterix i Obelix postanawiają nie tracić więcej nerwów.
Udają się do pobliskiego baru "Pod Rzymską Pieczęcią", gdzie jedzą kolację i popijają galijskim cydrem.
Wieczór mija na wspominkach, narzekaniu i... kolejnym dzbanie cydru.
Obelix: No! To się nazywa urządzenie się.
Następnego ranka wychodzą z baru i patrzą na wschodzące słońce.
Asterix: Wybiła 8:00, wygląda na to, że urząd znowu otwarty...

[go(urząd)]<br>
(Trwało to 60 minut, jest około godiny 9)

Wchodzisz do urzędu. Zapach pergaminu, starych sandałów i beznadziei wita cię jak stary znajomy.
Przy drzwiach siedzi sekretarz, który wygląda jakby nigdy nie mrugnął od objęcia stanowiska.
Sekretarz: "Czego tam?"

[go(okienko8)]<br>
(Trwało to 60 minut, jest około godiny 10)

Okienko numer 8 jest zamknięte.
Na drzwiach wisi krzywo przyklejona kartka: "Przerwa obiadowa – wracam za 15 minut".
Niestety, nie wiadomo od kiedy...


[wait]<br>
Asterix i Obelix siadają na ławce pod okienkiem nr 8 i cierpliwie czekają.
Czas mija. Przerwa trwa dalej. Kartka na drzwiach wisi nieporuszona.
Obelix: Myślisz, że te "15 minut" to w rzymskich godzinach?
Asterix: Może mają inny kalendarz...

(Trwało to 45 minut, jest około godiny 10)

Drzwi są otwarte. Pojawia się młoda urzędniczka,
która wita Asteriksa i Obeliksa z uprzejmym uśmiechem.
Urzędniczka: "Dzień dobry! W czym mogę pomóc?"

[ask(urzędniczka, niebieski_formularz)]<br>
Urzędniczka: Niebieski formularz? To nie tutaj. Okienko 35, czwarte piętro.
Asterix: Ciekawe, ile w tym budynku jest pięter...
Obelix: Mam nadzieję, że na czwartym piętrze mają coś do jedzenia.
(Nowa lokacja odblokowana: "okienko35")

[go(okienko35)]<br>
(Trwało to 60 minut, jest około godiny 11)

Przy okienku siedzi urzędniczka z kamienną twarzą, przeglądająca stos pergaminów.
Asterix i Obelix podchodzą ostrożnie — już wiedzą, że każde okienko może być pułapką.

[talk(urzędniczka)]<br>
Możesz zapytać urzędniczka o:
niebieski_formularz

[ask(urzędniczka, niebieski_formularz)]<br>

Urzędniczka: Proszę, oto fioletowy formularz. Teraz proszę udać się na piąte piętro, schody K, korytarz W, okienko numer 42.
Asterix: Fioletowy? Przecież pytaliśmy o niebieski...
Obelix: Cicho, mamy jakiś formularz. Bierz i idziemy.
(Nowa lokacja odblokowana: "okienko42")

[take(fioletowy_formularz)]<br>
Urzędniczka: Do zobaczenia!

[go(okienko42)]<br>
(Trwało to 60 minut, jest około godiny 12)

Na końcu korytarza widać jasne światło...
...a nad okienkiem widnieje tabliczka: "NIEBIESKIE FORMULARZE DO A38".
Asterix i Obelix przystają, przecierają oczy i nie dowierzają.
Obelix: Asterix... czy my... czy my dobrze widzimy?
Asterix: Tak, Obelixie. To chyba naprawdę ono.
Za okienkiem siedzi uprzejma pani, która spogląda na nich z uśmiechem.
Urzędniczka: "Dzień dobry! W czym mogę pomóc?"

[ask(urzędniczka, niebieski_formularz)]<br>

Urzędniczka: Aaaa, formularz A38? Oczywiście. To jest ten niebieski. Proszę bardzo — do odbioru.
Urzędniczka kładzie przed nimi niebieski formularz. Wydaje się... zwyczajny.

[take(niebieski_formularz)]<br>
Asterix: Dziękuję.
Obelix: I o ten świstek tylko zachodu??
Asterix: Obelixie na teutadesa, grzeczniej bo sprawisz pani przykrość i będziemy musieli tu siedzieć jeszcze dłużej...

[take(niebieski_formularz)]<br>
Już to trzymasz!

[ask(urzędniczka, a38)]<br>

Urzędniczka: a38... Ostatno coś się zmieniło i nie jestem pewna.
Urzędniczka: Może w sekretariacie będą wiedzieć

[go(urząd)]<br>
(Trwało to 60 minut, jest około godiny 13)

Wchodzisz do urzędu. Zapach pergaminu, starych sandałów i beznadziei wita cię jak stary znajomy.
Przy drzwiach siedzi sekretarz, który wygląda jakby nigdy nie mrugnął od objęcia stanowiska.
Sekretarz: "Czego tam?"

[ask(sekretarz, a38)]<br>
Sekretarz: Już mówiłem rejestracja okrętu u kapitana portu.
Asterix: Jakiego okrę... aaaaa on jest głuchy
Sekretarz: CO!?
Obelix: Krzyknąć znowu?

[shout(sekretarz, a38)]<br>
Krzyczysz do sekretarz: "a38!!"
Sekretarz: NIE KRZYCZ TUTAJ DOBRZE? CO ZA WYCHOWANIE! NA JOWISZA ZA KOGO WY SIE UWAŻACIE.
Sekretarz: Aaaa, to wy z tymi formularzami...
Sekretarz: No dobrze. Skoro macie i niebieski, i fioletowy...
Sekretarz: Udajcie się do okienka 77. Piętro 2, korytarz L, wejście K. Ale cicho!
(Nowa lokacja odblokowana: "okienko77")

[go(okienko77)]<br>
Po niezliczonych schodach, korytarzach i nieporozumieniach, Asterix i Obelix stają w końcu przed legendarnym okienkiem 77.
Drzwi są lekko uchylone, jakby czekały właśnie na nich.

[go(okienko8)]<br>
(Mineła 16:00, urząd się zamyka)
Asterix: Ehhh....

Asterix i Obelix błąkają się po urzędzie bez końca. Formularz prowadzi do formularza, ten do kolejnego - i tak w nieskończoność.
W końcu Obelix nie wytrzymuje. Zaczyna chodzić w kółko, wymachując rękami, krzycząc i z każdym krokiem rośnie jego frustracja.
Obelix: Nigdy stąd nie wyjdziemy, Asteriksie... Tu chyba nie ma nadziei, a formularz za formularzem...
Asterix: Spokojnie, Obelix. Może coś się jeszcze uda załatwić...

Nagle pojawia się ochrona. Zauważyli hałas i zaczynają podejście do Galów.
Ochroniarz: Panowie, spokojnie... W urzędzie nie krzyczymy.
Bez zbędnych słów wyprowadzają Asteriksa i Obeliksa na zewnątrz.
Asterix i Obelix stoją teraz przed urzędowym budynkiem, nie wiedząc, co zrobić dalej.
Ochroniarz: A tak w ogóle, jaki był powód tej awantury?
Obelix: Eee... formularze. Znowu formularze... Cały ten urząd to jedno wielkie zamieszanie!
Asterix: Spokojnie, Obelix. Wiesz, jak to bywa... biurokracja...
Ochroniarz: Biurokracja, mówicie... No cóż, w takim razie życzę powodzenia, panowie. W urzędzie wszystko ma swój czas... a wasz czas skończył się na dziś.

[look]<br>
Asterix i Obelix stoją przed zamkniętym urzędem. Obelix siedzi na schodach i patrzy w niebo, mamrocząc coś o dziczyźnie.
Asterix tylko wzdycha i wyciąga z sakiewki bilet powrotny do wioski.
Asterix: Wiesz co, Obeliksie? Może lepiej pokonać Rzym siłą. To przynajmniej jest prostsze.
Obelix: I bez schodów...
(Możesz poczekać na ponowne otwarcie urzędu poleceniem "wait.")
(Możesz wrócić do wioski poleceniem "go(wioska)")

[wait]<br>
Asterix i Obelix postanawiają nie tracić więcej nerwów.
Udają się do pobliskiego baru "Pod Rzymską Pieczęcią", gdzie jedzą kolację i popijają galijskim cydrem.
Wieczór mija na wspominkach, narzekaniu i... kolejnym dzbanie cydru.
Obelix: No! To się nazywa urządzenie się.
Następnego ranka wychodzą z baru i patrzą na wschodzące słońce.
Asterix: Wybiła 8:00, wygląda na to, że urząd znowu otwarty...
(Możesz teraz wrócić do urzędu poleceniem "go(urząd)")


[go(urząd)]<br>
(Trwało to 60 minut, jest około godiny 9)

Wchodzisz do urzędu. Zapach pergaminu, starych sandałów i beznadziei wita cię jak stary znajomy.
Przy drzwiach siedzi sekretarz, który wygląda jakby nigdy nie mrugnął od objęcia stanowiska.
Sekretarz: "Czego tam?"


[go(okienko8)]<br>
(Trwało to 60 minut, jest około godiny 10)

Okienko numer 8 jest zamknięte.
Na drzwiach wisi krzywo przyklejona kartka: "Przerwa obiadowa – wracam za 15 minut".
Niestety, nie wiadomo od kiedy...

[wait]<br>
Asterix i Obelix siadają na ławce pod okienkiem nr 8 i cierpliwie czekają.
Czas mija. Przerwa trwa dalej. Kartka na drzwiach wisi nieporuszona.
Obelix: Myślisz, że te "15 minut" to w rzymskich godzinach?
Asterix: Może mają inny kalendarz...

(Trwało to 45 minut, jest około godiny 10)

(Okienko zostało otwarte)
Drzwi są otwarte. Pojawia się młoda urzędniczka,
która wita Asteriksa i Obeliksa z uprzejmym uśmiechem.
Urzędniczka: "Dzień dobry! W czym mogę pomóc?"

[talk(urzędniczka)]<br>
Możesz zapytać urzędniczka o:
niebieski_formularz


[ask(urzędniczka, niebieski_formularz)]<br>
Urzędniczka: Niebieski formularz? To nie tutaj. Okienko 35, czwarte piętro.
Asterix: Ciekawe, ile w tym budynku jest pięter...
Obelix: Mam nadzieję, że na czwartym piętrze mają coś do jedzenia.
(Nowa lokacja odblokowana: "okienko35")

[go(okienko35)]<br>
(Trwało to 60 minut, jest około godiny 11)

Przy okienku siedzi urzędniczka z kamienną twarzą, przeglądająca stos pergaminów.
Asterix i Obelix podchodzą ostrożnie — już wiedzą, że każde okienko może być pułapką.

[ask(urzędniczka, niebieski_formularz)]<br>

Urzędniczka: Proszę, oto fioletowy formularz. Teraz proszę udać się na piąte piętro, schody K, korytarz W, okienko numer 42.
Asterix: Fioletowy? Przecież pytaliśmy o niebieski...
Obelix: Cicho, mamy jakiś formularz. Bierz i idziemy.
(Nowa lokacja odblokowana: "okienko42")

[take(fioletowy_formularz)]<br>
Urzędniczka: Do zobaczenia!

[go(okienko42)]<br>
(Trwało to 60 minut, jest około godiny 12)

Na końcu korytarza widać jasne światło...
...a nad okienkiem widnieje tabliczka: "NIEBIESKIE FORMULARZE DO A38".
Asterix i Obelix przystają, przecierają oczy i nie dowierzają.
Obelix: Asterix... czy my... czy my dobrze widzimy?
Asterix: Tak, Obelixie. To chyba naprawdę ono.
Za okienkiem siedzi uprzejma pani, która spogląda na nich z uśmiechem.
Urzędniczka: "Dzień dobry! W czym mogę pomóc?"

[ask(urzędniczka, niebieski_formularz)]<br>
Urzędniczka: Aaaa, formularz A38? Oczywiście. To jest ten niebieski. Proszę bardzo — do odbioru.
Urzędniczka kładzie przed nimi niebieski formularz. Wydaje się... zwyczajny.

[take(niebieski_formularz)]<br>
Asterix: Dziękuję.
Obelix: I o ten świstek tylko zachodu??
Asterix: Obelixie na teutadesa, grzeczniej bo sprawisz pani przykrość i będziemy musieli tu siedzieć jeszcze dłużej...

[take(niebieski_formularz)]<br>
Już to trzymasz!

[ask(urzędniczka, a38)]<br>
Urzędniczka: a38... Ostatno coś się zmieniło i nie jestem pewna.
Urzędniczka: Może w sekretariacie będą wiedzieć

[go(urząd)]<br>
(Trwało to 60 minut, jest około godiny 13)
Wchodzisz do urzędu. Zapach pergaminu, starych sandałów i beznadziei wita cię jak stary znajomy.
Przy drzwiach siedzi sekretarz, który wygląda jakby nigdy nie mrugnął od objęcia stanowiska.
Sekretarz: "Czego tam?"

[ask(sekretarz, a38)]<br>
Sekretarz: Już mówiłem rejestracja okrętu u kapitana portu.
Asterix: Jakiego okrę... aaaaa on jest głuchy
Sekretarz: CO!?
Obelix: Krzyknąć znowu?

[shout(sekretarz, a38)]<br>
Krzyczysz do sekretarz: "a38!!"
Sekretarz: NIE KRZYCZ TUTAJ DOBRZE? CO ZA WYCHOWANIE! NA JOWISZA ZA KOGO WY SIE UWAŻACIE.
Sekretarz: Aaaa, to wy z tymi formularzami...
Sekretarz: No dobrze. Skoro macie i niebieski, i fioletowy...
Sekretarz: Udajcie się do okienka 77. Piętro 2, korytarz L, wejście K. Ale cicho!
(Nowa lokacja odblokowana: "okienko77")

[go(okienko77)]<br>
Po niezliczonych schodach, korytarzach i nieporozumieniach, Asterix i Obelix stają w końcu przed legendarnym okienkiem 77.
Drzwi są lekko uchylone, jakby czekały właśnie na nich.
W środku panuje niespodziewany spokój. Za biurkiem siedzi starsza pani urzędniczka, z twarzą wyrażającą absolutny spokój i... zrozumienie?

[ask(urzędniczka, a38)]<br>
Urzędniczka: A38? Oczywiście, moi drodzy. Macie formularze?
Asterix i Obelix bez słowa podają niebieski i fioletowy pergamin.
Urzędniczka przybija pieczątkę z godłem Cesarstwa, owija wszystko w czerwoną wstążkę i kładzie A38 na biurku.
Urzędniczka: Gratuluję.
Obelix (z niedowierzaniem): To już?
Asterix: Tak. Chyba naprawdę to mamy.
Obelix: Mogę teraz zjeść dzika?

[take(a38)]<br>
OK.Obelix: Mogę teraz zjeść dzika?
Asterix: Nie, Obelixie. Teraz pora pójść do kwestora i oddać mu to przeklęte zaświadczenie.

[go(gabinet_kwestora)]<br>
Gabinet kwestora pachnie papirusami i świeżo zmieloną kawą.
Kwestor siedzi za wielkim biurkiem i unosi wzrok, gdy wchodzą Asterix i Obelix.
Kwestor: Wróciliście. Udało się zdobyć A38?
Asterix: Tak jest!
Kwestor: Jeśli rzeczywiście go macie, pokażcie mi ten dokument.

[drop(a38)]<br>
OK.Asterix kładzie dokument A38 na biurku przed kwestorem.
Kwestor bierze formularz, przygląda się mu uważnie, po czym kiwa z uznaniem głową.
Kwestor: Imponujące. Niewielu przeszło tę ścieżkę bez rozlewu krwi. Gratulacje, Galowie.
Kwestor: Gotowi na kolejne zadanie?
Asterix: Jeśli nie wymaga odwiedzin w żadnym urzędzie... to chyba tak.
Obelix: Zdecydowanie tak.

[Zaświadczenie A38 dostarczone. Jedna z prób zakończona]<br>

[Gra dobiegła końca]<br>

## Rozgryka w skrócie
urząd -> okienko1 -> dziwne_bióro -> szóste_piętro -> parter -> okienko2 -> portiernia -> trzecie_piętro -> okienko8 ->[wait]<br>-> okienko35(fioletowy_formularz) -> okienko42(niebieski_formularz) -> okienko77(a38) -> gabinet_kwestora [End2]<br>

Gdy doja 16:00 nasi bohaterowie muszą opuścić urząd i znajdą się przed urzędem
przed_urzędem -> wioska [End1]<br>
przed_urzędem ->[wait]-> urząd

## Bibliografia
- https://www.youtube.com/watch?v=ioktQPgoKNE
