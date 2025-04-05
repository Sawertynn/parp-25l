/* Game A38 */

:- dynamic i_am_at/1, at/2, holding/1, opened/1.
:- retractall(at(_, _)), retractall(i_am_at(_)), retractall(opened(_)).

:- ['place_descriptions.pl'].
:- ['world_facts.pl'].
:- ['help.pl'].
:- ['dialogues.pl'].
:- ['player_actions.pl'].
:- ['interactions.pl'].

:- initialization(start).


finish :-
        nl,
        write('Gra dobiegła końca.'),
        nl,
        halt.

start :-
        introduction, nl,
        write('[Wpisz instructions. aby zobaczyć dostępne komendy]'), nl,
		write('[Wpisz look. aby dowiedzieć się gdzie jesteś]'), nl, nl.
