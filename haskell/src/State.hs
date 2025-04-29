module State where

import Place
import Item

data State = State {
    i_am_at :: Place,
    holding :: [Item]
} deriving (Eq, Show)

initialState :: State
initialState = State {
    i_am_at = urzad,
    holding = []
}
