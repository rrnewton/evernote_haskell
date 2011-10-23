


module Main where

import Network
import Network.TCP -- HandleStream
import Thrift.Protocol.Binary
import Thrift.Transport.HttpClient
-- import Thrift.Transport.Handle -- HMM... which Transport to pick?
-- import Thrift.Transport.Handle (hOpen)
import UserStore_Iface (authenticate)
import UserStore

-- import Network
-- import Greet_Types
-- import GreetingService_Client
-- import Thrift.Transport.Handle
-- import Thrift.Protocol.Binary
-- runclient = do 
--   handle <- hOpen("localhost", PortNumber 7911)
--   let m = Message { f_Message_msg = Nothing }
--   result <- greet (BinaryProtocol handle, BinaryProtocol handle) m
--   print result

-- test = authenticate ("wtf") 


client = HttpClient undefined undefined undefined undefined

-- HttpClient	 
--   hstream :: HandleStream ByteString
--   uri :: URI
--   writeBuffer :: WriteBuffer
--   readBuffer :: ReadBuffer


-- This seemes to be the URL to use:
-- https://www.evernote.com/edam/user



-- (BinaryProtocol handle, BinaryProtocol handle)

main = do
  putStrLn "Testing... calling authenticate..."

  

  putStrLn "Client finished"

