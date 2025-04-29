module State where

import Place
import Object

data State = State {
    i_am_at :: Place,
    holding :: [Object]
} deriving (Eq, Show)

initialState :: State
initialState = State {
    i_am_at = urzad,
    holding = []
}
