module Utils where

import System.Random
import Control.Monad (replicateM)
import Data.List (genericLength)

-- Randomly pick n elements from a list (with replacement)
randomSample :: [a] -> Int -> IO [a]
randomSample [] _ = return []
randomSample xs n = do
    let len = length xs
    indices <- replicateM n $ randomRIO (0, len - 1)
    return [xs !! i | i <- indices]


fromJust :: Maybe a -> a
fromJust (Just a) = a
fromJust Nothing = error "Oops, you goofed up, fool."

