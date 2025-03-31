/* Game A38 */

:- dynamic i_am_at/1, at/2, holding/1, person_at/2, connection/2.
:- retractall(at(_, _)), retractall(i_am_at(_)).

:- ['place_descriptions.pl'].
:- ['world_facts.pl'].
:- ['help.pl'].
:- ['dialogues.pl'].
:- ['player_actions.pl'].


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
