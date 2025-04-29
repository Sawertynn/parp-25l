module State where

import Place
import Item

data State = State {
    i_am_at :: Place,
    holding :: [Item],
    message :: [[Char]]
} deriving (Eq, Show)

initialState :: State
initialState = State {
    i_am_at = urzad,
    holding = [],
    message = []
}

readMessage :: State -> IO ()
readMessage state = do
    let msg = message state
    putStr (unlines msg)
