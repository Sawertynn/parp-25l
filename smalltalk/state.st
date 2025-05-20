Object subclass: GameState [

    | isGameOver currentlyAt |

    GameState class >> new [
        | s |
        s := super new.
        s init.
        ^ s
    ]

    init [
        isGameOver := false.
        currentlyAt := Location findByName: 'urząd'
    ]

    at: key [
        key = #isGameOver ifTrue: [ ^ isGameOver ].
        key = #currentlyAt ifTrue: [ ^ currentlyAt ].
        self error: 'Nieznany klucz: ', key printString.
    ]

    at: key put: value [
        key = #isGameOver ifTrue: [ isGameOver := value. ^ value ].
        key = #currentlyAt ifTrue: [ currentlyAt := value. ^ value ].
        self error: 'Nieznany klucz: ', key printString.
    ]
]
