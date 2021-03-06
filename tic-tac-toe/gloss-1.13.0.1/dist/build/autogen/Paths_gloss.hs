module Paths_gloss (
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
version = Version [1,13,0,1] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/michael/.cabal/bin"
libdir     = "/home/michael/.cabal/lib/x86_64-linux-ghc-7.10.3/gloss-1.13.0.1-0oh88aqX2EBJACtgkdBhpV"
datadir    = "/home/michael/.cabal/share/x86_64-linux-ghc-7.10.3/gloss-1.13.0.1"
libexecdir = "/home/michael/.cabal/libexec"
sysconfdir = "/home/michael/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "gloss_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "gloss_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "gloss_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "gloss_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "gloss_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
