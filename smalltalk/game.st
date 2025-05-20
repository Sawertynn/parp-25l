Object subclass: Game [
    | isGameOver currentlyAt |

    Game class >> new [
        | g |
        g := super new.
        g init.
        ^g
    ]

    init [
        isGameOver := false.
        Location setupPlaces.
        currentlyAt := Location findByName: 'urząd'
    ]

    readCommand [
        Transcript show: '> '.
        ^ FileStream stdin nextLine
    ]

    run [
        | input isUnknown |

        Text printIntroduction.
        Text printInstructions.

        [isGameOver] whileFalse: [

            isUnknown := true.
            input := self readCommand.

            input = 'instructions' ifTrue: [
                Text printInstructions.

                isUnknown := false
            ].

            input = 'quit' ifTrue: [
                isGameOver := true.

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
                self goPlace: placeName.

                isUnknown := false
            ].

            isUnknown ifTrue: [
                Text printLines: #('Nieznana komenda...' '')
            ]
        ]
    ]

    goPlace: placeName [
        | place |
        place := Location findByName: placeName.
        place ifNotNil: [
            (place = currentlyAt)
                ifTrue: [Text printLines: #('Już tu jesteś.' '')]
            ifFalse: [
                currentlyAt := place.
                Text printLines: #('Przeszedłeś do nowej lokacji.' '')
            ].
        ] ifNil: [
            Text printLines: #('Nie ma takiego miejsca...' '')
        ].
    ]

    lookAround [
        Text printLines: currentlyAt getDescription
    ]
]

Game new run.
