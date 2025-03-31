/* Game A38 */

:- dynamic i_am_at/1, at/2, holding/1, person_at/2, connection/2.
:- retractall(at(_, _)), retractall(i_am_at(_)).

:- ['place_descriptions.pl'].
:- ['world_facts.pl'].
:- ['help.pl'].
:- ['dialogues.pl'].

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
    member(Real, [urzędniczka, urzędniczka2, urzędniczka3, urzędniczka4, urzędniczka4_5, urzędniczka5, urzędniczka77]), !.

resolve_real_person(Name, Name).

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
    i_am_at(przed_urzędem),
    \+ connection(przed_urzędem, urząd),
    assert(connection(przed_urzędem, urząd)), % odblokowujemy przejscie
    write('Asterix i Obelix postanawiają nie tracić więcej nerwów.'), nl,
    write('Udają się do pobliskiego baru "Pod Rzymską Pieczęcią", gdzie jedzą kolację i popijają galijskim cydrem.'), nl,
    write('Wieczór mija na wspominkach, narzekaniu i... kolejnym dzbanie cydru.'), nl,
    write('Obelix: No! To się nazywa urządzenie się.'), nl,
    write('Następnego ranka wychodzą z baru i patrzą na wschodzące słońce.'), nl,
    write('Asterix: Wygląda na to, że urząd znowu otwarty...'), nl,
    write('[Możesz teraz wrócić do urzędu poleceniem "go(urząd)."]'), nl,
    !.

wait :-
    i_am_at(Place),
    write('Asterix i Obelix siadają gdzieś w kącie w miejscu: '), write(Place), write('.'), nl,
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


/* This rule prints out instructions and tells where you are. */

start :-
        introduction,
        look.
