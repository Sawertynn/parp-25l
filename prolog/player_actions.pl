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

after_take(niebieski_formularz) :-
    nl,
    write('Urzędniczka: Panowie właśnie wybija 16, więc urząd się zamyka teraz, zapraszamy jutro w celu dokończenia formalności.'), nl,
    write('Asterix: Ehhh....'), nl, nl,
    write('Asterix i Obelix błąkają się po urzędzie bez końca. Formularz prowadzi do formularza, ten do kolejnego - i tak w nieskończoność.'), nl,
    write('W końcu Obelix nie wytrzymuje. Zaczyna chodzić w kółko, wymachując rękami, krzycząc i z każdym krokiem rośnie jego frustracja.'), nl,
    write('Obelix: Nigdy stąd nie wyjdziemy, Asteriksie... Tu chyba nie ma nadziei, a formularz za formularzem...'), nl,
    write('Asterix: Spokojnie, Obelix. Może coś się jeszcze uda załatwić...'), nl, nl,
    write('Nagle pojawia się ochrona. Zauważyli hałas i zaczynają podejście do Galów.'), nl,
    write('Ochroniarz: Panowie, spokojnie... W urzędzie nie krzyczymy. Macie zakaz wstępu do tego budynku na razie.'), nl,
    write('Bez zbędnych słów wyprowadzają Asteriksa i Obeliksa na zewnątrz.'), nl,
    write('Asterix i Obelix stoją teraz przed urzędowym budynkiem, nie wiedząc, co zrobić dalej.'), nl,
    write('Ochroniarz: A tak w ogóle, jaki był powód tej awantury?'), nl,
    write('Obelix: Eee... formularze. Znowu formularze... Cały ten urząd to jedno wielkie zamieszanie!'), nl,
    write('Asterix: Spokojnie, Obelix. Wiesz, jak to bywa... biurokracja...'), nl,
    write('Ochroniarz: Biurokracja, mówicie... No cóż, w takim razie życzę powodzenia, panowie. W urzędzie wszystko ma swój czas... a wasz czas skończył się na dziś.'), nl,
    write('[Możesz rozejrzeć się poleceniem "look."]'), nl,
    retract(i_am_at(_)),
    assert(i_am_at(przed_urzędem)),
    !.

after_take(fioletowy_formularz) :-
    write('Urzędniczka: Do zobaczenia!'), nl,
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
        write('OK.'),
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



