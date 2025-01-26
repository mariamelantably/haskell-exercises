> data Set a = Empty | Singleton a | Union (Set a) (Set a)

> foldSet :: (b -> b -> b) -> (a -> b) -> b -> Set a -> b
> foldSet union single empty Empty = empty
> foldSet union single empty (Singleton x) = single x
> foldSet union single empty (Union x y) = union (foldSet union single empty x) (foldSet union single empty y)

> isIn :: Eq a => a -> Set a -> Bool
> isIn x = foldSet (||) (x Prelude.==) False 

> subset :: Eq a => Set a -> Set a -> Bool
> subset x y = foldSet (&&) (`isIn` y) True x 

(==) :: Eq a => Set a -> Set a -> Bool
(==) x y = subset x y && subset y x
