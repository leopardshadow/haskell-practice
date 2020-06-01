{-# LANGUAGE ParallelListComp #-}
{-# OPTIONS_GHC -Wall #-}


fib :: [Integer]
fib = 1 : 1 : [ x + y 
    | x <- fib
    | y <- tail fib ]


fibs :: [Int]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)



test :: [Integer]
test = [ x + y 
    | x <- lst
    | y <- tail lst ]
    where lst = [1, 1, 2,  3, 5]


parallelListComp :: [Integer]
parallelListComp = [ 100 * x + 10 * y + z
                   | x <- [0..9]
                   | y <- [0..9]
                   | z <- [0..9]
                   ]

-- zipWith3 (\(x, y, z) -> x + y * z) [0..10] [10..20] [20..30]



regularListComp :: [Integer]
regularListComp = [ 100 * x + 10 * y + z
                   | x <- [0..9]
                   , y <- [0..9]
                   , z <- [0..9]
                   ]



test2 :: [Integer]
test2 = [ 10 * x + y 
         | x <- [1..3]
         | y <- [1..5]
        ]

test3 :: [Integer]
test3 = [ 10 * x + y 
         | x <- [1..5]
         | y <- [1..3]
        ]


{-
1 : 1 : [ x + y | x <- fib  | y <- tail fib ]

1 : 1 : [  ]




-}