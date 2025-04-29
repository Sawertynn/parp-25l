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

data MoveResult
    = Ok State                -- Successfully moved, with new State
    | AlreadyThere State      -- Player is already at the location
    | PlaceNotFound State     -- No such place exists
    deriving (Show)
