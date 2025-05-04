module Place where

import Data.List (find)

data Place = Place{
    pl_name :: String,
    pl_description :: String
    }
    deriving (Eq, Show)

allPlaces :: [Place]
allPlaces = [
    Place {
        pl_name = "urząd",
        pl_description = "Wchodzisz do urzędu. Zapach pergaminu, starych sandałów i beznadziei wita cię jak stary znajomy.\n\
        \Przy drzwiach siedzi sekretarz, który wygląda jakby nigdy nie mrugnął od objęcia stanowiska.\n\
        \Sekretarz: \"Czego tam?\"\n\n\
        \[Możesz spawdzić o czym możesz z nim porozmawiać - talk(sekretarz).]\n\
        \[Jeśli znasz już temat, zapytaj - ask(sekretarz, hej).]\n"
        },
    Place {
        pl_name = "okienko1",
        pl_description = "Asterix i Obelix idą korytarzem, zgodnie z instrukcjami sekretarza: w lewo, ostatnie drzwi na prawo.\n\
        \Problem w tym, że... po prawej stronie nie ma żadnych drzwi.\n\
        \Zamiast tego, po lewej - jedyne widoczne wejście, lekko uchylone, jakby samo zapraszało do środka.\n\
        \Wygląda na to, że sekretarz pomylił kierunki. Znowu.\n\n\
        \[Nowa lokacja odblokowana: \"dziwne_biuro\"]"
        },
    Place {
        pl_name="dziwne_biuro",
        pl_description = "Za drzwiami nie ma biurka ani okienka, jak można by się spodziewać.\n\
        \Zamiast tego - huśtawka. Na niej urzędnik w togach, obok dama w czerwonej tunice, zajęci rozmową.\n\
        \Gdy Asterix i Obelix wchodzą, oboje zamierają.\n\
        \Urzędnik (oburzony): \"KTO WAM POZWOLIŁ WEJŚĆ DO MEGO BIURA?!\""
        }
    ]


findByName :: String -> [Place] -> Maybe Place
findByName targetName = find (\p -> pl_name p == targetName)

