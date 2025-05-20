Object subclass: Place [

    | name description |

    Place class >> name: newName description: newDescription [
        | p |
        p := self new.
        p setName: newName.
        p setDescription: newDescription.
        ^ p
    ]

    setName: newName [
        name := newName
    ]

    setDescription: newDescription [
        description := newDescription
    ]

    getName [
        ^ name
    ]

    getDescription [
        ^ description
    ]
]
