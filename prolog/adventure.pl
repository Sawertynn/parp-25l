/* Game A38 */

:- dynamic i_am_at/1, at/2, holding/1, person_at/2.
:- retractall(at(_, _)), retractall(i_am_at(_)), retractall(alive(_)).

i_am_at(urząd).
person_at(sekretarz, urząd).

connection(urząd, sekretariat).
connection(okienko1, dziwne_biuro).
connection(urząd, okienko1).

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

/* These rules are for asking a person about some subject */

talk(Person) :-
    person_at(Person, Place),
    i_am_at(Place),
    write('Możesz zapytać '), write(Person), write(' o:'),
    nl,
    fail.

talk(Person) :-
    person_at(Person, Place),
    i_am_at(Place),
    subject(Person, Subject, _),
    write(Subject),
    nl,
    fail.

talk(Person) :-
    person_at(Person, Place),
    i_am_at(Place),
    !.

talk(Person) :-
    write('Nie ma tutaj nikogo o imieniu '), write(Person),
    nl, !.

ask(Person, Subject) :-
    person_at(Person, Place),
    i_am_at(Place),
    subject(Person, Subject, Message),
    write(Message),
    nl,
    conversation_result(Person, Subject),
    !.

ask(Person, Subject) :-
    person_at(Person, Place),
    i_am_at(Place),
    subject(Person, Subject, _), !.

ask(Person, Subject) :-
    person_at(Person, Place),
    i_am_at(Place),
    write(Person), write(' nie wie nic o '), write(Subject),
    nl,
    !.

ask(Person, _) :-
    write('Nie ma tutaj nikogo o imieniu '), write(Person),
    nl, !.

shout(Person, Subject) :-
    person_at(Person, Place),
    i_am_at(Place),
    shout_response(Person, Subject, Message),
    write('Krzyczysz do '), write(Person), write(': "'), write(Subject), write('!!"'), nl,
    write(Message), nl,
    shout_result(Person, Subject),
    !.

shout(_, _) :-
    write('Krzyczysz w pustkę... Nikt cię nie słyszy.'), nl.

/* This rule tells how to die. */

die :-
        finish.


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
    write('start.             -- rozpocznij grę.'), nl,
    write('go(Miejsce).       -- przejdź do wskazanego miejsca.'), nl,
    write('look.              -- rozejrzyj się dookoła.'), nl,
    write('take(Przedmiot).   -- podnieś przedmiot.'), nl,
    write('drop(Przedmiot).   -- upuść przedmiot.'), nl,
    write('talk(Postać).      -- zobacz, o co możesz zapytać daną postać.'), nl,
    write('ask(Postać, Temat).-- zapytaj postać o dany temat.'), nl,
    write('instructions.      -- pokaż tę pomoc jeszcze raz.'), nl,
    write('halt.              -- zakończ grę.'), nl,
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
    write('[Nowa lokacja odblokowana: „dziwne_biuro” - możesz tam teraz wejść za pomocą komendy go(dziwne_biuro).]').


describe(dziwne_biuro) :-
    write('Za drzwiami nie ma biurka ani okienka, jak można by się spodziewać.'), nl,
    write('Zamiast tego - huśtawka. Na niej urzędnik w togach, obok dama w czerwonej tunice, zajęci rozmową.'), nl,
    write('Gdy Asterix i Obelix wchodzą, oboje zamierają.'), nl,
    write('Urzędnik (oburzony): "KTO WAM POZWOLIŁ WEJŚĆ DO MEGO BIURA?!"'), nl.
