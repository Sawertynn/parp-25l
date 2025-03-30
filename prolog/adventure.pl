/* Game A38 */

:- dynamic i_am_at/1, at/2, holding/1, person_at/2.
:- retractall(at(_, _)), retractall(i_am_at(_)), retractall(alive(_)).
:- discontiguous subject/3.
:- discontiguous conversation_result/2.
:- discontiguous shout_response/3.
:- discontiguous shout_result/2.

i_am_at(urząd).
person_at(sekretarz, urząd).
person_at(urzędnik, dziwne_biuro).
person_at(urzędniczka, parter).
person_at(urzędniczka2, okienko2).
person_at(portier, portiernia).
person_at(prefekt, portiernia).
person_at(urzędniczka3, trzecie_piętro).
person_at(urzędniczka4, okienko8_po_otwarciu).
person_at(urzędniczka4_5, okienko35).
person_at(urzędniczka5, okienko42).

connection(urząd, sekretariat).
connection(urząd, okienko1).
connection(okienko1, dziwne_biuro).
connection(dziwne_biuro, szóste_piętro).
connection(szóste_piętro, parter).
connection(parter, okienko2).
connection(okienko2, portiernia).
connection(portiernia, trzecie_piętro).
connection(trzecie_piętro, okienko8).
connection(okienko8_po_otwarciu, okienko35).
connection(okienko35, okienko42).

/* Special pick rule that indicates that the game is nearly ending */

take(niebieski_formularz) :-
    i_am_at(Place),
    at(niebieski_formularz, Place),
    retract(at(niebieski_formularz, Place)),
    assert(holding(niebieski_formularz)),
    write('Urzędniczka: Panowie właśnie wybija 16, więc urząd się zamyka teraz, zapraszamy jutro w celu dokończenia formalności.'), nl,
    write('Asterix: Ehhh....'), nl, nl,
    write('Asterix i Obelix błąkają się po urzędzie bez końca. Formularz prowadzi do formularza, ten do kolejnego - i tak w nieskończoność.'), nl,
    write('W końcu Obelix nie wytrzymuje. Zaczyna chodzić w kółko, wymachując rękami, krzycząc i z każdym krokiem rośnie jego frustracja.'), nl,
    write('Obelix: Nigdy stąd nie wyjdziemy, Asteriksie... Tu chyba nie ma nadziei, a formularz za formularzem...'), nl,
    write('Asterix: Spokojnie, Obelix. Może coś się jeszcze uda załatwić...'), nl,
    nl,
    write('Nagle pojawia się ochrona. Zauważyli hałas i zaczynają podejście do Galów.'), nl,
    write('Ochroniarz: Panowie, spokojnie... W urzędzie nie krzyczymy. Macie zakaz wstępu do tego budynku na razie.'), nl,
    write('Bez zbędnych słów wyprowadzają Asteriksa i Obeliksa na zewnątrz.'), nl,
    write('Asterix i Obelix stoją teraz przed urzędowym budynkiem, nie wiedząc, co zrobić dalej.'), nl,
    write('Ochroniarz: A tak w ogóle, jaki był powód tej awantury?'), nl,
    write('Obelix: Eee... formularze. Znowu formularze... Cały ten urząd to jedno wielkie zamieszanie!'), nl,
    write('Asterix: Spokojnie, Obelix. Wiesz, jak to bywa... biurokracja...'), nl,
    write('Ochroniarz: Biurokracja, mówicie... No cóż, w takim razie życzę powodzenia, panowie. W urzędzie wszystko ma swój czas... a wasz czas skończył się na dziś.'), nl,
    write('[Możesz rozejrzeć się poleceniem "look."]'), nl,
    retract(i_am_at(Place)),
    assert(i_am_at(przed_urzędem)),
    !.

/* These rules describe how to pick up an object. */

take(X) :-
        holding(X),
        write('Już to trzymasz!'),
        !, nl.

take(X) :-
        i_am_at(Place),
        at(X, Place),
        retract(at(X, Place)),
        assert(holding(X)),
        write('OK.'),
        !, nl.

take(_) :-
        write('Przedmiot nie jest w zasięgu twojego wzroku...'),
        nl.


/* These rules describe how to put down an object. */

drop(X) :-
        holding(X),
        i_am_at(Place),
        retract(holding(X)),
        assert(at(X, Place)),
        write('OK.'),
        !, nl.

drop(_) :-
        write('Nie posiadasz tego przedmiotu...'),
        nl.


/* This rule tells how to move in a given direction. */

go(Place) :-
        i_am_at(Here),
        connection(Here, Place),
        retract(i_am_at(Here)),
        assert(i_am_at(Place)),
        !, look.

go(_) :-
        write('Nie możesz pójść tą drogą...').


/* This rule tells how to look about you. */

look :-
        i_am_at(Place),
        describe(Place),
        nl,
        notice_objects_at(Place),
        nl.


/* These rules set up a loop to mention all the objects
   in your vicinity. */

notice_objects_at(Place) :-
        at(X, Place),
        write('Jest tu '), write(X), write('.'), nl,
        fail.

notice_objects_at(_).

/* These rules are for aliases, for example when we want to say 'urzędniczka' instead of 'urzędniczka2'  */

resolve_real_person(urzędniczka, Real) :-
    i_am_at(Place),
    person_at(Real, Place),
    member(Real, [urzędniczka, urzędniczka2, urzędniczka3, urzędniczka4, urzędniczka4_5, urzędniczka5]), !.

resolve_real_person(Name, Name).

/* Subjects to talk aobut */

subject(sekretarz, a38,
    'Sekretarz: Zarejestrować okręt tak? Nie, źle was skierowano. Musicie zawrócić do kapitana portu.').

conversation_result(sekretarz, a38) :-
    connection(urząd, sekretariat),
    write('Asterix: Asterix: Co? Nie, chcemy rejestrować okrętu... On chyba jest głuchy'), nl,
    write('Sekretarz: CO!?'), nl.

shout_response(sekretarz, a38,
    'Sekretarz: NIE KRZYCZ TUTAJ DOBRZE? CO ZA WYCHOWANIE! NA JOWISZA ZA KOGO WY SIE UWAŻACIE. Poszukajcie okienka nr. 1. Korytarzem w lewo, ostatnie drzwi na prawo.').

shout_result(sekretarz, a38) :-
    connection(urząd, sekretariat),
    write('Możesz teraz przejść do okienka nr 1. [nazwa: okienko1]'), nl.



subject(urzędnik, okienko1,
    'Urzędnik: Sprawdźcie plan. Szóste piętro. I proszę zamknąć za sobą drzwi. Co za bezczelność... Proszę dalej, panienko.').

conversation_result(urzędnik, okienko1) :-
    write('Asterix: Chyba kogoś przeszkodziliśmy...'), nl,
    write('[Nowa lokacja odblokowana: "szóste_piętro"]'), nl.


subject(urzędniczka, a38,
    'Urzędniczka: A38? Nie, źle was poinformowano. Musicie iść do okienka nr. 2.').

conversation_result(urzędniczka, a38) :-
    write('Asterix: Czyli musimy iść dalej...'), nl,
    write('[Nowa lokacja odblokowana: "okienko2"]'), nl.


subject(urzędniczka2, a38,
    'Urzędniczka: Numer 2? Hm... Nie, to nie tutaj. Tutaj jest okienko numer. 4. To obok to numer 8. Jeśli bardzo państwu zależy, proszę popytać portiera.').

conversation_result(urzędniczka2, a38) :-
    write('Asterix: Okienko 2, które jest czwórką, a obok ósemka...'), nl,
    write('Obelix: A może by tak rzucić to wszystko i wrócić do dzików?'), nl,
    write('[Nowa lokacja odblokowana: "portiernia"]'), nl.


subject(portier, okienko2, 'Portier: CO?').

conversation_result(portier, okienko2) :-
    write('Asterix: Chyba potrzebujemy formularza A39, żeby nas ktoś usłyszał.'), nl.

shout_response(portier, okienko2, 'Portier: COOOOO?!?!?!').

shout_result(portier, okienko2) :-
    write('Rozmowę przypadkiem usłyszał przechodzący obok prefekt.'), nl,
    write('Prefekt: No, no… tylko spokojnie. Tutaj przecież ludzie pracują.'), nl,
    write('Prefekt: Przyjacielu, powiedz — czego potrzebujesz?'), nl.


subject(prefekt, okienko2,
    'Prefekt: Numer 2? Zaraz... gdzie ono się teraz znajduje?\nPortier: Gdy widziałem je po raz ostatni, Panie Prefekcie, było na trzecim piętrze, korytarz szósty. Łatwo trafić.\nPrefekt: No, widzicie Panowie? Teraz już wszystko jasne. I po co to całe zamieszanie?').

conversation_result(prefekt, okienko2) :-
    write('[Nowa lokacja odblokowana: "trzecie_piętro"]'), nl.


subject(prefekt, a38, 'Asterix: Prefekt, czy wie Pan, gdzie znajduje się formularz A38?').

conversation_result(prefekt, a38) :-
    write('Prefekt: A38? O nie, znowu ten koszmar...'), nl,
    write('Prefekt: Proszę wybaczyć, ale kawa mi stygnie, a formularze to nie moja działka.'), nl,
    write('Prefekt: Na trzecim piętrze na pewno ktoś będzie wiedział więcej. Jeśli jeszcze pamiętają.'), nl,
    write('Asterix: Zaczynam się zastanawiać, czy ten formularz w ogóle istnieje.'), nl,
    write('Obelix: A ja zaczynam podejrzewać, że nie zdążymy dziś na obiad...'), nl.


subject(urzędniczka3, a38,
    'Urzędniczka: Nie widzi Pan, że jestem zajęta? Proszę poczekać.').

conversation_result(urzędniczka3, a38) :-
    write('Urzędniczki wracają do rozmowy o znajomej i jej domniemanych aferach, zupełnie ignorując obecność Galów.'), nl.


shout_response(urzędniczka3, a38,
    'Urzędniczka: Och, ci ludzie są naprawdę niemożliwi. Krzyczeć w biurze? To przecież skandal!\nZaświadczenie A38, tak? A czy ma pan niebieski formularz?').

shout_result(urzędniczka3, a38) :-
    write('[Możesz teraz zapytać o "niebieski_formularz"]'), nl.


subject(urzędniczka3, niebieski_formularz,
    'Urzędniczka: W celu uzyskania zaświadczenia A38 należy najpierw przedstawić niebieski formularz. Proszę udać się do okienka nr 8.').

conversation_result(urzędniczka3, niebieski_formularz) :-
    write('Asterix: Och... Przecież już tam byliśmy...'), nl,
    write('[Nowa lokacja odblokowana: "okienko8"]'), nl.


subject(urzędniczka4, niebieski_formularz,
    'Urzędniczka: Niebieski formularz? To nie tutaj. Okienko 35, czwarte piętro.').

conversation_result(urzędniczka4, niebieski_formularz) :-
    write('Asterix: Ciekawe, ile w tym budynku jest pięter...'), nl,
    write('Obelix: Mam nadzieję, że na czwartym piętrze mają coś do jedzenia.'), nl,
    write('[Nowa lokacja odblokowana: "okienko35"]'), nl.


subject(urzędniczka4_5, niebieski_formularz, '').

conversation_result(urzędniczka4_5, niebieski_formularz) :-
    \+ at(fioletowy_formularz, okienko35),
    assert(at(fioletowy_formularz, okienko35)),
    write('Urzędniczka: Proszę, oto fioletowy formularz. Teraz proszę udać się na piąte piętro, schody K, korytarz W, okienko numer 42.'), nl,
    write('Asterix: Fioletowy? Przecież pytaliśmy o niebieski...'), nl,
    write('Obelix: Cicho, mamy jakiś formularz. Bierz i idziemy.'), nl,
    write('["fioletowy_formularz" jest dostepny do wzięcia przez polecenie "take"]'), nl,
    write('[Nowa lokacja odblokowana: "okienko42"]'), nl.

conversation_result(urzędniczka4_5, niebieski_formularz) :-
    holding(fioletowy_formularz),  % Jeśli gracz trzyma formularz
    write('Urzędniczka: Przecież macie już fioletowy formularz w ręku! Nie wiem nic o niebieskim formularzu. Dajcie mi spokój.'), nl,
    write('Urzędniczka: Idźcie do okienka 42, bo urząd się zaraz zamknie!'), nl.

conversation_result(urzędniczka4_5, niebieski_formularz) :-
    at(fioletowy_formularz, okienko42),  % Jeśli formularz leży na okienku
    write('Urzędniczka: Przecież ten formularz już tu leży! Macie go w zasięgu ręki. Dajcie mi spokój z tym niebieskim formularzem.'), nl,
    write('Urzędniczka: Idźcie do okienka 42, bo urząd zaraz zamyka drzwi!'), nl.


subject(urzędniczka5, niebieski_formularz, '').

conversation_result(urzędniczka5, niebieski_formularz) :-
    \+ at(niebieski_formularz, okienko42),
    assert(at(niebieski_formularz, okienko42)),
    write('Urzędniczka: Aaaa, formularz A38? Oczywiście. To jest ten niebieski. Proszę bardzo — do odbioru.'), nl,
    write('Urzędniczka kładzie przed nimi niebieski formularz. Wydaje się... zwyczajny.'), nl,
    write('["niebieski_formularz" jest dostępny do wzięcia przez polecenie "take"]'), nl.

conversation_result(urzędniczka5, niebieski_formularz) :-
    holding(niebieski_formularz),
    write('Urzędniczka: Przecież już macie ten formularz w ręku!'), nl.

conversation_result(urzędniczka5, niebieski_formularz) :-
    at(niebieski_formularz, okienko42),
    write('Urzędniczka: Przecież już wam go podałam, leży tu.'), nl.


/* These rules are for asking a person about some subject */

talk(PersonAlias) :-
    resolve_real_person(PersonAlias, RealPerson),
    person_at(RealPerson, Place),
    i_am_at(Place),
    write('Możesz zapytać '), write(PersonAlias), write(' o:'),
    nl,
    fail.

talk(PersonAlias) :-
    resolve_real_person(PersonAlias, RealPerson),
    person_at(RealPerson, Place),
    i_am_at(Place),
    subject(RealPerson, Subject, _),
    write(Subject),
    nl,
    fail.

talk(PersonAlias) :-
    resolve_real_person(PersonAlias, RealPerson),
    person_at(RealPerson, Place),
    i_am_at(Place),
    !.

talk(Person) :-
    write('Nie ma tutaj nikogo o imieniu '), write(Person),
    nl, !.

ask(PersonAlias, Subject) :-
    resolve_real_person(PersonAlias, RealPerson),
    person_at(RealPerson, Place),
    i_am_at(Place),
    subject(RealPerson, Subject, Message),
    write(Message),
    nl,
    conversation_result(RealPerson, Subject),
    !.

ask(PersonAlias, Subject) :-
    resolve_real_person(PersonAlias, RealPerson),
    person_at(RealPerson, Place),
    i_am_at(Place),
    subject(RealPerson, Subject, _),
    !.

ask(PersonAlias, Subject) :-
    resolve_real_person(PersonAlias, RealPerson),
    person_at(RealPerson, Place),
    i_am_at(Place),
    write(PersonAlias), write(' nie wie nic o '), write(Subject),
    nl,
    !.

ask(PersonAlias, _) :-
    write('Nie ma tutaj nikogo o imieniu '), write(PersonAlias),
    nl, !.

shout(PersonAlias, Subject) :-
    resolve_real_person(PersonAlias, RealPerson),
    person_at(RealPerson, Place),
    i_am_at(Place),
    shout_response(RealPerson, Subject, Message),
    write('Krzyczysz do '), write(PersonAlias), write(': "'), write(Subject), write('!!"'), nl,
    write(Message), nl,
    shout_result(RealPerson, Subject),
    !.

shout(_, _) :-
    write('Krzyczysz w pustkę... Nikt cię nie słyszy.'), nl.

/* This rules are for waiting for something */

wait :-
    i_am_at(okienko8),
    write('Asterix i Obelix siadają na ławce pod okienkiem nr 8 i cierpliwie czekają.'), nl,
    write('Czas mija. Przerwa trwa dalej. Kartka na drzwiach wisi nieporuszona.'), nl,
    write('Obelix: Myślisz, że te "15 minut" to w rzymskich godzinach?'), nl,
    write('Asterix: Może mają inny kalendarz...'), nl,
    write('[Okienko zostało otwarte]'), nl,
    retract(i_am_at(okienko8)),
    assert(i_am_at(okienko8_po_otwarciu)),
    look, !.

wait :-
    i_am_at(Miejsce),
    write('Asterix i Obelix siadają gdzieś w kącie w miejscu: '), write(Miejsce), write('.'), nl,
    write('Nie mają nawet na co czekać, ale przynajmniej mogą chwilę odpocząć.'), nl,
    write('Obelix: Może coś zjemy?'), nl,
    write('Asterix: Na Jowisza, najpierw znajdźmy ten formularz.'), nl.


/* Under UNIX, the "halt." command quits Prolog but does not
   remove the output window. On a PC, however, the window
   disappears before the final output can be seen. Hence this
   routine requests the user to perform the final "halt." */

finish :-
        nl,
        write('Gra dobiegła końca. [Wpisz komendę halt., aby zakończyć]'),
        nl.


/* This rule just writes out game instructions. */

instructions :-
    nl,
    write('Używaj standardowej składni Prologa do wpisywania poleceń.'), nl,
    write('Dostępne polecenia:'), nl,
    write('start.               -- rozpocznij grę.'), nl,
    write('go(Miejsce).         -- przejdź do wskazanego miejsca.'), nl,
    write('look.                -- rozejrzyj się dookoła.'), nl,
    write('take(Przedmiot).     -- podnieś przedmiot.'), nl,
    write('drop(Przedmiot).     -- upuść przedmiot.'), nl,
    write('talk(Postać).        -- zobacz, o co możesz zapytać daną postać.'), nl,
    write('ask(Postać, Temat).  -- zapytaj postać o dany temat.'), nl,
    write('shout(Postać, Temat).-- krzyknij coś na dany temat.'), nl,
    write('instructions.        -- pokaż tę pomoc jeszcze raz.'), nl,
    write('wait.                -- zaczekaj chwilę.'), nl,
    write('halt.                -- zakończ grę.'), nl,
    nl.


introduction :-
    nl,
    write('W ramach legendarnych 12 prac, które mają udowodnić wyższość Galów nad Rzymianami,'), nl,
    write('Asterix i Obelix mają już za sobą sześć zadań.'), nl,
    write('Pokonali dzikie bestie, przechytrzyli hipnotyzera i najedli się u kucharza olimpijskiego.'), nl, nl,
    write('Teraz przygotowują się na kolejne wyzwanie. Tym razem jednak nie czeka ich walka na arenie,'), nl,
    write('lecz coś znacznie gorszego... biurokracja.'), nl, nl,
    write('Urzędnik: Waszym kolejnym zadaniem będzie zdobycie zaświadczenia A38,'), nl,
    write('które pozwoli wam uczestniczyć w następnej próbie.'), nl,
    write('Asterix: Aaaa, chodzi o zwykłą administracyjną formalność?'), nl,
    write('Urzędnik: Tak jest, administracyjna, formalność, musicie poprosić o zaświadczenie A38'), nl, nl,
    write('Asterix i Obelix udają się do urzędu. Wchodzą do budynku...'), nl, nl,
    write('[Wpisz instructions. aby zobaczyć dostępne komendy]'), nl.


/* This rule prints out instructions and tells where you are. */

start :-
        introduction,
        look.


/* These rules describe the various rooms.  Depending on
   circumstances, a room may have more than one description. */

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
    write('Asterix: "Wiesz co, Obeliksie? Może lepiej pokonać Rzym siłą. To przynajmniej jest prostsze."'), nl,
    write('Obelix: "I bez schodów..."'), nl,
    finish.
