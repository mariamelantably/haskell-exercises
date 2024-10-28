fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib(n-2)

fib_h :: Int -> Int -> Int -> Int
fib_h x y 1 = x
fib_h x y n = fib_h y (x+y) (n-1)

fib2 :: Int -> Int
fib2 n = fib_h 0 1 n 






