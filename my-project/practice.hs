#!/usr/bin/env stack
-- stack --install-ghc runghc

--module Main where
--main :: IO ()
--main = putStrLn "This is a test"

-- This is a pretty interesting concept --
-- Note: These are singly linked-lists, not arrays
-- c = [2, 3, 4] == 2 : 3 : 4 : []
-- main = print (c)

trial :: Integer -> Integer
trial n
	| n `mod` 2 == 0 = n `div` 2 -- results in remainder 0 when div by 2
	| otherwise		 = 3 * n + 1 -- otherwise == true

trialSeq :: Integer -> [Integer]
trialSeq 1 = [1]
trialSeq n = n : trialSeq (trial n)

-- Compute the length of a list of integers
intListLength :: [Integer] -> Integer
intListLength [] = 0
intListLength (x:xs) = 1 + intListLength xs

-- show
-- The number of trial steps needed to reach 1 from a given number
trialLen :: Integer -> Integer
trialLen n = intListLength (trialSeq n) - 1

-- Each element of the sequence is only generated as needed
-- The sequence generation and list length calc are interleaved
-- Complexity: O(1)
main = print (trialLen 5)
