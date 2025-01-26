> data Tree a = Empty | Fork (Tree a) a (Tree a) 

> insert :: Ord a => a -> Tree [a] -> Tree [a]
> insert x Empty = Fork Empty [x] Empty
> insert x tree | x < a = Fork (insert x left) [a] right
>               | x >= a = Fork left [a] (insert x right)
>   where Fork left [a] right = tree


if smaller go left, if larger go right. to insert check if tree is empty. if it is then we add it else we make a recursive call in the direction we needProgram

> flatten :: Tree [a] -> [a]
> flatten Empty = []
> flatten (Fork left [a] right) = flatten left ++ [a] ++ flatten right
