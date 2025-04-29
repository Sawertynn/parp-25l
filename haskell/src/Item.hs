module Item where

data Item = Item {
    it_name :: String,
    it_description :: String
    }
    deriving (Eq, Show)

niebieski_formularz = Item {
    it_name = "niebieski_formularz",
    it_description = "niebieski formularz, potrzebny do zaświadczenia a38"
}

fioletowy_formularz = Item {
    it_name = "fioletowy_formularz",
    it_description = "fioletowy formularz, potrzebny do zaświadczenia a38"
}

a38 = Item {
    it_name = "a38",
    it_description = "zaświadczenie A38, potrzebne do ukończenia zadania"
}