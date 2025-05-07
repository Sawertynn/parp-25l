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
            in state {
                holding = updatedHolding,
                itemsAt = updatedItemsAt,
                message = ["Upuściłeś " ++ itemName]
            }

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
