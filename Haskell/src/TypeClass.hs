module TypeClass where


data OIer = Hoshino | Ice1000
data OJ = IOI | NOI | NOIP

class OI a where
    ak :: a -> OJ -> Bool
    score :: a -> OJ -> Int
    baoZero :: a -> OJ -> Bool
    {-# MINIMAL score #-}

    ak oier oj = score oier oj == 400
    baoZero oier oj = score oier oj == 0

instance OI OIer where
    score Hoshino _ = 0
    score Ice1000 NOIP = 400
    score Ice1000 _ = 100
