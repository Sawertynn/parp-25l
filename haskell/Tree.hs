module Tree where

data Tree a = Empty | Node a (Tree a) (Tree a)

depth :: Tree a -> Int
depth Empty = 0
depth (Node _ l r) = 1 + max (depth l) (depth r)

toStr :: Show a => Tree a -> String
toStr Empty = "_"
toStr (Node v l r) = (toStr l) ++ (show v) ++ (toStr r)

instance Show a => Show (Tree a) where
    show tree = go 0 tree
      where
        indent n = replicate (n * 4) ' '  -- 4 spaces per level
        go _ Empty = "Empty"
        go n (Node val left right) =
            indent n ++ "Node " ++ show val ++ "\n" ++
            go (n + 1) left ++ "\n" ++
            go (n + 1) right
