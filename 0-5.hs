inits :: [[a]] -> [a]
inits = foldr (\x acc -> head x: acc) [] 