import           Control.Monad
import           Distribution.Simple
import           Distribution.Simple.Setup
import           Distribution.Simple.Utils (rawSystemExit)
import           System.Directory

main :: IO ()
main = defaultMainWithHooks simpleUserHooks
  { preBuild = \a b -> makeLib a b >> preBuild simpleUserHooks a b }

makeLib :: Args -> BuildFlags -> IO ()
makeLib _ flags = do
  runInDir flags "." [["bash", "dep.sh"]]
  runInDir flags "libharu"
    [ ["cmake", "-DLIBHPDF_SHARED=OFF", "."]
    , ["make"]
    ]

runInDir :: BuildFlags -> FilePath -> [[String]] -> IO ()
runInDir flags path cmds = do
  old <- getCurrentDirectory
  setCurrentDirectory path
  forM_ cmds $ \cmd -> run flags cmd
  setCurrentDirectory old
  where
    run flags cmd = do
      rawSystemExit (fromFlag $ buildVerbosity flags) "env" cmd
