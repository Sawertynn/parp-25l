module State where

import Place
import Item

import qualified Data.Map as Map

officeOpeningHours = 8 * 60
officeClosingHours = 16 * 60

data State = State {
    i_am_at :: Place,
    holding :: [Item],
    itemsAt   :: Map.Map String [Item],
    message :: [[Char]],
    time    :: Int,
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
    time = officeOpeningHours,
    officeClosed = False
}

readMessage :: State -> IO ()
readMessage state = do
    let msg = message state
    putStr (unlines msg)
    putStr "Jest około godziny "
    let textTime = show (time state)
    putStr textTime

useTime :: State -> Int -> State
useTime state duration = 
    let newTime = (time state) + duration
    in if newTime >= officeClosingHours
        then state { time = newTime, officeClosed = True, i_am_at = last allPlaces, message = ["Minęła 16, urząd zamkniętu, wyrzucono was z budynku"] }
        else state { time = newTime, message = (message state) ++ ["Jest godzina: " ++ show (newTime)] }