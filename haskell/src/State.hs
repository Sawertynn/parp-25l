module State where

import Place
import Item

import qualified Data.Map as Map

data State = State {
    i_am_at :: Place,
    holding :: [Item],
    itemsAt   :: Map.Map String [Item],
    message :: [[Char]]
} deriving (Eq, Show)

initialState :: State
initialState = State {
    i_am_at = urzad,
    holding = [],
    itemsAt   = Map.fromList [
        ("urząd", [niebieski_formularz, fioletowy_formularz])
    ],
    message = []
}

readMessage :: State -> IO ()
readMessage state = do
    let msg = message state
    putStr (unlines msg)
