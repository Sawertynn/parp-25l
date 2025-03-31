:- discontiguous subject/3.
:- discontiguous conversation_result/2.
:- discontiguous shout_response/3.
:- discontiguous shout_result/2.

subject(sekretarz, a38,
    'Sekretarz: Zarejestrować okręt tak? Nie, źle was skierowano. Musicie zawrócić do kapitana portu.').

conversation_result(sekretarz, a38) :-
    write('Asterix: Asterix: Co? Nie, chcemy rejestrować okrętu... On chyba jest głuchy'), nl,
    write('Sekretarz: CO!?'), nl.

shout_response(sekretarz, a38,
    'Sekretarz: NIE KRZYCZ TUTAJ DOBRZE? CO ZA WYCHOWANIE! NA JOWISZA ZA KOGO WY SIE UWAŻACIE.').

shout_result(sekretarz, a38) :-
    holding(niebieski_formularz),
    holding(fioletowy_formularz),
    write('Sekretarz: Aaaa, to wy z tymi formularzami...'), nl,
    write('Sekretarz: No dobrze. Skoro macie i niebieski, i fioletowy...'), nl,
    write('Sekretarz: Udajcie się do okienka 77. Piętro 2, korytarz L, wejście K. Ale cicho!'), nl,
    write('[Nowa lokacja odblokowana: "okienko77"]'), nl,
    !.

shout_result(sekretarz, a38) :-
    write('Sekretarz: Poszukajcie okienka nr. 1. Korytarzem w lewo, ostatnie drzwi na prawo.'), nl,
    write('Możesz teraz przejść do okienka nr 1. [nazwa: okienko1]'), nl,
    !.

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
    holding(fioletowy_formularz),
    write('Urzędniczka: Przecież macie już fioletowy formularz w ręku! Nie wiem nic o niebieskim formularzu. Dajcie mi spokój.'), nl,
    write('Urzędniczka: Idźcie do okienka 42, bo urząd się zaraz zamknie!'), nl.

conversation_result(urzędniczka4_5, niebieski_formularz) :-
    \+ at(fioletowy_formularz, okienko35),
    assert(at(fioletowy_formularz, okienko35)),
    write('Urzędniczka: Proszę, oto fioletowy formularz. Teraz proszę udać się na piąte piętro, schody K, korytarz W, okienko numer 42.'), nl,
    write('Asterix: Fioletowy? Przecież pytaliśmy o niebieski...'), nl,
    write('Obelix: Cicho, mamy jakiś formularz. Bierz i idziemy.'), nl,
    write('["fioletowy_formularz" jest dostepny do wzięcia przez polecenie "take"]'), nl,
    write('[Nowa lokacja odblokowana: "okienko42"]'), nl.

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


subject(urzędniczka77, a38,
    'Urzędniczka: A38? Oczywiście, moi drodzy. Macie formularze?').

conversation_result(urzędniczka77, a38) :-
    holding(niebieski_formularz),
    holding(fioletowy_formularz),
    \+ at(a38, okienko77),
    assert(at(a38, okienko77)),
    write('Asterix i Obelix bez słowa podają niebieski i fioletowy pergamin.'), nl,
    write('Urzędniczka przybija pieczątkę z godłem Cesarstwa, owija wszystko w czerwoną wstążkę i kładzie A38 na biurku.'), nl,
    write('Urzędniczka: Gratuluję.'), nl,
    write('Obelix (z niedowierzaniem): To już?'), nl,
    write('Asterix: Tak. Chyba naprawdę to mamy.'), nl,
    write('Obelix: Mogę teraz zjeść dzika?'), nl,
    write('["a38" jest dostępny do wzięcia przez polecenie "take(a38)."]'), nl,
    !.

conversation_result(urzędniczka77, a38) :-
    at(a38, okienko77),
    write('Urzędniczka: A38 leży tu na biurku. Proszę zabrać.'), nl,
    !.

conversation_result(urzędniczka77, a38) :-
    \+ holding(niebieski_formularz),
    write('Urzędniczka: Przykro mi, potrzebuję niebieskiego formularza.'), nl,
    !.

conversation_result(urzędniczka77, a38) :-
    \+ holding(fioletowy_formularz),
    write('Urzędniczka: Przykro mi, potrzebuję fioletowego formularza.'), nl,
    !.
