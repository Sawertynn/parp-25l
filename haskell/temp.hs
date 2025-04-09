-- import Prelude hiding (any)

doubleIt x = x * 2

delta a b c = b ^ 2 - 4 * a * c

sign x
  | x > 0 = 1
  | x < 0 = -1
  | otherwise = 0

-- factorial n = if n == 0 then 1 else n * factorial (n - 1)

fact :: Integer -> Integer
fact 0 = 1
fact n = n * fact (n - 1)

nwd :: Integer -> Integer -> Integer
nwd a 0 = a
nwd a b = nwd b (mod a b)

triArea :: Floating a => a -> a -> a -> a
triArea a b c = sqrt (s * (s - a) * (s - b) * (s - c))
    where
        s = (a + b + c) / 2

perms :: Eq a => [a] -> [[a]]
perms [] = [[]]
perms xs = [x:p | x <- xs, p <- perms (remove x xs)]
    where
    remove x [] = []
    remove x (y:ys) | x == y = ys
        | otherwise = y : remove x ys


dany :: Eq a => (a -> Bool) -> [a] -> Bool
dany pred [] = False
dany pred collection
    | pred $ head collection = True
    | otherwise = dany pred $ tail collection


data Shape = Circle Float | Rect Float Float

square :: Float -> Shape
square a = Rect a a

area :: Shape -> Float
area (Circle r) = pi * r^2
area (Rect a b) = a * b

data Person = Person {name :: String, age :: Int}

i :: Maybe Int
i = Nothing

data Nat = Zero | Succ Nat

main :: IO ()
main = do
  let a = map doubleIt [1 .. 4]
  print a
  print (sum a)