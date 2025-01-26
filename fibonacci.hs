-- first implementation - exponential time
fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib(n-2)

-- second implementation
fib_h :: Int -> Int -> Int -> Int
fib_h x y 1 = x
fib_h x y n = fib_h y (x+y) (n-1)

--fibonacci by matrix multiplication
> type Matrix a = [[a]]

> dot :: Num a => [a] -> [a] -> a
> dot xs ys = sum(zipWith (*) xs ys)

> cols' :: [[a]] -> [[a]]
> cols' [] = [] 
> cols' (xs:xss) = if null as then zipWith (:) xs (replicate (length xs) []) else zipWith (:) xs as
>   where as = cols' xss

> mul :: Num a => Matrix a -> Matrix a -> Matrix a
> mul xs ys =  map (\x -> [dot x y | y <- cols' ys]) xs

> matrix1 :: Matrix Integer
> matrix1 = [[0,1],[1,1]]

> power :: (a -> a -> a) -> a -> a -> Integer -> a
> power (*) y x n -- x^n*y
>          | n==0   = y
>          | even n = power (*) y (x*x) (n `div` 2)
>          | odd n  = power (*) (x*y) x (n-1)


> powF :: Num a =>  Matrix a -> Integer -> Matrix a
> powF = power mul [[1,0], [0,1]] 

> fib1 :: Integer -> Integer
> fib1 n = y
>     where ([x,y]:xs) = powF [[0,1],[1,1]] 



