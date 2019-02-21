module Learn.IORef where

    import Prelude hiding (sum)
    import qualified Data.IORef as IORef
    import qualified System.Environment as Env

    (=>>) :: IORef.IORef a -> (a -> b) -> IO b
    r =>> f = IORef.readIORef r >>= return . f

    (<<=) :: IORef.IORef a -> a -> IO a
    r <<= v = do
        ov <- IORef.readIORef r

        IORef.writeIORef r v

        return ov

    sum' :: Int -> Int
    sum' 0 = 0
    sum' n = n + sum' (n - 1)

    sum :: IORef.IORef Int -> Int -> IO ()
    sum _ 0 = return ()
    sum s m = do
        IORef.modifyIORef s (+ m)
        sum s (m - 1)

    main :: IO ()
    main = do
        n <- read . head <$> Env.getArgs
        s <- IORef.newIORef 0
        sum s n

        x <- s =>> (+1)

        print x
        print =<< (IORef.readIORef s)

        return ()