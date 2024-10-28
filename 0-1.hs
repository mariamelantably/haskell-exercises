myMax :: Int -> Int -> Int 
myMax a b
    | a > b     = a
    | otherwise = b

myMaximum :: [Int] -> Int
myMaximum (x:xs)
    | length xs == 0 = x
    | otherwise = myMax x (myMaximum xs)
