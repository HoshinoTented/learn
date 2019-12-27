module Hash where

import Control.Monad.State
import System.Directory
import System.FilePath.Posix

type Shell = StateT FilePath IO

sh :: Shell a -> FilePath -> IO (a, FilePath)
sh shell path = runStateT shell path

cd :: FilePath -> Shell ()
cd path = do
    pwd <- get
    let path' = pwd </> path
    exists <- liftIO $ doesDirectoryExist path'

    if exists
        then put path'
        else liftIO $ fail $ "cd: " ++ path ++ ": No such file or directory"

echo :: Show a => Shell a -> Shell ()
echo str = str >>= liftIO . print

pwd :: Shell FilePath
pwd = get

ls :: Shell [FilePath]
ls = pwd >>= liftIO . listDirectory

home :: Shell FilePath
home = liftIO getHomeDirectory

shell :: Shell ()
shell = do
    echo pwd
    cd "Desktop"
    echo pwd
    echo pwd