import           Control.Monad
import           Data.Maybe                         (fromJust)
import           Distribution.PackageDescription
import           Distribution.Simple
import           Distribution.Simple.LocalBuildInfo (InstallDirs (..),
                                                     LocalBuildInfo (..),
                                                     absoluteInstallDirs)
import           Distribution.Simple.Setup
import           Distribution.Simple.Utils          (rawSystemExit)
import           Distribution.Verbosity             (Verbosity)
import           System.Directory

main :: IO ()
main = defaultMainWithHooks simpleUserHooks
  { preConf = \a b -> makeLib a b >> preConf simpleUserHooks a b
  , confHook = \a f -> confHook simpleUserHooks a f >>= updateExtraLibDirs
  , postConf = \_ _ _ _ -> return ()
  , preBuild = updateLibDirs
  , postCopy = copyLibharu
  }

makeLib :: Args -> ConfigFlags -> IO ()
makeLib _ flags = do
  let v = fromFlag $ configVerbosity flags
  runInDir v "." [["bash", "dep.sh"]]
  runInDir v "libharu"
    [ ["cmake", "-DLIBHPDF_SHARED=OFF", "."]
    , ["make"]
    ]

updateExtraLibDirs :: LocalBuildInfo -> IO LocalBuildInfo
updateExtraLibDirs lbi = do
  let pkg_descr = localPkgDescr lbi
      lib = fromJust $ library pkg_descr
      libBuild = libBuildInfo lib
      libPref = libdir $ absoluteInstallDirs pkg_descr lbi NoCopyDest
  return lbi { localPkgDescr = pkg_descr {
                 library = Just $ lib { libBuildInfo = libBuild {
                                          extraLibDirs = libPref : extraLibDirs libBuild
                                        }
                                  }
               }
         }

updateLibDirs :: Args -> BuildFlags -> IO HookedBuildInfo
updateLibDirs _ _ = do
  dir <- getCurrentDirectory
  let libharuDir = dir ++ "/libharu/src"
      bi = emptyBuildInfo { extraLibDirs = [ libharuDir ] }
  return (Just bi, [])

copyLibharu :: Args -> CopyFlags -> PackageDescription -> LocalBuildInfo -> IO ()
copyLibharu _ flags desc lbi = do
  let libPref = libdir . absoluteInstallDirs desc lbi . fromFlag . copyDest $ flags
      v = fromFlag $ copyVerbosity flags
   in runInDir v "libharu"
        [["cp", "src/libhpdfs.a", libPref]]

runInDir :: Verbosity -> FilePath -> [[String]] -> IO ()
runInDir v path cmds = do
  old <- getCurrentDirectory
  setCurrentDirectory path
  forM_ cmds $ \cmd -> run cmd
  setCurrentDirectory old
  where
    run cmd = do
      rawSystemExit v "env" cmd

