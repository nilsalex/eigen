{- |
Some of Eigen's algorithms can exploit the multiple cores present in your hardware.
To this end, it is enough to enable OpenMP on your compiler, for instance: GCC: -fopenmp.
You can control the number of threads that will be used using either by the OpenMP API or by Eigen's API using the following priority:

1. OMP_NUM_THREADS=n ./my_program
2. setNbThreads n

Unless setNbThreads has been called, Eigen uses the number of threads specified by OpenMP.
You can restore this behaviour by calling @setNbThreads n@

Currently, the following algorithms can make use of multi-threading: general matrix - matrix products PartialPivLU.
-}

module Eigen.Parallel
  ( setNbThreads
  , getNbThreads
  ) where

import Eigen.Internal (Cast(..), c_setNbThreads, c_getNbThreads)

-- | Sets the max number of threads reserved for Eigen
setNbThreads :: Int -> IO ()
setNbThreads = c_setNbThreads . toC

-- | Gets the max number of threads reserved for Eigen
getNbThreads :: IO Int
getNbThreads = fromC <$> c_getNbThreads
