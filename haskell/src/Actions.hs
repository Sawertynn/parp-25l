module Actions where

import Place
import State

import Data.List (find)

-- Places
descPlace :: Place -> IO()
descPlace place = do
    putStrLn (pl_description place)

descLocation :: State -> IO()
descLocation state = do
    descPlace (i_am_at state)

goToPlace :: State -> String -> MoveResult
goToPlace state placeName = 
    case findByName placeName allPlaces of
        Just place -> 
            if i_am_at state == place
                then AlreadyThere state
                else Ok (state { i_am_at = place })
        Nothing -> PlaceNotFound state


