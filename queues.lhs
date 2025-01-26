 empty :: Queue a
> empty = []

> isEmpty :: Eq a => Queue a -> Bool
> isEmpty x = x == empty

> add :: a -> Queue a -> Queue a
> add x xs = xs ++ [x] --this is the bad part, ++ is linear in time

> get :: Queue a -> (a, Queue a)
> get [] = error "Queue is empty - cant dequeue"
> get (x:xs) = (x, xs)

second type, with two lists

> data QueueR a =  Split [a] [a] deriving Eq 

> emptyR :: QueueR a 
> emptyR = Split [] []

> isEmptyR :: Eq a => QueueR a -> Bool
> isEmptyR q = q == emptyR

> addR :: a -> QueueR a -> QueueR a
> addR x (Split front back) = Split front (x:back) --constant in time

> reverse :: [a] -> [a]
> reverse = revcat []
>           where revcat ys [] = ys
>                 revcat ys (x:xs) = revcat (x:ys) xs --linear in the length of the list being reversed

> getR :: QueueR a -> (a, QueueR a)
> getR (Split [] []) = error "Queue is empty - cant dequeue"
> getR (Split [] back) = (x, Split xs [])
>     where (x:xs) = reverse back
> getR (Split (f:front) back) = (f, Split front back)
