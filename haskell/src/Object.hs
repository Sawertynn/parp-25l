module Object where

data Object = Object{
    obj_name :: String,
    obj_description :: String
    }
    deriving (Eq, Show)

niebieski_formularz = Object {
    obj_name = "niebieski_formularz",
    obj_description = "niebieski formularz, potrzebny do zaświadczenia a38"
}

fioletowy_formularz = Object {
    obj_name = "fioletowy_formularz",
    obj_description = "fioletowy formularz, potrzebny do zaświadczenia a38"
}

a38 = Object {
    obj_name = "a38",
    obj_description = "zaświadczenie A38, potrzebne do ukończenia zadania"
}