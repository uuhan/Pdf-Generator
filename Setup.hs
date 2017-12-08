import           Control.Monad
import           Distribution.PackageDescription    (PackageDescription (..))
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
  , copyHook = copyLibharu
  }

makeLib :: Args -> ConfigFlags -> IO ()
makeLib _ flags = do
  let v = fromFlag $ configVerbosity flags
  runInDir v "." [["bash", "dep.sh"]]
  runInDir v "libharu"
    [ ["cmake", "-DLIBHPDF_SHARED=OFF", "."]
    , ["make"]
    ]

runInDir :: Verbosity -> FilePath -> [[String]] -> IO ()
runInDir v path cmds = do
  old <- getCurrentDirectory
  setCurrentDirectory path
  forM_ cmds $ \cmd -> run cmd
  setCurrentDirectory old
  where
    run cmd = do
      rawSystemExit v "env" cmd

copyLibharu :: PackageDescription -> LocalBuildInfo -> UserHooks -> CopyFlags -> IO ()
copyLibharu desc lbi _ flags = do
  let libPref = libdir . absoluteInstallDirs desc lbi . fromFlag . copyDest $ flags
      v = fromFlag $ copyVerbosity flags
  runInDir v "libharu"
    [["cp", "src/libhpdfs.a", libPref]]
