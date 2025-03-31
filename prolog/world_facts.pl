

i_am_at(przed_urzędem).
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
person_at(urzędniczka77, okienko77).
person_at(kwestor, gabinet_kwestora).

connection(urząd, sekretariat).
connection(urząd, okienko1).
connection(urząd, okienko77) :-
    holding(niebieski_formularz),
    holding(fioletowy_formularz).
connection(okienko77, gabinet_kwestora). % gabinet kwestora jest terminalną lokacją, zakończenie nr. 2
connection(okienko1, dziwne_biuro).
connection(dziwne_biuro, szóste_piętro).
connection(szóste_piętro, parter).
connection(parter, okienko2).
connection(okienko2, portiernia).
connection(portiernia, trzecie_piętro).
connection(trzecie_piętro, okienko8).
connection(okienko8_po_otwarciu, okienko35).
connection(okienko35, okienko42).

connection(przed_urzędem, wioska). % wioska jest terminalną lokacją, zakończenie nr. 1
