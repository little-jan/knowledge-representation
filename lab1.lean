-- Term mode solution
example : A ∧ (A → B) → B :=
  fun h => h.2 h.1

-- Tactic mode solution
variable {A B : Prop}
example : A ∧ (A → B) → B := by
  intro h
  cases h with | intro hA hAB =>
    apply hAB
    exact hA


-- Term mode solution
example : A → ¬ (¬ A ∧ B) :=
  fun h1 : A =>
    fun h2 : ¬ A ∧ B =>
      h2.left h1

-- Tactic mode solution
variable {A B : Prop}
example : A → ¬ (¬ A ∧ B) := by
  intro (h1 : A)
  intro (h2 : (¬ A ∧ B))
  have h3 : ¬ A := h2.left  --Extract left from h2 to h3
  exact h3 h1
