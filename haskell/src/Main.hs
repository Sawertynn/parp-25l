module Main where

import Actions
import Utils
import State


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
        gameLoop (printInstructions state)

      ["start"] -> do
        gameLoop (printIntroduction state)

      ["look"] -> do
        gameLoop (look state)

      ["go", place] -> do
        gameLoop (goPlace state place)

      ["go"] -> do
        gameLoop (printInstructions state)

      ["drop", itemName] -> do
        gameLoop (dropItem state itemName)

      ["take", itemName] -> do
        gameLoop (takeItem state itemName)

      ["talk", personName] -> do
        gameLoop (talkPerson state personName)

      ["ask", personName, topicName] -> do
        gameLoop (askPerson state personName topicName)

      ["shout", personName, topicName] -> do
        gameLoop (shoutPerson state personName topicName)

      ["wait"] -> do
        gameLoop (wait state)

      ["quit"] -> do
        putStrLn "Do zobaczenia!"

      _ -> do
        -- putStrLn "Nieznane polecenie."
        gameLoop state { message = ["Nieznane polecenie"] }


main :: IO ()
main = do
    gameLoop (printInstructions initialState)
