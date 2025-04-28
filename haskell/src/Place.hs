module Place where

import Data.List (find)

data Place = Place{
    pl_name :: String,
    pl_description :: String
    }
    deriving (Eq, Show)

urzad = Place {
    pl_name = "urząd",
    pl_description = "Urząd rzymski"
}

korytarz = Place {
    pl_name = "korytarz",
    pl_description = "korytarz główny"
}

allPlaces :: [Place]
allPlaces = [urzad, korytarz]

findByName :: String -> [Place] -> Maybe Place
findByName targetName = find (\p -> pl_name p == targetName)

