module Control.Concurrent.STM.TQueue.Lifted
    ( module All
    , newTQueueIO
    , readTQueueIO
    , tryReadTQueueIO
    , flushTQueueIO
    , peekTQueueIO
    , tryPeekTQueueIO
    , writeTQueueIO
    , unGetTQueueIO
    , isEmptyTQueueIO
    ) where

import Control.Concurrent.STM.TQueue as All hiding (newTQueueIO)
import qualified Control.Concurrent.STM.TQueue as STM
import Internal

----------------------------------------------------------------------

newTQueueIO :: MonadIO m => m (TQueue a)
newTQueueIO = liftIO STM.newTQueueIO

writeTQueueIO :: MonadIO m => TQueue a -> a -> m ()
writeTQueueIO = atomically .: writeTQueue

readTQueueIO :: MonadIO m => TQueue a -> m a
readTQueueIO = atomically . readTQueue

tryReadTQueueIO :: MonadIO m => TQueue a -> m (Maybe a)
tryReadTQueueIO = atomically . tryReadTQueue

flushTQueueIO :: MonadIO m => TQueue a -> m [a]
flushTQueueIO = atomically . flushTQueue

peekTQueueIO :: MonadIO m => TQueue a -> m a
peekTQueueIO = atomically . peekTQueue

tryPeekTQueueIO :: MonadIO m => TQueue a -> m (Maybe a)
tryPeekTQueueIO = atomically . tryPeekTQueue

unGetTQueueIO :: MonadIO m => TQueue a -> a -> m ()
unGetTQueueIO = atomically .: unGetTQueue

isEmptyTQueueIO :: MonadIO m => TQueue a -> m Bool
isEmptyTQueueIO = atomically . isEmptyTQueue
