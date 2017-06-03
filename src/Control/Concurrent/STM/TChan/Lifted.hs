module Control.Concurrent.STM.TChan.Lifted
    ( module All
    , newTChanIO
    , newBroadcastTChanIO
    , dupTChanIO
    , readTChanIO
    , tryReadTChanIO
    , peekTChanIO
    , tryPeekTChanIO
    , writeTChanIO
    , unGetTChanIO
    , isEmptyTChanIO
    , cloneTChanIO
    ) where

import Control.Concurrent.STM.TChan as All
    hiding (newTChanIO, newBroadcastTChanIO)
import qualified Control.Concurrent.STM.TChan as STM
import Internal

newTChanIO :: MonadIO m => m (TChan a)
newTChanIO = liftIO STM.newTChanIO

newBroadcastTChanIO :: MonadIO m => m (TChan a)
newBroadcastTChanIO = liftIO STM.newBroadcastTChanIO

dupTChanIO :: MonadIO m => TChan a -> m (TChan a)
dupTChanIO = atomically . dupTChan

readTChanIO :: MonadIO m => TChan a -> m a
readTChanIO = atomically . readTChan

tryReadTChanIO :: MonadIO m => TChan a -> m (Maybe a)
tryReadTChanIO = atomically . tryReadTChan

peekTChanIO :: MonadIO m => TChan a -> m a
peekTChanIO = atomically . peekTChan

tryPeekTChanIO :: MonadIO m => TChan a -> m (Maybe a)
tryPeekTChanIO = atomically . tryPeekTChan

writeTChanIO :: MonadIO m => TChan a -> a -> m ()
writeTChanIO = atomically .: writeTChan

unGetTChanIO :: MonadIO m => TChan a -> a -> m ()
unGetTChanIO = atomically .: unGetTChan

isEmptyTChanIO :: MonadIO m => TChan a -> m Bool
isEmptyTChanIO = atomically . isEmptyTChan

cloneTChanIO :: MonadIO m => TChan a -> m (TChan a)
cloneTChanIO = atomically . cloneTChan
