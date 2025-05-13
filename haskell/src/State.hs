module State where

import Place
import Item

import qualified Data.Map as Map

officeOpeningHours = 8 * 60 :: Int
officeClosingHours = 16 * 60 :: Int
minDuration = 25 :: Int
maxDuration = 80 :: Int

data State = State {
    i_am_at :: Place,
    holding :: [Item],
    itemsAt   :: Map.Map String [Item],
    message :: [[Char]],
    time    :: Int,
    officeClosed :: Bool,
    finished :: Bool
} deriving (Eq, Show)

initialState :: State
initialState = State {
    i_am_at =  head allPlaces,
    holding = [],
    itemsAt   = Map.fromList [
        ("urząd", [])
    ],
    message = [],
    time = officeOpeningHours,
    officeClosed = False,
    finished = False
}
