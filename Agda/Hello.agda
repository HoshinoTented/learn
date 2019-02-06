module Hello where

open import Agda.Builtin.Equality
open import Agda.Builtin.Nat

trivialEq : {a : _} {A : Set a} → A ≡ A
trivialEq = refl

trivialEq' : ∀ {a} {A : Set a} → A ≡ A
trivialEq' = refl

trivialEq'' : ∀ a b → a + b ≡ a + b
trivialEq'' a b = refl

trans' : ∀ {a} {A : Set a} (a b c : A) → a ≡ b → b ≡ c → a ≡ c
trans' a .a c refl bc = bc

data _<=_ : (a b : Nat) → Set where
  0ltn : ∀ {n} → 0 <= n
  nltm : ∀ {n m} → n <= m → suc n <= suc m

7lt13 : 7 <= 13
7lt13 = nltm (nltm (nltm (nltm (nltm (nltm (nltm 0ltn))))))

abc : ∀ {a b c} → a <= b → b <= c → a <= c
abc 0ltn bc = 0ltn
abc (nltm ab) (nltm bc) = nltm (abc ab bc)
