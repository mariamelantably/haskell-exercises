-- factorial :: Int -> Int
-- factorial 0 = 1
-- factorial n = n * factorial (n - 1)

factorial :: Int -> Int
factorial n = foldl (\x acc -> x * acc) 1 [1..n]
