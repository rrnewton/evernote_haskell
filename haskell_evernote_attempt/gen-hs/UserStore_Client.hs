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

module UserStore_Client(checkVersion,authenticate,refreshAuthentication,getUser,getPublicUserInfo) where
import Data.IORef
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

import qualified Types_Types
import qualified Errors_Types


import UserStore_Types
import UserStore
seqid = newIORef 0
checkVersion (ip,op) arg_clientName arg_edamVersionMajor arg_edamVersionMinor = do
  send_checkVersion op arg_clientName arg_edamVersionMajor arg_edamVersionMinor
  recv_checkVersion ip
send_checkVersion op arg_clientName arg_edamVersionMajor arg_edamVersionMinor = do
  seq <- seqid
  seqn <- readIORef seq
  writeMessageBegin op ("checkVersion", M_CALL, seqn)
  write_CheckVersion_args op (CheckVersion_args{f_CheckVersion_args_clientName=Just arg_clientName,f_CheckVersion_args_edamVersionMajor=Just arg_edamVersionMajor,f_CheckVersion_args_edamVersionMinor=Just arg_edamVersionMinor})
  writeMessageEnd op
  tFlush (getTransport op)
recv_checkVersion ip = do
  (fname, mtype, rseqid) <- readMessageBegin ip
  if mtype == M_EXCEPTION then do
    x <- readAppExn ip
    readMessageEnd ip
    throw x
    else return ()
  res <- read_CheckVersion_result ip
  readMessageEnd ip
  case f_CheckVersion_result_success res of
    Just v -> return v
    Nothing -> do
      throw (AppExn AE_MISSING_RESULT "checkVersion failed: unknown result")
authenticate (ip,op) arg_username arg_password arg_consumerKey arg_consumerSecret = do
  send_authenticate op arg_username arg_password arg_consumerKey arg_consumerSecret
  recv_authenticate ip
send_authenticate op arg_username arg_password arg_consumerKey arg_consumerSecret = do
  seq <- seqid
  seqn <- readIORef seq
  writeMessageBegin op ("authenticate", M_CALL, seqn)
  write_Authenticate_args op (Authenticate_args{f_Authenticate_args_username=Just arg_username,f_Authenticate_args_password=Just arg_password,f_Authenticate_args_consumerKey=Just arg_consumerKey,f_Authenticate_args_consumerSecret=Just arg_consumerSecret})
  writeMessageEnd op
  tFlush (getTransport op)
recv_authenticate ip = do
  (fname, mtype, rseqid) <- readMessageBegin ip
  if mtype == M_EXCEPTION then do
    x <- readAppExn ip
    readMessageEnd ip
    throw x
    else return ()
  res <- read_Authenticate_result ip
  readMessageEnd ip
  case f_Authenticate_result_success res of
    Just v -> return v
    Nothing -> do
      case f_Authenticate_result_userException res of
        Nothing -> return ()
        Just _v -> throw _v
      case f_Authenticate_result_systemException res of
        Nothing -> return ()
        Just _v -> throw _v
      throw (AppExn AE_MISSING_RESULT "authenticate failed: unknown result")
refreshAuthentication (ip,op) arg_authenticationToken = do
  send_refreshAuthentication op arg_authenticationToken
  recv_refreshAuthentication ip
send_refreshAuthentication op arg_authenticationToken = do
  seq <- seqid
  seqn <- readIORef seq
  writeMessageBegin op ("refreshAuthentication", M_CALL, seqn)
  write_RefreshAuthentication_args op (RefreshAuthentication_args{f_RefreshAuthentication_args_authenticationToken=Just arg_authenticationToken})
  writeMessageEnd op
  tFlush (getTransport op)
recv_refreshAuthentication ip = do
  (fname, mtype, rseqid) <- readMessageBegin ip
  if mtype == M_EXCEPTION then do
    x <- readAppExn ip
    readMessageEnd ip
    throw x
    else return ()
  res <- read_RefreshAuthentication_result ip
  readMessageEnd ip
  case f_RefreshAuthentication_result_success res of
    Just v -> return v
    Nothing -> do
      case f_RefreshAuthentication_result_userException res of
        Nothing -> return ()
        Just _v -> throw _v
      case f_RefreshAuthentication_result_systemException res of
        Nothing -> return ()
        Just _v -> throw _v
      throw (AppExn AE_MISSING_RESULT "refreshAuthentication failed: unknown result")
getUser (ip,op) arg_authenticationToken = do
  send_getUser op arg_authenticationToken
  recv_getUser ip
send_getUser op arg_authenticationToken = do
  seq <- seqid
  seqn <- readIORef seq
  writeMessageBegin op ("getUser", M_CALL, seqn)
  write_GetUser_args op (GetUser_args{f_GetUser_args_authenticationToken=Just arg_authenticationToken})
  writeMessageEnd op
  tFlush (getTransport op)
recv_getUser ip = do
  (fname, mtype, rseqid) <- readMessageBegin ip
  if mtype == M_EXCEPTION then do
    x <- readAppExn ip
    readMessageEnd ip
    throw x
    else return ()
  res <- read_GetUser_result ip
  readMessageEnd ip
  case f_GetUser_result_success res of
    Just v -> return v
    Nothing -> do
      case f_GetUser_result_userException res of
        Nothing -> return ()
        Just _v -> throw _v
      case f_GetUser_result_systemException res of
        Nothing -> return ()
        Just _v -> throw _v
      throw (AppExn AE_MISSING_RESULT "getUser failed: unknown result")
getPublicUserInfo (ip,op) arg_username = do
  send_getPublicUserInfo op arg_username
  recv_getPublicUserInfo ip
send_getPublicUserInfo op arg_username = do
  seq <- seqid
  seqn <- readIORef seq
  writeMessageBegin op ("getPublicUserInfo", M_CALL, seqn)
  write_GetPublicUserInfo_args op (GetPublicUserInfo_args{f_GetPublicUserInfo_args_username=Just arg_username})
  writeMessageEnd op
  tFlush (getTransport op)
recv_getPublicUserInfo ip = do
  (fname, mtype, rseqid) <- readMessageBegin ip
  if mtype == M_EXCEPTION then do
    x <- readAppExn ip
    readMessageEnd ip
    throw x
    else return ()
  res <- read_GetPublicUserInfo_result ip
  readMessageEnd ip
  case f_GetPublicUserInfo_result_success res of
    Just v -> return v
    Nothing -> do
      case f_GetPublicUserInfo_result_notFoundException res of
        Nothing -> return ()
        Just _v -> throw _v
      case f_GetPublicUserInfo_result_systemException res of
        Nothing -> return ()
        Just _v -> throw _v
      case f_GetPublicUserInfo_result_userException res of
        Nothing -> return ()
        Just _v -> throw _v
      throw (AppExn AE_MISSING_RESULT "getPublicUserInfo failed: unknown result")
