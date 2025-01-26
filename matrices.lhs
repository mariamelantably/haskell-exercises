> type Matrix a = [[a]]

> rjustify :: Int -> String -> String
> rjustify x string = replicate (x-l) ' ' ++ string
>   where l = length string

> ljustify :: Int -> String -> String
> ljustify x string = string ++ replicate (x-l) ' '
>   where l = length string

> scale :: Num a => a  -> Matrix a -> Matrix a
> scale x = map (map (x*))

> dot :: Num a => [a] -> [a] -> a
> dot xs ys = sum(zipWith (*) xs ys)

> add :: Num a => Matrix a -> Matrix a -> Matrix a
> add = (zipWith . zipWith) (+)

> mul :: Num a => Matrix a -> Matrix a -> Matrix a
> mul xs ys =  map (\x -> [dot x y | y <- cols' ys]) xs

> table :: Show a => Matrix a -> String
> table xs = unlines (map (unwords.map (uncurry rjustify)) pairs)
>       where lengths =  map (map (length . show)) (cols' xs)
>             justifyLengths = cols' (map (\ xs -> map (const (maximum xs)) xs) lengths)
>             pairs = zipWith zip justifyLengths ((map.map) show xs)
