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
        after_take(X),
        !, nl.

take(_) :-
        write('Przedmiot nie jest w zasięgu twojego wzroku...'),
        nl.

after_take(fioletowy_formularz) :-
    nl,
    write('Urzędniczka: Do zobaczenia!'), nl,
    !.
	
after_take(niebieski_formularz) :-
    nl,
	write('Asterix: Dziękuję.'), nl,
	write('Obelix: I o ten świstek tylko zachodu??'), nl,
	write('Asterix: Obelixie na teutadesa, grzeczniej bo sprawisz pani przykrość i będziemy musieli tu siedzieć jeszcze dłużej...'), nl,
    !.

after_take(a38) :-
    write('Obelix: Mogę teraz zjeść dzika?'), nl,
    write('Asterix: Nie, Obelixie. Teraz pora pójść do kwestora i oddać mu to przeklęte zaświadczenie.'), nl,
    write('[Możesz wrócić do kwestora poleceniem "go(gabinet_kwestora)."]'), nl,
    !.

after_take(_).

/* These rules describe how to put down an object. */

drop(X) :-
        holding(X),
        i_am_at(Place),
        retract(holding(X)),
        assert(at(X, Place)),
        write('OK.'), nl,
        after_drop(X),
        !, nl.

drop(_) :-
        write('Nie posiadasz tego przedmiotu...'),
        nl.

after_drop(a38) :-
    i_am_at(gabinet_kwestora),
    write('Asterix kładzie dokument A38 na biurku przed kwestorem.'), nl,
    write('Kwestor bierze formularz, przygląda się mu uważnie, po czym kiwa z uznaniem głową.'), nl,
    write('Kwestor: Imponujące. Niewielu przeszło tę ścieżkę bez rozlewu krwi. Gratulacje, Galowie.'), nl,
    write('Kwestor: Gotowi na kolejne zadanie?'), nl,
    write('Asterix: Jeśli nie wymaga odwiedzin w żadnym urzędzie... to chyba tak.'), nl,
    write('Obelix: Zdecydowanie tak.'), nl,
    nl,
    write('[Zaświadczenie A38 dostarczone. Jedna z prób zakończona]'), nl,
    finish,
    !.

after_drop(_).

/* This rule tells how to move to a given place. */

go(Place) :-
        i_am_at(Here),
        connection(Here, Place),
        retract(i_am_at(Here)),
        assert(i_am_at(Place)),
		use_time(60),
        !, look.

go(_) :-
        write('Bohaterowie nie mogą pójść tą drogą, ale i tak krążą i szukają.'),
		use_time(30).

/* This rule tells how to look about you. */

look :-
        i_am_at(Place),
        describe(Place),
        nl,
        notice_objects_at(Place),
        nl.

/* These rules set up a loop to mention all the objects in your vicinity. */

notice_objects_at(Place) :-
        at(X, Place),
        write('Jest tu '), write(X), write('.'), nl,
        fail.

notice_objects_at(_).
