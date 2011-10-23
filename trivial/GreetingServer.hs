

-- module GreetingServer where
module Main where

import GreetingService_Iface
import GreetingService
import Greet_Types
import Thrift.Server

data GREET = GREET
instance GreetingService_Iface GREET where
  greet GREET Nothing = return Message {f_Message_msg = Just "No argument"}
  greet GREET (Just m) = return m {f_Message_msg = Just "Reply"}

serve = runBasicServer GREET process 7911

main = do
  putStrLn "Starting Server..."
  serve
  putStrLn "Server finished"
