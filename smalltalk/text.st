Object subclass: Text [

    introductionText := #(
            ''
            'W ramach legendarnych 12 prac, które mają udowodnić wyższość Galów nad Rzymianami,'
            'Asterix i Obelix mają już za sobą sześć zadań.'
            'Pokonali dzikie bestie, przechytrzyli hipnotyzera i najedli się u kucharza olimpijskiego.'
            ''
            'Teraz przygotowują się na kolejne wyzwanie. Tym razem jednak nie czeka ich walka na arenie,'
            'lecz coś znacznie gorszego... biurokracja.'
            ''
            'Kwestor: Waszym kolejnym zadaniem będzie zdobycie zaświadczenia A38,'
            'które pozwoli wam uczestniczyć w następnej próbie.'
            'Asterix: Aaaa, chodzi o zwykłą administracyjną formalność?'
            'Kwestor: Tak jest, administracyjna, formalność, musicie poprosić o zaświadczenie A38.'
            ''
            'Asterix i Obelix udają się do urzędu. Wchodzą do budynku...'
            ''
            '[Możesz rozejrzeć się poleceniem "look"]'
        ).

    instructionsText := #(
            ''
            'Używaj standardowej składni do wpisywania poleceń.'
            'Dostępne komendy:'
            ''
            'start                -- rozpocznij grę.'
            'go Miejsce           -- przejdź do wskazanego miejsca.'
            'look                 -- rozejrzyj się dookoła.'
            'take Przedmiot       -- podnieś przedmiot.'
            'drop Przedmiot       -- upuść przedmiot.'
            'talk Postać          -- zobacz, o co możesz zapytać daną postać.'
            'ask Postać Temat     -- zapytaj postać o dany temat.'
            'shout Postać Temat   -- krzyknij coś na dany temat.'
            'instructions         -- pokaż tę pomoc jeszcze raz.'
            'wait                 -- zaczekaj chwilę.'
            'quit                 -- zakończ grę.'
            ''
        ).

    closingOfficeInfo := #(
            'Mineła 16:00, urząd się zamyka'
            'Asterix: Ehhh.... '
            'Asterix i Obelix błąkają się po urzędzie bez końca. Formularz prowadzi do formularza, ten do kolejnego - i tak w nieskończoność.'
            'W końcu Obelix nie wytrzymuje. Zaczyna chodzić w kółko, wymachując rękami, krzycząc i z każdym krokiem rośnie jego frustracja.'
            'Obelix: Nigdy stąd nie wyjdziemy, Asteriksie... Tu chyba nie ma nadziei, a formularz za formularzem...'
            'Asterix: Spokojnie, Obelix. Może coś się jeszcze uda załatwić..., '
            'Nagle pojawia się ochrona. Zauważyli hałas i zaczynają podejście do Galów.'
            'Ochroniarz: Panowie, spokojnie... W urzędzie nie krzyczymy.'
            'Bez zbędnych słów wyprowadzają Asteriksa i Obeliksa na zewnątrz.'
            'Asterix i Obelix stoją teraz przed urzędowym budynkiem, nie wiedząc, co zrobić dalej.'
            'Ochroniarz: A tak w ogóle, jaki był powód tej awantury?'
            'Obelix: Eee... formularze. Znowu formularze... Cały ten urząd to jedno wielkie zamieszanie!'
            'Asterix: Spokojnie, Obelix. Wiesz, jak to bywa... biurokracja...'
            'Ochroniarz: Biurokracja, mówicie... No cóż, w takim razie życzę powodzenia, panowie. W urzędzie wszystko ma swój czas... a wasz czas skończył się na dziś.'
            '[Możesz rozejrzeć się poleceniem look]'
        ).

    waitingForOfficeOpeningInfo := #(
            'Asterix i Obelix postanawiają nie tracić więcej nerwów.'
            'Udają się do pobliskiego baru "Pod Rzymską Pieczęcią", gdzie jedzą kolację i popijają galijskim cydrem.'
            'Wieczór mija na wspominkach, narzekaniu i... kolejnym dzbanie cydru.'
            'Obelix: No! To się nazywa urządzenie się.'
            'Następnego ranka wychodzą z baru i patrzą na wschodzące słońce.'
            'Asterix: Wybiła 8:00, wygląda na to, że urząd znowu otwarty...'
            'Po chwili coś szczęka w zamku. Urząd znów otwarty.'
        ).

    endingMessage := #(
        'Asterix kładzie dokument A38 na biurku przed kwestorem.'
        'Kwestor bierze formularz, przygląda się mu uważnie, po czym kiwa z uznaniem głową.'
        'Kwestor: Imponujące. Niewielu przeszło tę ścieżkę bez rozlewu krwi. Gratulacje, Galowie.'
        'Kwestor: Gotowi na kolejne zadanie?'
        'Asterix: Jeśli nie wymaga odwiedzin w żadnym urzędzie... to chyba tak.'
        'Obelix: Zdecydowanie tak.'
        '[Zaświadczenie A38 dostarczone. Jedna z prób zakończona]'
    ).

    Text class >> printLines: arrayOfLines [
        arrayOfLines do: [:line | Transcript show: line; cr].
    ]

    Text class >> printIntroduction [
        self printLines: introductionText.
    ]

    Text class >> printInstructions [
        self printLines: instructionsText.
    ]

    Text class >> printOfficeClosed [
        self printLines: closingOfficeInfo
    ]

    Text class >> printWaitingForOfficeOpening [
        self printLines: waitingForOfficeOpeningInfo
    ]

    Text class >> printEndingMsg [
        self printLines: endingMessage
    ]
]
