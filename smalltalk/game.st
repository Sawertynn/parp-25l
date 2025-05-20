Object subclass: Game [
    | state |

    Game class >> new [
        | g |
        g := super new.
        g init.
        ^g
    ]

    init [
        state := GameState new
    ]

    readCommand [
        Transcript show: '> '.
        ^ FileStream stdin nextLine
    ]

    run [
        | input isUnknown |

        [state at: #isGameOver] whileFalse: [

            isUnknown := true.
            input := self readCommand.

            input = 'start' ifTrue: [
                Text printIntroduction.
                Text printInstructions.

                isUnknown := false
            ].

            input = 'instructions' ifTrue: [
                Text printInstructions.

                isUnknown := false
            ].

            input = 'look' ifTrue: [
                self lookAround.

                isUnknown := false
            ].

            (input startsWith: 'go ') ifTrue: [
                | placeName place was_placed_changed |
                placeName := input allButFirst: 3.
                place := Location findByName: placeName.

                was_placed_changed := self goPlace: place.
                was_placed_changed ifTrue: [ self lookAround ].

                isUnknown := false
            ].

            (input startsWith: 'talk ') ifTrue: [
                | person |
                person := input allButFirst: 5.
                self talkPerson: person.

                isUnknown := false
            ].

            (input startsWith: 'ask ') ifTrue: [
                | tokens person topic |
                tokens := (input allButFirst: 4) substrings: ' '.
                person := tokens first.
                topic := (tokens size >= 2)
                    ifTrue: [ tokens second ]
                    ifFalse: [ '' ].

                state :=  self askPerson: state personName: person topicName: topic.
                Text printLines: #('').

                isUnknown := false
            ].

            (input startsWith: 'shout ') ifTrue: [
                | tokens person topic |
                tokens := (input allButFirst: 6) substrings: ' '.
                person := tokens first.
                topic := (tokens size >= 2)
                    ifTrue: [ tokens second ]
                    ifFalse: [ '' ].

                state :=  self shoutPerson: state personName: person topicName: topic.
                Text printLines: #('').

                isUnknown := false
            ].

            (input startsWith: 'take ') ifTrue: [
                | itemName |
                itemName := input allButFirst: 5.
                self takeItem: itemName.

                (itemName = 'fioletowy_formularz') ifTrue: [
                    self handleKickoutFromOffice.
                ].
                Text printLines: #('').

                isUnknown := false.
            ].

            (input startsWith: 'drop ') ifTrue: [
                | itemName |
                itemName := input allButFirst: 5.
                self dropItem: itemName.
                Text printLines: #('').

                isUnknown := false.
            ].

            input = 'wait' ifTrue: [
                self wait.

                isUnknown := false
            ].

            input = 'quit' ifTrue: [
                state at: #isGameOver put: true.

                isUnknown := false
            ].

            isUnknown ifTrue: [
                Text printLines: #('Nieznana komenda...' '')
            ]


        ]
    ]

    lookAround [
        | currentPlace people items |
        currentPlace := state at: #currentlyAt.
        Text printLines: currentPlace getDescription.

        people := (Dialogues allDialogues select: [:d | d placeName = currentPlace and: [d conditionBlock value: state]]) collect: [:d | d personName].
        people := people asSet asSortedCollection.

        people isEmpty
            ifFalse: [ Text printLines: { ''. 'Są tu:' } , (people collect: [:p | '- ', p]) ].

        items := (state at: #itemsAt) at: currentPlace ifAbsent: [ OrderedCollection new ].
        items isEmpty
            ifFalse: [ Text printLines: { ''. 'Widzisz tutaj przedmioty: ' } , (items collect: [:i | '- ', i]) ].

        Text printLines: #('').
    ]

    talkPerson: personName [
        | currentPlace topics msg |
        currentPlace := state at: #currentlyAt.

        topics := (Dialogues allDialogues select: [:d |
            (d personName = personName)
                and: [
                    (d placeName = currentPlace)
                        and: [
                            (d dialogueType = #ask)
                                and: [
                                    (d conditionBlock value: state)
                                ]
                        ]
                ]
        ]) collect: [:d | d topicName].

        topics isEmpty
            ifTrue: [
                Text printLines: #('Nie ma tu takiej osoby, rozejrzyj się poleceniem "look"').
            ]
            ifFalse: [
                msg := { 'Tematy do rozmowy z ', personName, ':' } , (topics collect: [:t | '- ', t]), #('').
                Text printLines: msg.
            ].

        ^ state
    ]

    goPlace: place [
        place ifNotNil: [
            (place = (state at: #currentlyAt))
                ifTrue: [Text printLines: #('Już tu jesteś.' '')]
                ifFalse: [
                    ((state at: #officeClosed) = true and: [ (place getName) ~= 'wioska' ])
                        ifTrue: [
                            Text printLines: #('Urząd jest zamknięty. Nie możesz teraz wejść. Możesz albo zaczekać albo wrócić do wioski')
                        ]
                        ifFalse: [
                            state at: #currentlyAt put: place.
                            ^ true.
                        ]
                ].
        ] ifNil: [
            Text printLines: #('Nie ma takiego miejsca...' '')
        ].

        ^ false.
    ]

    askPerson: state personName: person topicName: topic [
        ^ Dialogues handleDialogue: state person: person topic: topic type: #ask.
    ]

    shoutPerson: state personName: person topicName: topic [
        ^ Dialogues handleDialogue: state person: person topic: topic type: #shout.
    ]

    takeItem: itemName [
        | currentPlace itemsHere itemIndex |
        currentPlace := state at: #currentlyAt.
        itemsHere := (state at: #itemsAt) at: currentPlace ifAbsent: [ OrderedCollection new ].

        itemIndex := itemsHere indexOf: itemName.
        (itemIndex = 0)
            ifTrue: [
                Text printLines: #('Nie ma tu takiego przedmiotu.').
            ]
            ifFalse: [
                itemsHere removeAtIndex: itemIndex.
                (state at: #holding) add: itemName.

                Text printLines: { 'Podniosłeś ', itemName }.
            ]
    ]

    dropItem: itemName [
        | currentPlace holding itemsHere |
        currentPlace := state at: #currentlyAt.
        holding := state at: #holding.

        (holding includes: itemName) ifFalse: [
            Text printLines: #('Nie masz takiego przedmiotu.').
            ^ nil
        ].

        holding remove: itemName.

        itemsHere := (state at: #itemsAt) at: currentPlace ifAbsent: [ OrderedCollection new ].
        itemsHere add: itemName.

        (itemName = 'a38' and: [ currentPlace getName = 'gabinet_kwestora' ])
            ifTrue: [
                Text printEndingMsg.
                state at: #isGameOver put: true.
            ]
            ifFalse: [
                Text printLines: { 'Odłożyłeś ', itemName }.
            ].
    ]

    wait [
        | currentPlace |
        (state at: #officeClosed) = true
            ifTrue: [
                self waitForOfficeOpening.
                ^ nil
            ].


        currentPlace := (state at: #currentlyAt) getName.
        currentPlace = 'okienko8'
            ifTrue: [ self waitAtOkienko8 ]
            ifFalse: [
                Text printLines: #('Czekasz... ale nic się nie dzieje.').
            ].
    ]

    waitAtOkienko8 [
        | updated baseMessage desc |
        self goPlace: (Location findByName: 'otwarte_okienko8').
        self lookAround.
    ]

    waitForOfficeOpening [
        state at: #officeClosed put: false.
        Text printWaitingForOfficeOpening.
    ]

    handleKickoutFromOffice [
        self goPlace: (Location findByName: 'przed_urzędem').
        state at: #officeClosed put: true.
        Text printOfficeClosed
    ]
]

Game new run.
