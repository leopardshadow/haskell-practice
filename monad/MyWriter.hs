module MyWriter where


f :: Float -> Float
f = (+3)

g :: Float -> Float
g = (*10)

--
-- (f . g)  1

f' :: Float -> (Float, String)
f' x = (f x, "f is called. ")

g' :: Float -> (Float, String)
g' x = (g x, "g is called. ")


-- f' $ g' 1   -- doesn't work


-- directly extract the components
naive_f_g :: Float -> (Float, String)
naive_f_g x = let (gx, gs) = g' x
                  (fx, fs) = f' gx
                in (fx, gs++fs)

-- naive_f_g 1


-- bind !
-- bind f' :: (Float, String) -> (Float, String)
bind :: (Float -> (Float, String)) -> (Float, String) -> (Float, String)
bind f (gx, gs) = let (fx, fs) = f gx
                    in (fx, gs++fs)

--
-- (bind f' . g') 1


compose :: (Float -> (Float, String)) -> (Float -> (Float, String)) -> (Float -> (Float, String))
compose f' g' x = (bind f' . g') x


-- (f' `compose` g') 1

-- 'identity' debuggable function
-- unit * f = f * unit = f
unit :: Float -> (Float, String)
unit x = (x, "")


-- lift :: (Float -> Float) -> (Float -> (Float, String))
-- lift f x = (f x, "")

-- (lift (+1)) `compose` f' $ 1


-- -- now
-- bind f' (unit )





-- instance Monad (Float, String) where
--     return x = (x, "")
--     (x, s) (>>=) f = let (fx, fs) = f x in (fx, s++fs)
