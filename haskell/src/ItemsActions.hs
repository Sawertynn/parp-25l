module ItemsActions where

import State
import Place
import Item

import qualified Data.Map as Map
import Data.List (find)


dropItem :: State -> String -> State
dropItem state itemName =
    case findItemByName itemName (holding state) of
        Nothing -> state { message = ["Nie masz takiego przedmiotu"] }
        Just item ->
            let placeName = pl_name (i_am_at state)
                updatedHolding = filter (\i -> it_name i /= itemName) (holding state)
                updatedItemsAt = Map.insertWith (++) placeName [item] (itemsAt state)
                finalState = state {
                    holding = updatedHolding,
                    itemsAt = updatedItemsAt
                }
            in if itemName == "a38" && placeName == "gabinet_kwestora"
                then finalState {
                    message = [
                        "Asterix kładzie dokument A38 na biurku przed kwestorem.",
                        "Kwestor bierze formularz, przygląda się mu uważnie, po czym kiwa z uznaniem głową.",
                        "Kwestor: Imponujące. Niewielu przeszło tę ścieżkę bez rozlewu krwi. Gratulacje, Galowie.",
                        "Kwestor: Gotowi na kolejne zadanie?",
                        "Asterix: Jeśli nie wymaga odwiedzin w żadnym urzędzie... to chyba tak.",
                        "Obelix: Zdecydowanie tak.",
                        "[Zaświadczenie A38 dostarczone. Jedna z prób zakończona]"
                    ],
                    finished = True
                }
                else finalState { message = ["Upuściłeś " ++ itemName]}

takeItem :: State -> String -> State
takeItem state itemName =
    let placeName = pl_name (i_am_at state)
        itemsHere = Map.findWithDefault [] placeName (itemsAt state)
    in case findItemByName itemName itemsHere of
        Nothing -> state { message = ["Nie ma tu takiego przedmiotu"] }
        Just item ->
            let updatedItemsHere = filter (\i -> it_name i /= itemName) itemsHere
                updatedItemsAt = Map.insert placeName updatedItemsHere (itemsAt state)
                updatedHolding = item : holding state
            in state {
                holding = updatedHolding,
                itemsAt = updatedItemsAt,
                message = ["Podniosłeś " ++ itemName]
            }

putItemHere :: Item -> State -> State
putItemHere item state =
    let place = pl_name (i_am_at state)
        updatedItems = Map.insertWith (++) place [item] (itemsAt state)
    in state { itemsAt = updatedItems }
