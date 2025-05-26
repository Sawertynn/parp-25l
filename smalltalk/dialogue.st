

Object subclass: Dialogue [
    | person place type topic condition effect content |

    Dialogue class >> newPerson: newPerson place: newPlace type: newType topic: newTopic condition: newCondition effect: newEffect content: newContent [
        ^ self new initWithPerson: newPerson place: newPlace type: newType topic: newTopic condition: newCondition effect: newEffect content: newContent
    ]

    initWithPerson: newPerson place: newPlace type: newType topic: newTopic condition: newCondition effect: newEffect content: newContent [
        person := newPerson.
        place := newPlace.
        type := newType.
        topic := newTopic.
        condition := newCondition.
        effect := newEffect.
        content := newContent.
        ^ self
    ]

    personName [ ^ person ]
    placeName [ ^ place ]
    dialogueType [ ^ type ]
    topicName [ ^ topic ]
    conditionBlock [ ^ condition ]
    effectBlock [ ^ effect ]
    content [ ^ content ]
]


Object subclass: Dialogues [

    dialogues := nil.

    Dialogues class >> setupDialogues [
        dialogues := {
            Dialogue newPerson: 'sekretarz'
                place: (Location findByName: 'urząd')
                type: #ask
                topic: 'a38'
                condition: self alwaysTrue
                effect: self doNothing
                content: #(
                    'Sekretarz: Zarejestrować okręt tak? Nie, źle was skierowano. Musicie zawrócić do kapitana portu.'
                    'Asterix: Co? Nie, nie chcemy rejestrować okrętu... On chyba jest głuchy.'
                    'Sekretarz: CO!?'
                    'Obelix: Może trzeba na niego krzyknąć?'
                    'Asterix: To by było niemiłe...'
                    ''
                    'Asterix: Bohaterowie przemyśleli sprawę.'
                    '*Możesz wykrzyczeć coś do kogoś - shout sekretarz a38*'
                ).

            Dialogue newPerson: 'sekretarz'
                place: (Location findByName: 'urząd')
                type: #shout
                topic: 'a38'
                condition: [:state | (Dialogues areItemsInHolding: #('niebieski_formularz' 'fioletowy_formularz') onState: state)]
                effect: self doNothing
                content: #(
                    'Sekretarz: Aaaa, to wy z tymi formularzami...'
                    'Sekretarz: No dobrze. Skoro macie i niebieski, i fioletowy...'
                    'Sekretarz: Udajcie się do okienka 77. Piętro 2, korytarz L, wejście K. Ale cicho!'
                    '*Nowa lokacja odblokowana: "okienko77"*'
                ).

            Dialogue newPerson: 'sekretarz'
                place: (Location findByName: 'urząd')
                type: #shout
                topic: 'a38'
                condition: [:state | ((Dialogues areItemsInHolding: #('niebieski_formularz' 'fioletowy_formularz') onState: state) not)]
                effect: self doNothing
                content: #(
                    'Sekretarz: NIE KRZYCZ TUTAJ DOBRZE? CO ZA WYCHOWANIE! NA JOWISZA ZA KOGO WY SIE UWAŻACIE.'
                    'Sekretarz: Poszukajcie okienka nr. 1. Korytarzem w lewo, ostatnie drzwi na prawo.'
                    '*Nowa lokacja odblokowana: "okienko1"*'
                    '*Możesz udać się do innego miejsca - go okienko1*'
                ).

            Dialogue newPerson: 'urzędnik'
                place: (Location findByName: 'dziwne_biuro')
                type: #ask
                topic: 'okienko1'
                condition: self alwaysTrue
                effect: self doNothing
                content: #(
                    'Urzędnik: Sprawdźcie plan. Szóste piętro. I proszę zamknąć za sobą drzwi. Co za bezczelność... Proszę dalej, panienko.'
                    'Asterix: Chyba kogoś przeszkodziliśmy...'
                    '*Nowa lokacja odblokowana: "szóste_piętro"*'
                ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'parter')
                type: #ask
                topic: 'a38'
                condition: self alwaysTrue
                effect: self doNothing
                content: #(
                    'Urzędniczka: A38? Nie, źle was poinformowano. Musicie iść do okienka nr. 2.'
                    'Asterix: Czyli musimy iść dalej...'
                    '*Nowa lokacja odblokowana: "okienko2"*'
            ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'okienko2')
                type: #ask
                topic: 'a38'
                condition: self alwaysTrue
                effect: self doNothing
                content: #(
                    'Urzędniczka: Numer 2? Hm... Nie, to nie tutaj. Tutaj jest okienko numer 4. To obok to numer 8.'
                    'Urzędniczka: Jeśli bardzo państwu zależy, proszę popytać portiera.'
                    'Asterix: Okienko 2, które jest czwórką, a obok ósemka...'
                    'Obelix: A może by tak rzucić to wszystko i wrócić do dzików?'
                    '*Nowa lokacja odblokowana: "portiernia"*'
            ).

            Dialogue newPerson: 'portier'
                place: (Location findByName: 'portiernia')
                type: #ask
                topic: 'okienko2'
                condition: self alwaysTrue
                effect: self doNothing
                content: #(
                    'Portier: CO?'
                    'Asterix: Chyba potrzebujemy formularza A39, żeby nas ktoś usłyszał.'
            ).

            Dialogue newPerson: 'portier'
                place: (Location findByName: 'portiernia')
                type: #shout
                topic: 'okienko2'
                condition: self alwaysTrue
                effect: self doNothing
                content: #(
                    'Portier: COOOOO?!?!?!'
                    'Rozmowę przypadkiem usłyszał przechodzący obok prefekt.'
                    'Prefekt: No, no… tylko spokojnie. Tutaj przecież ludzie pracują.'
                    'Prefekt: Przyjacielu, powiedz — czego potrzebujesz?'
            ).

            Dialogue newPerson: 'prefekt'
            place: (Location findByName: 'portiernia')
            type: #ask
            topic: 'okienko2'
            condition: self alwaysTrue
            effect: self doNothing
            content: #(
                'Prefekt: Numer 2? Zaraz... gdzie ono się teraz znajduje?'
                'Portier: Gdy widziałem je po raz ostatni, Panie Prefekcie, było na trzecim piętrze, korytarz szósty. Łatwo trafić.'
                'Prefekt: No, widzicie Panowie? Teraz już wszystko jasne. I po co to całe zamieszanie?'
                '*Nowa lokacja odblokowana: "trzecie_piętro"*'
            ).

            Dialogue newPerson: 'prefekt'
                place: (Location findByName: 'portiernia')
                type: #ask
                topic: 'a38'
                condition: self alwaysTrue
                effect: self doNothing
                content: #(
                    'Asterix: Prefekt, czy wie Pan, gdzie znajduje się formularz A38?'
                    'Prefekt: A38? O nie, znowu ten koszmar...'
                    'Prefekt: Proszę wybaczyć, ale kawa mi stygnie, a formularze to nie moja działka.'
                    'Prefekt: Na trzecim piętrze na pewno ktoś będzie wiedział więcej. Jeśli jeszcze pamiętają.'
                    'Asterix: Zaczynam się zastanawiać, czy ten formularz w ogóle istnieje.'
                    'Obelix: A ja zaczynam podejrzewać, że nie zdążymy dziś na obiad...'
            ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'trzecie_piętro')
                type: #ask
                topic: 'a38'
                condition: self alwaysTrue
                effect: self doNothing
                content: #(
                    'Urzędniczka: Nie widzi Pan, że jestem zajęta? Proszę poczekać.'
                    'Urzędniczki wracają do rozmowy o znajomej i jej domniemanych aferach, zupełnie ignorując obecność Galów.'
            ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'trzecie_piętro')
                type: #shout
                topic: 'a38'
                condition: self alwaysTrue
                effect: self doNothing
                content: #(
                    'Urzędniczka: Och, ci ludzie są naprawdę niemożliwi. Krzyczeć w biurze? To przecież skandal!'
                    'Urzędniczka: Zaświadczenie A38, tak? A czy ma pan niebieski formularz?'
                    '*Możesz teraz zapytać o niebieski_formularz*'
            ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'trzecie_piętro')
                type: #ask
                topic: 'niebieski_formularz'
                condition: self alwaysTrue
                effect: self doNothing
                content: #(
                    'Urzędniczka: W celu uzyskania zaświadczenia A38 należy najpierw przedstawić niebieski formularz.'
                    'Urzędniczka: Proszę udać się do okienka nr 8.'
                    'Asterix: Och... Przecież już tam byliśmy...'
                    '*Nowa lokacja odblokowana: "okienko8"*'
            ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'otwarte_okienko8')
                type: #ask
                topic: 'niebieski_formularz'
                condition: self alwaysTrue
                effect: self doNothing
                content: #(
                    'Urzędniczka: Niebieski formularz? To nie tutaj. Okienko 35, czwarte piętro.'
                    'Asterix: Ciekawe, ile w tym budynku jest pięter...'
                    'Obelix: Mam nadzieję, że na czwartym piętrze mają coś do jedzenia.'
                    '*Nowa lokacja odblokowana: "okienko35"*'
            ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'okienko35')
                type: #ask
                topic: 'niebieski_formularz'
                condition: [:state | Dialogues areItemsInHolding: #('fioletowy_formularz') onState: state]
                effect: self doNothing
                content: #(
                    'Urzędniczka: Przecież macie już fioletowy formularz w ręku! Nie wiem nic o niebieskim formularzu. Dajcie mi spokój.'
                    'Urzędniczka: Idźcie do okienka 42, bo urząd się zaraz zamknie!'
            ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'okienko35')
                type: #ask
                topic: 'niebieski_formularz'
                condition: [:state | ((Dialogues areItemsInHolding: #('fioletowy_formularz') onState: state) not)
                                    and: [(Dialogues isItemHere: 'fioletowy_formularz' onState: state) not]]
                effect: [:state | Dialogues putItemHere: 'fioletowy_formularz' onState: state]
                content: #(
                    'Urzędniczka: Dobrze, już wam go kładę. Macie ten fioletowy formularz w zasięgu ręki.'
                    'Urzędniczka: Podnieście go i przestańcie zawracać głowę z tym niebieskim formularzem.'
                    'Urzędniczka: Idźcie do okienka 42, bo urząd zaraz zamyka drzwi!'
                    '*Fioletowy formularz jest dostępny do wzięcia przez polecenie "take fioletowy_formularz"*'
            ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'okienko35')
                type: #ask
                topic: 'niebieski_formularz'
                condition: [:state | Dialogues isItemHere: 'fioletowy_formularz' onState: state]
                effect: self doNothing
                content: #(
                    'Urzędniczka: Przecież fioletowy formularz już tu leży! Macie go w zasięgu ręki. Dajcie mi spokój z tym niebieskim formularzem.'
                    'Urzędniczka: Idźcie do okienka 42, bo urząd zaraz zamyka drzwi!'
                    '*Nowa lokacja odblokowana: "okienko42"*'
            ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'okienko42')
                type: #ask
                topic: 'a38'
                condition: [:state | (Dialogues areItemsInHolding: #('fioletowy_formularz') onState: state) not]
                effect: self doNothing
                content: #(
                    'Urzędniczka: Najpierw będziecie potrzebować fioletowego formularza.'
                    '*Wróćcie do okienka 35 poleceniem "go okienko35"*'
            ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'okienko42')
                type: #ask
                topic: 'a38'
                condition: [:state |
                    (Dialogues areItemsInHolding: #('fioletowy_formularz') onState: state)
                        and: [
                            (Dialogues areItemsInHolding: #('niebieski_formularz') onState: state) not
                            and: [(Dialogues isItemHere: 'niebieski_formularz' onState: state) not]
                        ]
                ]
                effect: [:state | Dialogues putItemHere: 'niebieski_formularz' onState: state]
                content: #(
                    'Urzędniczka: O, to dobrze - fioletowy formularz macie.'
                    'Urzędniczka: To jeszcze niebieski - proszę bardzo, kładę go tu. Z tymi formularzami możecie już iść dalej.'
                    'Urzędniczka: Okienko 77. Piętro 2, korytarz L, wejście K. Tam powinni wam pomóc.'
                    '*"niebieski_formularz" jest dostępny do wzięcia przez polecenie "take"*'
                    '*Nowa lokacja odblokowana: "okienko77"*'
            ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'okienko42')
                type: #ask
                topic: 'a38'
                condition: [:state |
                    (Dialogues areItemsInHolding: #('fioletowy_formularz') onState: state)
                        and: [(Dialogues isItemHere: 'niebieski_formularz' onState: state)]
                ]
                effect: self doNothing
                content: #(
                    'Urzędniczka: Niebieski formularz już tu leży, proszę go po prostu zabrać.'
            ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'okienko42')
                type: #ask
                topic: 'a38'
                condition: [:state |
                    (Dialogues areItemsInHolding: #('fioletowy_formularz' 'niebieski_formularz') onState: state)
                        and: [(Dialogues isItemHere: 'niebieski_formularz' onState: state) not]
                ]
                effect: self doNothing
                content: #(
                    'Urzędniczka: Już wszystko wymagane do uzyskania formularza a38 macie.'
                    'Urzędniczka: Możecie iść do okienka 77. Tam wszystko wam wyjaśnią.'
            ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'okienko77')
                type: #ask
                topic: 'a38'
                condition: [:state |
                    (Dialogues areItemsInHolding: #('niebieski_formularz' 'fioletowy_formularz') onState: state)
                        and: [
                            (Dialogues isItemHere: 'a38' onState: state) not
                            and: [(Dialogues areItemsInHolding: #('a38') onState: state) not]
                        ]
                ]
                effect: [:state | Dialogues putItemHere: 'a38' onState: state]
                content: #(
                    'Asterix i Obelix bez słowa podają niebieski i fioletowy pergamin.'
                    'Urzędniczka przybija pieczątkę z godłem Cesarstwa, owija wszystko w czerwoną wstążkę i kładzie A38 na biurku.'
                    'Urzędniczka: Gratuluję. Kwestor kazał przekazać wam, że będzie czekał na was w jego gabinecie.'
                    'Obelix (z niedowierzaniem): To już?'
                    'Asterix: Tak. Chyba naprawdę to mamy.'
                    'Obelix: Mogę teraz zjeść dzika?'
                    '*"a38" jest dostępny do wzięcia przez polecenie "take a38"*'
                    '*Nowa lokacja odblokowana: "gabinet_kwestora"*'
            ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'okienko77')
                type: #ask
                topic: 'a38'
                condition: [:state | Dialogues isItemHere: 'a38' onState: state]
                effect: self doNothing
                content: #(
                    'Urzędniczka: A38 leży tu na biurku. Proszę zabrać.'
            ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'okienko77')
                type: #ask
                topic: 'a38'
                condition: [:state |
                    ((Dialogues areItemsInHolding: #('niebieski_formularz') onState: state) not)
                        and: [
                            (Dialogues areItemsInHolding: #('a38') onState: state) not
                            and: [(Dialogues isItemHere: 'a38' onState: state) not]
                        ]
                ]
                effect: self doNothing
                content: #(
                    'Urzędniczka: Przykro mi, potrzebuję niebieskiego formularza.'
                    'Obelix: Skąd mamy wziąć ten niebieski bulbularz?'
                    'Urzędniczka: Może na trzecim piętrze coś będą wiedzieć'
                    '*Możesz wrócić na trzecię piętro poleceniem "go trzecie_piętro"*'
            ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'okienko77')
                type: #ask
                topic: 'a38'
                condition: [:state |
                    ((Dialogues areItemsInHolding: #('fioletowy_formularz') onState: state) not)
                        and: [
                            (Dialogues areItemsInHolding: #('a38') onState: state) not
                            and: [(Dialogues isItemHere: 'a38' onState: state) not]
                        ]
                ]
                effect: self doNothing
                content: #(
                    'Urzędniczka: Przykro mi, potrzebuję fioletowego formularza.'
                    'Obelix: Skąd mamy wziąć ten fioletowego bulbularz?'
                    'Urzędniczka: Może na trzecim piętrze będą coś wiedzieć'
                    '*Możesz wrócić na trzecię piętro poleceniem "go trzecie_piętro"*'
            ).

            Dialogue newPerson: 'urzędniczka'
                place: (Location findByName: 'okienko77')
                type: #ask
                topic: 'a38'
                condition: [:state | Dialogues areItemsInHolding: #('a38') onState: state]
                effect: self doNothing
                content: #(
                    'Urzędniczka: Skoro już macie a38, to wystarczy pójśc do gabinetu kwestora.'
            ).
        }.
    ]

    Dialogues class >> alwaysTrue [
        ^ [ :state | true ]
    ]

    Dialogues class >> doNothing [
        ^ [ :state | state ]
    ]

    Dialogues class >> allDialogues [
        dialogues isNil ifTrue: [ self setupDialogues ].
        ^ dialogues
    ]

    Dialogues class >> isItemHere: itemName onState: state [
        | currentPlace itemsHere |
        currentPlace := state at: #currentlyAt.
        itemsHere := (state at: #itemsAt) at: currentPlace ifAbsent: [ OrderedCollection new ].
        ^ itemsHere includes: itemName
    ]

    Dialogues class >> putItemHere: itemName onState: state [
        | currentPlace itemsHere newItemsHere newItemsAt |
        currentPlace := state at: #currentlyAt.
        itemsHere := (state at: #itemsAt) at: currentPlace ifAbsent: [ OrderedCollection new ].
        (itemsHere includes: itemName) ifFalse: [
            itemsHere add: itemName.
            (state at: #itemsAt) at: currentPlace put: itemsHere.
        ].
        ^ state
    ]

    Dialogues class >> areItemsInHolding: itemNames onState: state [
        ^ (itemNames allSatisfy: [:itemName | (state at: #holding) includes: itemName])
    ]

    Dialogues class >> handleDialogue: state person: person topic: topic type: type [
        | currentPlace personDialogues topicDialogues matched |
        currentPlace := state at: #currentlyAt.

        personDialogues := (self allDialogues select: [ :d |
            ((d placeName = currentPlace)
                and: [ d personName = person ])
                and: [ d dialogueType = type ]
        ]).

        personDialogues isEmpty ifTrue: [
            Text printLines: {'Nie ma tu takiej osoby.'}.
            ^ state
        ].

        topicDialogues := personDialogues select: [ :d |
            d topicName = topic
        ].

        topicDialogues isEmpty ifTrue: [
            (type = #shout)
                ifTrue: [ Text printLines: {'Krzyczysz w pustkę. Nikt nie reaguje.'} ]
                ifFalse: [ Text printLines: {'Osoba nic nie wie o ', topic, '.'} ].
            ^ state
        ].

        matched := topicDialogues detect: [ :d |
            d conditionBlock value: state
        ] ifNone: [ nil ].

        matched isNil ifTrue: [
            Text printLines: {'Nie możesz teraz poruszyć tego tematu.'}.
            ^ state
        ].

        Text printLines: matched content.
        ^ matched effectBlock value: state
    ]
]
