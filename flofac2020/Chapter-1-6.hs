-- This exercise covers the first 6 chapters of "Learn You a Haskell for Great Good!"

-- Chapter 1 - http://learnyouahaskell.com/introduction
-- Chapter 2 - http://learnyouahaskell.com/starting-out
-- Chapter 3 - http://learnyouahaskell.com/types-and-typeclasses
-- Chapter 4 - http://learnyouahaskell.com/syntax-in-functions
-- Chapter 5 - http://learnyouahaskell.com/recursion
-- Chapter 6 - http://learnyouahaskell.com/higher-order-functions

-- Download this file and then type ":l Chapter-1-6.hs" in GHCi to load this exercise
-- Some of the definitions are left "undefined", you should replace them with your answers.

-- Find the penultimate (second-to-last) element in list xs
penultimate xs = last (init xs)

-- Find the antepenultimate (third-to-last) element in list xs
antepenultimate = last . init . init

-- Left shift list xs by 1
-- For example, "shiftLeft [1, 2, 3]" should return "[2, 3, 1]"
shiftLeft (x:xs) = xs ++ [x]

testShiftLeft :: Bool
testShiftLeft = and
    [
        shiftLeft [1, 2, 3] == [2, 3, 1]
    ]

-- Left shift list xs by n
-- For example, "rotateLeft 2 [1, 2, 3]" should return "[3, 1, 2]"
rotateLeft 0 xs = xs
rotateLeft n xs = rotateLeft (n-1) (shiftLeft xs)

testRotateLeft :: Bool
testRotateLeft = and
    [
        rotateLeft 2 [1, 2, 3] == [3, 1, 2]
    ]

-- Insert element x in list xs at index k
-- For example, "insertElem 100 3 [0,0,0,0,0]" should return [0,0,0,100,0,0]
insertElem x k xs = let (p1, p2) = splitAt k xs in p1 ++ [x] ++ p2

testInsertElem :: Bool
testInsertElem = and
    [
        insertElem 100 3 [0,0,0,0,0] == [0,0,0,100,0,0]
    ]

-- Here we have a type for the 7 days of the week
-- Try typeclass functions like "show" or "maxBound" on them
data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun
         deriving (Eq, Ord, Show, Bounded, Enum)   

-- Note that if you try "succ Sun", you should get an error, because "succ" is not defined on "Sun"
-- Define "next", which is like "succ", but returns "Mon" on "next Sun"
next :: Day -> Day
next Sun = Mon
next d = succ d 


testIsNext = and
    [
        next Mon == Tue,
        next Tue == Wed,
        next Sat == Sun,
        next Sun == Mon
    ] 


-- Return "True" on weekend
isWeekend :: Day -> Bool
isWeekend d = d == Sat || d == Sun

testIsWeekend :: Bool
testIsWeekend = and
    [
        isWeekend Mon == False,
        isWeekend Tue == False,
        isWeekend Sat == True,
        isWeekend Sun == True
    ] 

data Task = Work | Shop | Play deriving (Eq, Show)

-- You are given a schedule, which is a list of pairs of Tasks and Days
schedule :: [(Task, Day)]
schedule = [(Shop, Fri), (Work, Tue), (Play, Mon), (Play, Fri)]

-- However, the schedule is a mess
-- Sort the schedule by Day, and return only a list of Tasks. 
-- If there are many Tasks in a Day, you should keep its original ordering
-- For example, "sortTask schedule" should return "[(Play, Mon), (Work, Tue), (Shop, Fri), (Play, Fri)]"
sortTask :: [(Task, Day)] -> [Task]
sortTask = undefined

-- testSortTask :: Bool
-- testSortTask = and
--     [
--         sortTask schedule == [(Play, Mon), (Work, Tue), (Shop, Fri), (Play, Fri)]
--     ]

-- This function converts days to names, like "show", but a bit fancier
-- For example, "nameOfDay Mon" should return "Monday"
nameOfDay :: Day -> String
nameOfDay x = case x of Tue -> "Tuesday"
                        Wed -> "Wednesday"
                        Thu -> "Thursday"
                        Sat -> "Saturday"
                        _ -> (show x) ++ "day"

testNameOfDay :: Bool
testNameOfDay = and
    [
        nameOfDay Mon == "Monday",
        nameOfDay Tue == "Tuesday"
    ]


-- You shouldn't be working on the weekends
-- Return "False" if the Task is "Work" and the Day is "Sat" or "Sun"
labourCheck :: Task -> Day -> Bool
labourCheck task day = task == Work && (isWeekend day)

-- Raise x to the power y using recursion
-- For example, "power 3 4" should return "81"
power :: Int -> Int -> Int
power _ 0 = 1
power x y = x * power x (y-1)

testPower = and
    [
        power 3 4 == 81
    ]

-- Convert a list of booleans (big-endian) to a interger using recursion
-- For example, "convertBinaryDigit [True, False, False]"
convertBinaryDigit :: [Bool] -> Int
convertBinaryDigit = undefined
-- convertBinaryDigit (Ture : bits) =
-- convertBinaryDigit (False : bits) =


testConvertBinaryDigit = and
    [
        convertBinaryDigit [True, False, False] == 5,
        convertBinaryDigit [False, True, False, False] == 5,
        convertBinaryDigit [True, True, False, False] == 13
    ]

-- Create a fibbonaci sequence of length N in reverse order
-- For example, "fib 5" should return "[3, 2, 1, 1, 0]"
fib :: Int -> [Int]
fib n = undefined

-- Determine whether a given list is a palindrome
-- For example, "palindrome []" or "palindrome [1, 3, 1]" should return "True"
palindrome :: Eq a => [a] -> Bool
palindrome xs = xs == reverse xs

testPalindrome = and
    [  
        palindrome [1] == True,
        palindrome [1, 3, 1] == True
    ]

-- Map the first component of a pair with the given function
-- For example, "mapFirst (+3) (4, True)" should return "(7, True)"
mapFirst :: (a -> b) -> (a, c) -> (b, c)
mapFirst f (x, y) = (f x, y) 
-- mapFirst f pair = (f $ fst pair, snd pair)

testMapFirst = and
    [
        mapFirst (+3) (4, True) == (7, True)
    ]

-- Devise a function that has the following type
someFunction :: (a -> b -> c) -> (a -> b) -> a -> c
someFunction gc gb a = gc a (gb a)



