{-# LANGUAGE DeriveDataTypeable #-}
{-# OPTIONS_GHC -fno-warn-missing-fields #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-----------------------------------------------------------------
-- Autogenerated by Thrift Compiler (0.7.0)                      --
--                                                             --
-- DO NOT EDIT UNLESS YOU ARE SURE YOU KNOW WHAT YOU ARE DOING --
-----------------------------------------------------------------

module GreetingService where
import Prelude ( Bool(..), Enum, Double, String, Maybe(..),
                 Eq, Show, Ord,
                 return, length, IO, fromIntegral, fromEnum, toEnum,
                 (&&), (||), (==), (++), ($), (-) )

import Control.Exception
import Data.ByteString.Lazy
import Data.Int
import Data.Typeable ( Typeable )
import qualified Data.Map as Map
import qualified Data.Set as Set

import Thrift


import Greet_Types
import qualified GreetingService_Iface as Iface
-- HELPER FUNCTIONS AND STRUCTURES --

data Greet_args = Greet_args{f_Greet_args_msg :: Maybe Message} deriving (Show,Eq,Ord,Typeable)
write_Greet_args oprot record = do
  writeStructBegin oprot "Greet_args"
  case f_Greet_args_msg record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("msg",T_STRUCT,1)
    write_Message oprot _v
    writeFieldEnd oprot}
  writeFieldStop oprot
  writeStructEnd oprot
read_Greet_args_fields iprot record = do
  (_,_t8,_id9) <- readFieldBegin iprot
  if _t8 == T_STOP then return record else
    case _id9 of 
      1 -> if _t8 == T_STRUCT then do
        s <- (read_Message iprot)
        read_Greet_args_fields iprot record{f_Greet_args_msg=Just s}
        else do
          skip iprot _t8
          read_Greet_args_fields iprot record
      _ -> do
        skip iprot _t8
        readFieldEnd iprot
        read_Greet_args_fields iprot record
read_Greet_args iprot = do
  _ <- readStructBegin iprot
  record <- read_Greet_args_fields iprot (Greet_args{f_Greet_args_msg=Nothing})
  readStructEnd iprot
  return record
data Greet_result = Greet_result{f_Greet_result_success :: Maybe Message} deriving (Show,Eq,Ord,Typeable)
write_Greet_result oprot record = do
  writeStructBegin oprot "Greet_result"
  case f_Greet_result_success record of {Nothing -> return (); Just _v -> do
    writeFieldBegin oprot ("success",T_STRUCT,0)
    write_Message oprot _v
    writeFieldEnd oprot}
  writeFieldStop oprot
  writeStructEnd oprot
read_Greet_result_fields iprot record = do
  (_,_t13,_id14) <- readFieldBegin iprot
  if _t13 == T_STOP then return record else
    case _id14 of 
      0 -> if _t13 == T_STRUCT then do
        s <- (read_Message iprot)
        read_Greet_result_fields iprot record{f_Greet_result_success=Just s}
        else do
          skip iprot _t13
          read_Greet_result_fields iprot record
      _ -> do
        skip iprot _t13
        readFieldEnd iprot
        read_Greet_result_fields iprot record
read_Greet_result iprot = do
  _ <- readStructBegin iprot
  record <- read_Greet_result_fields iprot (Greet_result{f_Greet_result_success=Nothing})
  readStructEnd iprot
  return record
process_greet (seqid, iprot, oprot, handler) = do
  args <- read_Greet_args iprot
  readMessageEnd iprot
  rs <- return (Greet_result Nothing)
  res <- (do
    res <- Iface.greet handler (f_Greet_args_msg args)
    return rs{f_Greet_result_success= Just res})
  writeMessageBegin oprot ("greet", M_REPLY, seqid);
  write_Greet_result oprot res
  writeMessageEnd oprot
  tFlush (getTransport oprot)
proc_ handler (iprot,oprot) (name,typ,seqid) = case name of
  "greet" -> process_greet (seqid,iprot,oprot,handler)
  _ -> do
    skip iprot T_STRUCT
    readMessageEnd iprot
    writeMessageBegin oprot (name,M_EXCEPTION,seqid)
    writeAppExn oprot (AppExn AE_UNKNOWN_METHOD ("Unknown function " ++ name))
    writeMessageEnd oprot
    tFlush (getTransport oprot)
process handler (iprot, oprot) = do
  (name, typ, seqid) <- readMessageBegin iprot
  proc_ handler (iprot,oprot) (name,typ,seqid)
  return True
