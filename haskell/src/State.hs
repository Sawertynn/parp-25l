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
    i_am_at =  head allPlaces,
    holding = [fioletowy_formularz, niebieski_formularz],
    itemsAt   = Map.fromList [
        ("urząd", [])
    ],
    message = []
}

readMessage :: State -> IO ()
readMessage state = do
    let msg = message state
    putStr (unlines msg)
