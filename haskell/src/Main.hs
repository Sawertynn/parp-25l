module Main where

import Actions
import Help
import Dialogues
import Interactions
import Places



main :: IO ()
main = do
    print "Hello from main!"
    introduction
    instructions