> nums :: [String]
> nums = ["Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]

> song :: Int -> String
> song 1 = verse 1
> song n = song(n-1)++"\n"++verse n

> line :: String
> line = "Went to mow a meadow \n"

> line1 :: Int -> String
> line1 1 = "One man went to mow \n"
> line1 n = number ++ " men went to mow \n"
>   where number = (!!) nums (n-2)

> line3 :: Int -> String
> line3 1 = "One man and his dog\n"
> line3 n = number ++ " men, " ++ line3 (n-1)
>   where number = (!!) nums (n-2)

> verse :: Int -> String
> verse n = line1 n ++ line ++ line3 n ++ line 
   
