module Control.Concurrent.STM.TMVar.Lifted
    ( module All
    , newTMVarIO
    , newEmptyTMVarIO
    , takeTMVarIO
    , putTMVarIO
    , readTMVarIO
    , tryReadTMVarIO
    , swapTMVarIO
    , tryTakeTMVarIO
    , tryPutTMVarIO
    , isEmptyTMVarIO
    ) where

import Control.Concurrent.STM.TMVar as All
    hiding (newTMVarIO, newEmptyTMVarIO)
import qualified Control.Concurrent.STM.TMVar as STM
import Internal

----------------------------------------------------------------------

newTMVarIO :: MonadIO m => a -> m (TMVar a)
newTMVarIO = liftIO . STM.newTMVarIO

newEmptyTMVarIO :: MonadIO m => m (TMVar a)
newEmptyTMVarIO = liftIO STM.newEmptyTMVarIO

takeTMVarIO :: MonadIO m => TMVar a -> m a
takeTMVarIO = atomically . takeTMVar

tryTakeTMVarIO :: MonadIO m => TMVar a -> m (Maybe a)
tryTakeTMVarIO = atomically . tryTakeTMVar

putTMVarIO :: MonadIO m => TMVar a -> a -> m ()
putTMVarIO = atomically .: putTMVar

tryPutTMVarIO :: MonadIO m => TMVar a -> a -> m Bool
tryPutTMVarIO = atomically .: tryPutTMVar

readTMVarIO :: MonadIO m => TMVar a -> m a
readTMVarIO = atomically . readTMVar

tryReadTMVarIO :: MonadIO m => TMVar a -> m (Maybe a)
tryReadTMVarIO = atomically . tryReadTMVar

swapTMVarIO :: MonadIO m => TMVar a -> a -> m a
swapTMVarIO = atomically .: swapTMVar

isEmptyTMVarIO :: MonadIO m => TMVar a -> m Bool
isEmptyTMVarIO = atomically . isEmptyTMVar
