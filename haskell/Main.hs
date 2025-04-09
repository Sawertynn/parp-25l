module Main where

import System.Random
import Tree
import Prelude

a = Node 1 Empty Empty
b = Node 2 Empty Empty
c = Node 3 a b



main :: IO ()
main = do
    num <- randomIO :: IO Float
    print num