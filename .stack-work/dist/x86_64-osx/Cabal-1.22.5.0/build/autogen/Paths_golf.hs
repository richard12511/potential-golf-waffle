module Paths_golf (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/richardschmidt/Code/Haskell/potential-golf-waffle/.stack-work/install/x86_64-osx/lts-6.7/7.10.3/bin"
libdir     = "/Users/richardschmidt/Code/Haskell/potential-golf-waffle/.stack-work/install/x86_64-osx/lts-6.7/7.10.3/lib/x86_64-osx-ghc-7.10.3/golf-0.1.0.0-ADidVBTeny7Jo5XmbrR4dC"
datadir    = "/Users/richardschmidt/Code/Haskell/potential-golf-waffle/.stack-work/install/x86_64-osx/lts-6.7/7.10.3/share/x86_64-osx-ghc-7.10.3/golf-0.1.0.0"
libexecdir = "/Users/richardschmidt/Code/Haskell/potential-golf-waffle/.stack-work/install/x86_64-osx/lts-6.7/7.10.3/libexec"
sysconfdir = "/Users/richardschmidt/Code/Haskell/potential-golf-waffle/.stack-work/install/x86_64-osx/lts-6.7/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "golf_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "golf_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "golf_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "golf_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "golf_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
