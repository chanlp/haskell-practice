#!/usr/bin/env stack
-- stack --install-ghc runghc

--module Main where
--main :: IO ()
--main = putStrLn "This is a test"

-- This is a pretty interesting concept --
-- Note: These are singly linked-lists, not arrays
c = [2, 3, 4] == 2 : 3 : 4 : []
main = print (c)

