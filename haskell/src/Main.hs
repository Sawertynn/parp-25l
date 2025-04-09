module Main where

import Actions
import Help
import Dialogues
import Interactions
import Places
import Utils


main :: IO ()
main = do
    printIntroduction
    printInstructions

    -- test Random module
    let fruits = ["apple", "orange", "plum", "banana", "kiwi", "pear"]
    sample <- randomSample fruits 3
    print sample
