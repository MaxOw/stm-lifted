module Control.Concurrent.STM.TVar.Lifted
    ( module All
    , newTVarIO
    , readTVarIO
    , writeTVarIO
    , modifyTVarIO
    , modifyTVarIO'
    , stateTVarIO
    , swapTVarIO
    ) where

import Control.Concurrent.STM.TVar as All
    hiding (newTVarIO, readTVarIO)
import qualified Control.Concurrent.STM.TVar as STM
import Internal

----------------------------------------------------------------------

newTVarIO :: MonadIO m => a -> m (TVar a)
newTVarIO = liftIO . STM.newTVarIO

readTVarIO :: MonadIO m => TVar a -> m a
readTVarIO = liftIO . STM.readTVarIO

writeTVarIO :: MonadIO m => TVar a -> a -> m ()
writeTVarIO = atomically .: writeTVar

-- | Non-strict version
modifyTVarIO :: MonadIO m => TVar a -> (a -> a) -> m ()
modifyTVarIO = atomically .: modifyTVar

-- | Strict version
modifyTVarIO' :: MonadIO m => TVar a -> (a -> a) -> m ()
modifyTVarIO' = atomically .: modifyTVar'

stateTVarIO :: MonadIO m => TVar s -> (s -> (a, s)) -> m a
stateTVarIO = atomically .: stateTVar

swapTVarIO :: MonadIO m => TVar a -> a -> m a
swapTVarIO = atomically .: swapTVar
