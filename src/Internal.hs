module Internal (STM, atomically, (.:), MonadIO(..)) where

import Control.Monad.IO.Class
import Control.Concurrent.STM (STM)
import qualified Control.Concurrent.STM as STM

(.:) :: (a -> b) -> (c -> d -> a) -> (c -> d -> b)
(.:) = (.) . (.)
infixl 8 .:

atomically :: MonadIO m => STM a -> m a
atomically = liftIO . STM.atomically
