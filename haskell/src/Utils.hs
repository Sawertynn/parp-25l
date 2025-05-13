module Utils where

import Place
import State
import Item
import Dialogues

import System.Random
import Text.Printf
import Control.Monad (replicateM)
import Data.List (genericLength)


-- readMessage :: State -> IO ()
-- readMessage state = do
--     let msg = message state
--     putStr (unlines msg)
    
--     if not (officeClosed state)
--         then do
--             let (hour, minute) = divMod (time state) 60
--             printf "Jest godzina %d:%02d\n" hour minute
--         else return ()

-- useTime :: State -> Int -> State
-- useTime state duration = 
--     state { time = (time state) + duration}

-- useRandTime :: State -> IO State
-- useRandTime state = do
--     duration <- randomRIO (1, 120)
--     return state { time = (time state) + duration }

-- checkTime :: State -> State
-- checkTime state = 
--     if time state >= officeClosingHours
--         then if pl_name state /= "przed_urzędem"
--             then state { officeClosed = True,  i_am_at = last allPlaces, message = closingOfficeDialogue }
--             else descPlace state
--         else state

