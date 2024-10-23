Practical 1: Factoring Numbers

Here is a simple method for finding the smallest prime factor of a positive
integer:

> factor :: Integer -> (Integer, Integer)
> factor n = factorFrom 2 n

> factorFrom :: Integer -> Integer -> (Integer, Integer)
> factorFrom m n | r == 0    = (m,q)
>                | otherwise = factorFrom (m+1) n
>    where (q,r) = n `divMod` m

for example

*Main> factor 7654321
(19,402859)

because 
tors.lhs
*Main> 19 * 402859
7654321

Repeatedly extracting the smallest factor will return a list
of prime factors:

> factors :: Integer -> [Integer]
> factors n = factorsFrom 2 n

> factorsFrom :: Integer -> Integer -> [Integer]
> factorsFrom m n | n == 1    = []
>                 | otherwise = p:factorsFrom p q
>    where (p,q) = factorFrom m n

for example

*Main> factor 123456789
(3,41152263)
*Main> factors 123456789
[3,3,3607,3803]

My Solutions:
Exercise 1: 
factor 0 = (2,0)	
factor 1 = with factor 1, you continuously get a remainder of 1, causing the value for m to be incremented infinitely, so the program never terminates.

Exercise 2:
When I entered factor 0, I received the result (2,0), matching the one I predicted. 
When I entered factor 1, I did not receive any result, indicating that the program never terminated, which is consistent with the value I predicted.

Exercise 3:
Factors come in pairs, so let this pair be (a, b), where a < b. Assume a is bigger than sqrt(n) and less than n, so sqrt(n) < a < n. We know that a x b = n (as they are a factor pair), so this assumption means that 1 < b < sqrt(n), meaning b should be smaller than a. This contradicts our initial statement saying that a < b, and by contradiction we know that the smallest factor of n (a) can't be both bigger than sqrt(n) and less than n. 

> factor1 :: Integer -> (Integer, Integer)
> factor1 n = factorFrom1 2 n

> factorFrom1 :: Integer -> Integer -> (Integer, Integer)
> factorFrom1 m n | r == 0    = (m,q)
> 		  | n <= m*m  = (n,1)
>                 | otherwise = factorFrom1 (m+1) n
>    where (q,r) = n `divMod` m

The order of the guarded equation does matter, as this checks for two different situations:
- the number is prime
- the number is a square of a prime (e.g. 4, 9)
The first line of the guarded equation checks for the second case, as these will have r == 0, so will return the square root. If the two lines are switched around, then the squares will return (n,1), which is an incorrect value. 

In the worst case, the number will iterate until the n <= m*m condition is reached (i.e. the worst case is applied to prime numbers). This means that the worst case scenario will be the largest integer smaller than the number's square root, i.e. [sqrt(n)].

Exercise 4:  
This condition checks that the quotient produced is less than the divisor, and as (m,q) is the ordered pair for the factors and m should be smaller than or equal to q, this indicates that all pairs have been chosen and thus shows the number is prime, which is essentially the same check as n <= m * m. This is more efficient, however, as the computer must spend time computing m * m (multiplication is like executing a function), then it must carry out the comparison, whereas with m > q, it simply carries out the comparison, reducing the time complexity of the algorithm. 


> factor2 :: Integer -> (Integer, Integer)
> factor2 n = factorFrom2 2 n

> factorFrom2 :: Integer -> Integer -> (Integer, Integer)
> factorFrom2 m n | r == 0    = (m,q)
> 		  | q < m  = (n,1)
>                 | otherwise = factorFrom2 (m+1) n
>    where (q,r) = n `divMod` m

Exercise 5: 

> factor3 :: Integer -> (Integer, Integer)
> factor3 n = factorFrom3 2 n

> factorFrom3 :: Integer -> Integer -> (Integer, Integer)
> factorFrom3 m n | r == 0 = (m,q)
>		  | q < m  = (n,1)
>       	  | m == 2 = factorFrom3 3 n
> 		  | otherwise = factorFrom3 (m+2) n
>    where (q,r) = n `divMod` m

Exercise 6: 
Test 1 - One:
ghci> factor3 1
(1,1)
(0.00 secs, 64,744 bytes)

Test 2 - Primes:
ghci> factor3 2
(2,1)
(0.00 secs, 64,696 bytes)
ghci> factor3 3
(3,1)
(0.00 secs, 64,752 bytes)
ghci> factor3 5
(5,1)
(0.00 secs, 65,144 bytes)
ghci> factor3 7
(7,1)
(0.00 secs, 65,152 bytes)
ghci> factor3 83
(83,1)
(0.00 secs, 67,768 bytes)

Test 3 - Square Numbers:
ghci> factor3 2
(2,1)
(0.00 secs, 64,696 bytes)
ghci> factor3 3
(3,1)
(0.00 secs, 64,752 bytes)
ghci> factor3 5
(5,1)
(0.00 secs, 65,144 bytes)
ghci> factor3 7
(7,1)
(0.00 secs, 65,152 bytes)
ghci> factor3 83
(83,1)
(0.00 secs, 67,768 bytes)

Test 4 - Non-prime and Non-square Numvbers:
ghci> factor3 2
(2,1)
(0.00 secs, 64,696 bytes)
ghci> factor3 3
(3,1)
(0.00 secs, 64,752 bytes)
ghci> factor3 5
(5,1)
(0.00 secs, 65,144 bytes)
ghci> factor3 7
(7,1)
(0.00 secs, 65,152 bytes)
ghci> factor3 83
(83,1)
(0.00 secs, 67,768 bytes)

Exercise 7:

> factor4 :: Integer -> (Integer, Integer)
> factor4 n = factorFrom4 2 n 2

> factorFrom4 :: Integer -> Integer -> Integer -> (Integer, Integer)
> factorFrom4 m n s | r == 0    = (m,q)
> 		    | q < m  = (n,1)
> 		    | m == 2 = factorFrom4 3 n s
>           | m == 3 = factorFrom4 5 n s
> 		    | otherwise = factorFrom4 (m + s) n (6 - s)
>    where (q,r) = n `divMod` m

Here are some tests I carried out on Exercise 7:
ghci> factor4 1
(1,1)
(0.01 secs, 65,000 bytes)
ghci> factor4 2
(2,1)
(0.01 secs, 64,712 bytes)
ghci> factor4 3
(3,1)
(0.01 secs, 64,760 bytes)
ghci> factor4 8
(2,4)
(0.01 secs, 64,712 bytes)
ghci> factor4 4
(2,2)
(0.00 secs, 64,712 bytes)
ghci> factor4 5
(5,1)
(0.00 secs, 65,176 bytes)
ghci> factor4 7
(7,1)
(0.00 secs, 65,168 bytes)
ghci> factor4 17
(17,1)
(0.00 secs, 66,440 bytes)

Exercise 8:
This extension, when implemented, requires having a separate check for prime numbers, as they do not go up in a very predictable pattern. This would require extra memory as well as extra run-time, which would in-turn make the function more inefficient. This is particularly true for larger numbers. 

Exercise 9: 
Here are some examples I tried this on:
ghci> factors 2
[2]
(0.00 secs, 63,672 bytes)
ghci> factors 17
[17]
(0.01 secs, 69,840 bytes)
ghci> factors 120
[2,2,2,3,5]
(0.01 secs, 73,528 bytes)
ghci> factors 85
[5,17]
(0.01 secs, 72,024 bytes)
ghci> factors 99
[3,3,11]
(0.01 secs, 72,064 bytes)
ghci> factors 1230
[2,3,5,41]
(0.00 secs, 85,048 bytes)
ghci> factors 121
[11,11]
(0.00 secs, 70,632 bytes)

> factors2 :: Integer -> [Integer]
> factors2 n = factorsFrom2 2 n 2

> factorsFrom2 :: Integer -> Integer -> Integer -> [Integer]
> factorsFrom2 m n s | n == 1 = []
>                    | otherwise = p : factorsFrom2 2 q s
>    where (p,q) = factorFrom4 m n s

I checked the following cases individually in my terminal:
ghci> factors2 2
[2]
(0.01 secs, 64,008 bytes)
ghci> factors 2
[2]
(0.00 secs, 63,680 bytes)
ghci> factors2 120
[2,2,2,3,5]
(0.01 secs, 73,256 bytes)
ghci> factors 120
[2,2,2,3,5]
(0.00 secs, 73,520 bytes)
ghci> factors2 30
[2,3,5]
(0.01 secs, 68,744 bytes)
ghci> factors 30
[2,3,5]
(0.01 secs, 69,144 bytes)

I then checked all cases from 2 to 1000 using map, which gave me the following result:
ghci> map factors [2..1000] == map factors2 [2..1000]
True
(0.08 secs, 55,634,176 bytes)

Exercise 10:
ghci> factors 2
[2]
(0.01 secs, 68,504 bytes)
ghci> factors2 2
[2]
(0.00 secs, 68,560 bytes)
ghci> factors 890
[2,5,89]
(0.01 secs, 104,968 bytes)
ghci> factors2 890
[2,5,89]
(0.01 secs, 76,720 bytes)
ghci> factors 300
[2,2,3,5,5]
(0.00 secs, 78,352 bytes)
ghci> factors2 300
[2,2,3,5,5]
(0.00 secs, 79,200 bytes)
hci> factors 1200
[2,2,2,2,3,5,5]
(0.01 secs, 82,736 bytes)
ghci> factors2 1200
[2,2,2,2,3,5,5]
(0.00 secs, 83,648 bytes)

To find the factors of Jevon's Number ->
ghci> factors 8616460799
[89681,96079]
(0.06 secs, 34,659,672 bytes)
ghci> factors2 8616460799
[89681,96079]
(0.04 secs, 17,830,216 bytes)

Conclusion: When applied to small numbers, there is not a substantial difference between factors and factors2 in terms of speed and memory efficiency. However, as numbers get larger, factors2 is substantially faster and more memory efficient (as illustrated using the example with Jevon's number).
 
Exercise 11:
If r < 0, this means p^2 - q^2 is less than n, so we need to increment p. If r > 0, then this means p^2 - q^2 is bigger than p, so q needs to be incremented, to get closer to zero.
This method is guaranteed to terminate for odd numbers as every odd number can be written as a difference between two perfect squares (this is because the difference between consecutive squares is an odd number), so we must get r = 0 with every odd number eventually (which is not the case for even numbers as they can not necessarily be written as the difference between two square numbers). 

I wrote the following search function based on this information -> 

> search :: Integer -> Integer -> Integer -> (Integer, Integer)
> search p q n | r == 0    = (p,q)
>              | r < 0     = search (p+1) q n
>              | otherwise = search p (q+1) n
>       where r = p^2 - q^2 - n

Exercise 12: 
The smallest possible value of x is the square root of n (if this is not an integer, we take the floor of the square root of n), as if x is smaller than the square root of n, then x^2 would be smaller than n, so to get to n we would need y^2 to be negative which is impossible, thus we would need to increment the value of x until the square root of n regardless, which I found by isqrt n. I used a starting y value of 0 which is important as otherwise the odd square numbers would not return a correct pair. 

> isqrt :: Integer -> Integer
> isqrt = truncate . sqrt . fromInteger

> fermat :: Integer -> (Integer, Integer)
> fermat n = (p+q , p-q)
>       where (p,q) = search (isqrt n) 0 n

I tested the function as such -> 

Exercise 13:
ghci> fermat 8616460799
(96079,89681)
(0.01 secs, 6,197,120 bytes)

ghci> fermat 1963272347809
(8123471,241679)
(8.55 secs, 12,638,009,632 bytes)

Exercise 14:
To implement this function, I had to use algebra to find out how to edit the r correctly to account for p or q increasing. I did this by finding an expression for (p+1)^2 - q^2 - n and p^2 - q^2 - n and finding how those differed from the first r expression (for the first, this is by adding 2p + 1, and for the second this is by subtracting (2q + 1)).

> search2 :: Integer -> Integer -> Integer -> Integer -> (Integer, Integer)
> search2 p q n r | r == 0    = (p,q)
>                 | r < 0     = search2 (p+1) q n (r + 2*p + 1)
>                 | otherwise = search2 p (q+1) n (r - 2*q - 1)

> fermat2 :: Integer -> (Integer, Integer)
> fermat2 n = (p+q , p-q)
>       where (p,q) = search2 (isqrt n) 0 n (isqrt n ^2 - 0^2 - n)

I tested the new fermat function as such ->

Exercise 15:

> isqrt2 :: Integer -> Integer -> Integer
> isqrt2 k n |(k+1)^2 > n && k^2 >= n = k
> 	     | otherwise              = isqrt2 (k+1) n 

Exercise 16:

> split :: (Integer, Integer) -> Integer -> (Integer, Integer)
> split (l,r) n | m^2 <= n = (m,r)
>	        | otherwise = (l,m)
>	where m = (l+r)`div`2

Exercise 17: 

> binarySearch :: Integer -> (Integer, Integer) -> Integer
> binarySearch n (l,r) | l + 1 == r = l
> 	               | otherwise  = binarySearch n (split (l,r) n)

> isqrt3 :: Integer -> Integer
> isqrt3 n = binarySearch n (1,n)


Exercise 18: 

> findUpper :: Integer -> Integer -> Integer
> findUpper b n | b <= n && (b*2) > n = b 
> 		| otherwise = findUpper (b*2) n 

> isqrt4 :: Integer -> Integer
> isqrt4 n = binarySearch n (1,b)
>	where b = findUpper 1 n


