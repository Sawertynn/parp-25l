module State where

import Place
import Item

import qualified Data.Map as Map

data State = State {
    i_am_at :: Place,
    holding :: [Item],
    itemsAt   :: Map.Map String [Item],
    message :: [[Char]],
    officeClosed :: Bool
} deriving (Eq, Show)

initialState :: State
initialState = State {
    i_am_at =  head allPlaces,
    holding = [],
    itemsAt   = Map.fromList [
        ("urząd", [])
    ],
    message = [],
    officeClosed = False
}

readMessage :: State -> IO ()
readMessage state = do
    let msg = message state
    putStr (unlines msg)
