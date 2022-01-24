module Main where

import Data.Fix
import Witherable
import Prelude hiding (Predicate, filter)

data TermF a
  = Add a a
  | Mul a a
  | Neg a
  | Reciprocal a
  | IntL Integer
  deriving (Functor, Foldable, Traversable)

type Term = Fix TermF

type Class = Word

-- data Table = Table
--   { table :: Seq (Class, TermF Class),
--     classIndex :: Map Class Word
--   }

-- data ConjunctiveQuery b where
--   Term :: b -> TermF b -> ConjunctiveQuery b
--   Conjoin :: ConjunctiveQuery b -> ConjunctiveQuery b -> ConjunctiveQuery b

-- --Forall :: ConjunctiveQuery (Maybe b) -> ConjunctiveQuery b

-- runQuery :: Table -> ConjunctiveQuery (Maybe b) -> Seq Class
-- runQuery t (Term c f) = filter (== (c, ))
-- runQuery t (Conjoin a b) = _

-- type Query b = [(b, TermF b)]

-- query0 :: Table -> Query Void -> Seq Void
-- query0 _ _ = []

-- queryS :: Table -> (Query b -> r) -> Query (Maybe b) -> Seq (Class, r)
-- queryS t k [] = []
-- queryS t k (q : qs) = _

--queryS :: Table -> Query (Maybe b) -> (Seq Class, Query b)
--queryS t [] = (filter _ (table t), [])

-- schema: Add a b

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

-- data Add = Add Class Class Class
-- data IntL = IntL Class Int
-- data Equ = Equ Class Class

-- program = do
--   Predicate add <- predicateFor @Add
--   Predicate lits <- predicateFor @IntL
--   Predicate equ <- predicateFor @Equ
--   a <- var "a"
--   b <- var "b"
--   c <- var "c"
--   d <- var "d"
--   equ(a,b) |- do
--     add(a, b, c)
--     lits(c, 0)

main :: IO ()
main = putStr "main\n"
