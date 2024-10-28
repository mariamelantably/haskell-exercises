insertIn :: Int -> [Int] -> Int -> [Int]
insertIn x xs pos = as ++ (x:bs)
    where (as,bs) = splitAt pos xs

perms :: [Int] -> [[Int]]
perms [] = [[]]
perms (x:xs) = [insertIn x y p | y <- perms xs, p <- [0..length(y)]]