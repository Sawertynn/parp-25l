Object subclass: GameState [

    | isGameOver currentlyAt holding itemsAt officeClosed |

    GameState class >> new [
        | s |
        s := super new.
        s init.
        ^ s
    ]

    init [
        isGameOver := false.
        officeClosed := false.
        currentlyAt := Location findByName: 'urząd'.
        holding := OrderedCollection new.
        itemsAt := Dictionary new
    ]

    at: key [
        key = #isGameOver ifTrue: [ ^ isGameOver ].
        key = #officeClosed ifTrue: [ ^ officeClosed ].
        key = #currentlyAt ifTrue: [ ^ currentlyAt ].
        key = #holding ifTrue: [ ^ holding ].
        key = #itemsAt ifTrue: [ ^ itemsAt ].
        self error: 'Nieznany klucz: ', key printString.
    ]

    at: key put: value [
        key = #isGameOver ifTrue: [ isGameOver := value. ^ value ].
        key = #officeClosed ifTrue: [ officeClosed := value. ^ value ].
        key = #currentlyAt ifTrue: [ currentlyAt := value. ^ value ].
        key = #holding ifTrue: [ holding := value. ^ value ].
        key = #itemsAt ifTrue: [ itemsAt := value. ^ value ].
        self error: 'Nieznany klucz: ', key printString.
    ]
]
