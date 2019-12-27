{-# LANGUAGE CPP #-}

#define def(name, type) name :: type
#define impl(name) name =
#define safeDo runST $ do
#define end

module CppExt where

import Cpp hiding (main)

def(main, IO ())
impl(main) do
    [a, b] <- vars ([1, 2] :: [Int])
    av <- get a
    bv <- get b

    cout << av << bv << endl

    return ()
end