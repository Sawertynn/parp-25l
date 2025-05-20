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
                | placeName place |
                placeName := input allButFirst: 3.
                place := Location findByName: placeName.
                self goPlace: place.

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
        Text printLines: (state at: #currentlyAt) getDescription
    ]

    goPlace: place [
        place ifNotNil: [
            (place = (state at: #currentlyAt))
                ifTrue: [Text printLines: #('Już tu jesteś.' '')]
                ifFalse: [
                    state at: #currentlyAt put: place.
                    Text printLines: #('Przeszedłeś do nowej lokacji.' '')
                ].
        ] ifNil: [
            Text printLines: #('Nie ma takiego miejsca...' '')
        ].
    ]

    askPerson: state personName: person topicName: topic [
        ^ Dialogues handleDialogue: state person: person topic: topic type: #ask.
    ]

    shoutPerson: state personName: person topicName: topic [
        ^ Dialogues handleDialogue: state person: person topic: topic type: #shout.
    ]
]

Game new run.
