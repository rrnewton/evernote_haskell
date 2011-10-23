
-- module GreetingClient where
module Main where

import Network
import Greet_Types
import GreetingService_Client
import Thrift.Transport.Handle
import Thrift.Protocol.Binary

runclient = do 
  handle <- hOpen("localhost", PortNumber 7911)
  let m = Message { f_Message_msg = Nothing }
  result <- greet (BinaryProtocol handle, BinaryProtocol handle) m
  print result

main = runclient
