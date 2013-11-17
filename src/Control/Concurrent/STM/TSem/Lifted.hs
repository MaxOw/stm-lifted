module Control.Concurrent.STM.TSem.Lifted
    ( module All
    , newTSemIO
    , waitTSemIO
    , signalTSemIO
    ) where

import Control.Concurrent.STM.TSem as All
import Internal

----------------------------------------------------------------------

newTSemIO :: MonadIO m => Int -> m TSem
newTSemIO = atomically . newTSem

waitTSemIO :: MonadIO m => TSem -> m ()
waitTSemIO = atomically . waitTSem

signalTSemIO :: MonadIO m => TSem -> m ()
signalTSemIO = atomically . signalTSem

