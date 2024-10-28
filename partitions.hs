helper :: [a] -> [a] -> [([a],[a])]
helper temp [] = [(temp, [])]
helper temp (x:xs) = [(temp, (x:xs))] ++ helper (temp ++ [x]) (xs)

partitions :: [a] -> [([a],[a])] 
partitions = helper [] 
  
