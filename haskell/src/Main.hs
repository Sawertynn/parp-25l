module Main where

import Actions
import Utils
import State
import ItemsActions

import System.IO ( hFlush, stdout )

readCommand :: IO String
readCommand = do
    putStr "> "
    hFlush stdout
    getLine


gameLoop :: State -> IO ()
gameLoop state = do
    readMessage state
    putStrLn ""
    cmd <- readCommand
    putStrLn ""
    case words (cmd) of
      ["instructions"] -> do
        goToNextState (printInstructions state)

      ["start"] -> do
        goToNextState (printIntroduction state)

      ["look"] -> do
        goToNextState (look state)

      ["go", place] -> do
        newState <- useRandTime (goPlace state place)
        goToNextState newState

      ["drop", itemName] -> do
        goToNextState (dropItem state itemName)

      ["take", itemName] -> do
        goToNextState (takeItem state itemName)

      ["talk", personName] -> do
        goToNextState (talkPerson state personName)

      ["ask", personName, topicName] -> do
        goToNextState (askPerson state personName topicName)

      ["shout", personName, topicName] -> do
        goToNextState (shoutPerson state personName topicName)

      ["wait"] -> do
        newState <- waitTime state
        goToNextState newState

      ["quit"] -> do
        putStrLn "Koniec gry, do zobaczenia!"

      _ -> do
        goToNextState state { message = ["Nieznane polecenie"] }

goToNextState :: State -> IO()
goToNextState state = 
  if finished state
    then do
      readMessage state 
      putStrLn "Koniec gry, do zobaczenia!"
    else gameLoop (checkTime state)

main :: IO ()
main = do
    gameLoop (printInstructions initialState)
