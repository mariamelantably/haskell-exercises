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

> data BTree a = Leaf a | Fork (BTree a) (BTree a)
> data Direction = L | R deriving (Show)
> type Path = [Direction]

> foldBTree :: (a -> b) -> (b -> b -> b) -> BTree a -> b
> foldBTree leaf fork (Leaf x)   = leaf x
> foldBTree leaf fork (Fork l r) = fork (foldBTree leaf fork l) (foldBTree leaf fork r)

> find :: Eq a => a -> BTree a -> Maybe Path
> find x = foldBTree (\y -> if x == y then Just [] else Nothing) forkFunc

> forkFunc :: Maybe Path -> Maybe Path -> Maybe Path
> forkFunc Nothing Nothing = Nothing
> forkFunc Nothing (Just xs) = Just (R:xs)
> forkFunc (Just xs) _ = Just (L:xs)  
