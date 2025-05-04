module Item where

import Data.List (find)

data Item = Item {
    it_name :: String,
    it_description :: String
    }
    deriving (Eq, Show)

niebieski_formularz = Item {
    it_name = "niebieski_formularz",
    it_description = "formularz, potrzebny do zaświadczenia a38"
}

fioletowy_formularz = Item {
    it_name = "fioletowy_formularz",
    it_description = "formularz, potrzebny do zaświadczenia a38"
}

a38 = Item {
    it_name = "a38",
    it_description = "zaświadczenie, potrzebne do ukończenia zadania"
}

findItemByName :: String -> [Item] -> Maybe Item
findItemByName name = find (\item -> it_name item == name)