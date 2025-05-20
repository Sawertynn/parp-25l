

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
                    'Sekretarz: Zarejestrować okręt tak? Nie, źle was skierowano.'
                    'Asterix: On chyba jest głuchy.'
                    '*Możesz wykrzyczeć coś do kogoś - shout sekretarz a38*'
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

    Dialogues class >> handleDialogue: state person: person topic: topic type: type [
        | currentPlace personDialogues topicDialogues matched |
        currentPlace := state at: #currentlyAt.

        personDialogues := (self allDialogues select: [ :d |
            (((d placeName) = currentPlace)
                and: [ (d personName) = person ])
                and: [ (d dialogueType) = type ]
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
