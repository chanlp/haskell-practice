#!/usr/bin/env stack

-- An annotated example of quicksort implemented in Haskell

-- Define a function qsort, that takes a list a and returns a list a, with the type being of the Ord typeclass
qsort :: (Ord a) => [a] -> [a]

-- Edge condition: Given an empty list, return an empty list (which is technically sorted)
-- The empty list is when recursion doesn't apply... and also is the identity.
-- This is why it is used as the edge case. 
qsort [] = []

-- Explanation... 
--qsort (x:xs) = qsort (filter (<= x) xs)
--	++ x : qsort (filter (> x) xs)

-- A sorted list is a list that all the values smaller than (or equal to) the head of the list in front
-- (and those values are sorted), then comes the head of the list in the middle, and then all the values
-- that are bigger than the head (also sorted)

-- a is the head, and value x is being appended to list xs
-- Positional conditions are checked in the recursive calls
-- Two halves are merged together

qsort (x:xs) =
	let smallerSorted = qsort [a | a <- xs, a <= x] -- First recursive call
		biggerSorted = qsort [a | a <- xs, a > x]   -- Second recursive call 
	in smallerSorted ++ [x] ++ biggerSorted

-- e.g.
-- [5, 1, 9, 4, 6, 7, 3]
-- [1, 4, 3] ++ [5] ++ [9, 6, 7]
-- sort both sublists recursivley...
-- [1, 3, 4] ++ [5] ++ [6, 7, 9]

main = qsort ([5, 1, 9, 4, 6, 7, 3])
