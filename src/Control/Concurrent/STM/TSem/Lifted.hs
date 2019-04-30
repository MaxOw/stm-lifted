module Control.Concurrent.STM.TSem.Lifted
    ( module All
    , newTSemIO
    , waitTSemIO
    , signalTSemIO
    , signalTSemNIO
    ) where

import Numeric.Natural (Natural)
import Control.Concurrent.STM.TSem as All
import Internal

----------------------------------------------------------------------

newTSemIO :: MonadIO m => Integer -> m TSem
newTSemIO = atomically . newTSem

waitTSemIO :: MonadIO m => TSem -> m ()
waitTSemIO = atomically . waitTSem

signalTSemIO :: MonadIO m => TSem -> m ()
signalTSemIO = atomically . signalTSem

signalTSemNIO :: MonadIO m => Natural -> TSem -> m ()
signalTSemNIO = atomically .: signalTSemN
