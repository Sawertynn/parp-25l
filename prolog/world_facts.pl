
i_am_at(urząd).
person_at(sekretarz, urząd).
person_at(urzędnik, dziwne_biuro).
person_at(urzędniczka, parter).
person_at(urzędniczka2, okienko2).
person_at(portier, portiernia).
person_at(prefekt, portiernia).
person_at(urzędniczka3, trzecie_piętro).
person_at(urzędniczka4, okienko8) :- opened(okienko8).
person_at(urzędniczka4_5, okienko35).
person_at(urzędniczka5, okienko42).
person_at(urzędniczka77, okienko77).
person_at(kwestor, gabinet_kwestora).

current_time(8 * 60). % czas jest w minutach jest zaczynamy o godzinie 8:00 urząd jest otwarty do 16:00;
opened(urząd).

connection(urząd, okienko1).
connection(urząd, dziwne_biuro).
connection(urząd, szóste_piętro).
connection(urząd, parter).
connection(urząd, okienko2).
connection(urząd, portiernia).
connection(urząd, trzecie_piętro).
connection(urząd, okienko8).
connection(urząd, okienko35).
connection(urząd, okienko42).
connection(urząd, okienko77).
connection(urząd, gabinet_kwestora).

connection(okienko1, dziwne_biuro).
connection(dziwne_biuro, szóste_piętro).
connection(szóste_piętro, parter).
connection(parter, okienko2).
connection(okienko2, portiernia).
connection(portiernia, trzecie_piętro).
connection(trzecie_piętro, okienko8).
connection(okienko8, okienko35).
connection(okienko35, okienko42).

connection(przed_urzędem, urząd) :- opened(urząd).
connection(przed_urzędem, wioska). % wioska jest terminalną lokacją, zakończenie nr. 1

connection(okienko77, gabinet_kwestora). % gabinet kwestora jest terminalną lokacją, zakończenie nr. 2

connection(gabinet_kwestora, urząd).
connection(okienko77, urząd).
connection(okienko42, urząd).