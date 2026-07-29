-- Term mode solution
example : A ∧ (A → B) → B :=
  fun h => h.2 h.1

-- Tactic mode solution
