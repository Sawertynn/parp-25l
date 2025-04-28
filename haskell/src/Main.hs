module Main where

import Actions
import Help
import Dialogues
import Interactions
import Place
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
    putStrLn ""
    cmd <- readCommand
    putStrLn ""
    case words (cmd) of
      ["instructions"] -> do
        printInstructions
        gameLoop state

      ["introduction"] -> do
        printIntroduction
        gameLoop state

      -- ["drop", object] -> do
      --   let newState = dropItem state object
      --   printDrop state object
      --   gameLoop newState

      -- ["take", object] -> do
      --   let newState = takeItem state object
      --   printTake state newState object
      --   gameLoop newState

      ["look"] -> do
        descLocation state
        gameLoop state

      ["go", location] -> do
        let result = goToPlace state location
        case result of
          Ok newState -> do
            descLocation newState
            gameLoop newState
          AlreadyThere st -> do
            putStrLn "Już tu jesteś"
            gameLoop st
          PlaceNotFound st -> do
            putStrLn "Nie ma takiego miejsca"
            gameLoop st

      ["quit"] -> do
        putStrLn "Do zobaczenia!"

      _ -> do
        print "Nieznane polecenie.\n"
        gameLoop state


main :: IO ()
main = do
    printIntroduction
    printInstructions

    gameLoop initialState
