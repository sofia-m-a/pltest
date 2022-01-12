module Main where

-- data Var b a
--   = Bound b
--   | Free a

-- data Ann a b = Ann a b

-- instance Eq b => Eq (Ann a b) where
--   Ann _ b == Ann _ c = b == c

-- instance Ord b => Ord (Ann a b) where
--   Ann _ b `compare` Ann _ c = b `compare` c

-- data Term s a
--   = Var a
--   | Covar a
--   | IntL Natural
--   | StringL Text
--   | Inj s a
--   | Match
--   | Comatch
--   | Proj s a
--   | Let a a a
--   | AsType a a
--   | Coerce a a a
--   deriving (Eq, Ord, Show, Functor, Foldable, Traversable)

-- type Row s a = [(s, a)]

-- data TType s a
--   = Natural
--   | Integer
--   | String
--   | Sum (Row s a)
--   | Product (Row s a)
--   | Arrow a a
--   | TypeInType

-- type Context s a = Map a (TType s a)

-- type Elab s a b = Reader (Context s a) b

-- infer :: Term s a -> Elab s a (Term s (TType s a, a), TType s a)
-- infer t = case t of
--   Var a -> _ <$> ask
--   Covar a -> _
--   IntL i -> pure (IntL i, Natural)
--   StringL s -> pure (StringL s, String)
--   Inj s a -> _
--   Match -> _
--   Comatch -> _
--   Proj s a -> _
--   AsType a a' -> _
--   Let a a' a3 -> _
--   Coerce a a' a3 -> _


main :: IO ()
main = putStr "main\n"
