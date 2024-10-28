# True, False are expressions of type bool

funct1 :: Bool -> (Bool -> Bool)
funct1 x = (\x -> x || True)

funct2 :: (Bool -> Bool) -> Bool
funct2 fn = (fn True) && False

#Bool -> Bool, can be true returning true, false returning true, true returning false, or false returning false. so essentially 4 different functions

