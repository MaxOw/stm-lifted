module Control.Concurrent.STM.TBQueue.Lifted
    ( module All
    , newTBQueueIO
    , readTBQueueIO
    , tryReadTBQueueIO
    , flushTBQueueIO
    , peekTBQueueIO
    , tryPeekTBQueueIO
    , writeTBQueueIO
    , unGetTBQueueIO
    , lengthTBQueueIO
    , isEmptyTBQueueIO
    , isFullTBQueueIO
    ) where

import Numeric.Natural (Natural)
import Control.Concurrent.STM.TBQueue as All hiding (newTBQueueIO)
import qualified Control.Concurrent.STM.TBQueue as STM
import Internal

----------------------------------------------------------------------

newTBQueueIO :: MonadIO m => Natural -> m (TBQueue a)
newTBQueueIO = liftIO . STM.newTBQueueIO

writeTBQueueIO :: MonadIO m => TBQueue a -> a -> m ()
writeTBQueueIO = atomically .: writeTBQueue

readTBQueueIO :: MonadIO m => TBQueue a -> m a
readTBQueueIO = atomically . readTBQueue

tryReadTBQueueIO :: MonadIO m => TBQueue a -> m (Maybe a)
tryReadTBQueueIO = atomically . tryReadTBQueue

flushTBQueueIO :: MonadIO m => TBQueue a -> m [a]
flushTBQueueIO = atomically . flushTBQueue

peekTBQueueIO :: MonadIO m => TBQueue a -> m a
peekTBQueueIO = atomically . peekTBQueue

tryPeekTBQueueIO :: MonadIO m => TBQueue a -> m (Maybe a)
tryPeekTBQueueIO = atomically . tryPeekTBQueue

unGetTBQueueIO :: MonadIO m => TBQueue a -> a -> m ()
unGetTBQueueIO = atomically .: unGetTBQueue

lengthTBQueueIO :: MonadIO m => TBQueue a -> m Natural
lengthTBQueueIO = atomically . lengthTBQueue

isEmptyTBQueueIO :: MonadIO m => TBQueue a -> m Bool
isEmptyTBQueueIO = atomically . isEmptyTBQueue

isFullTBQueueIO :: MonadIO m => TBQueue a -> m Bool
isFullTBQueueIO = atomically . isFullTBQueue
