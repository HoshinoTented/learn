module Hello where

open import Agda.Builtin.Equality
open import Agda.Builtin.Nat
open import Agda.Primitive

trivialEq : {a : _} {A : Set a} → A ≡ A
trivialEq = refl

trivialEq' : ∀ {a} {A : Set a} → A ≡ A
trivialEq' = refl

trivialEq'' : ∀ a b → a + b ≡ a + b
trivialEq'' a b = refl

trans' : ∀ {A : Set} (a b c : A) → a ≡ b → b ≡ c → a ≡ c
trans' a .a c refl bc = bc

cong : ∀ {A B : Set} → (f : A → B) → {a b : A} → a ≡ b → f a ≡ f b
cong f refl = refl

test : ∀ a → a + 0 ≡ a
test zero = refl
test (suc a) = cong suc (test a)

test2 : ∀ a b → (a + suc b) ≡ suc (a + b)
test2 zero b = refl
test2 (suc a) b = cong suc (test2 a b)

comm : ∀ a b → a + b ≡ b + a
comm zero b rewrite test b = refl
comm (suc a) b rewrite comm a b | test2 b a = refl

data _<=_ : (a b : Nat) → Set where
  0ltn : ∀ {n} → 0 <= n
  nltm : ∀ {n m} → n <= m → suc n <= suc m

7lt13 : 7 <= 13
7lt13 = nltm (nltm (nltm (nltm (nltm (nltm (nltm 0ltn))))))

abc : ∀ {a b c} → a <= b → b <= c → a <= c
abc 0ltn bc = 0ltn
abc (nltm ab) (nltm bc) = nltm (abc ab bc)

id : {a : Set} → a → a
id i = i

flip' : {l : Level} {a b c : Set l} → (a → b → c) → (b → a → c)
flip' f = \b a → f a b

_dian_ : {l : Level} {a b c : Set l} → (b → c) → (a → b) → a → c
_dian_ a b v = a (b v)

_&_ : {l : Level} {a b : Set} → a → (a → b) → b
_&_ = flip' id
