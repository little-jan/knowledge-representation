-- https://leanprover-community.github.io/logic_and_proof/propositional_logic_in_lean.html#exercises

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


-- Term mode solution
example : ¬ (A ∧ B) → (A → ¬ B) :=
  fun h1 : ¬ (A ∧ B) =>
    fun h2 : A =>
      fun h3 : B =>
        h1 ⟨h2, h3⟩  --Function application

--Tactic mode solution
variable {A B : Prop}
example : ¬ (A ∧ B) → (A → ¬ B) := by
  intro (h1 : ¬ (A ∧ B))
  intro (h2 : A)
  intro (h3 : B)
  exact h1 ⟨h2, h3⟩


-- Term mode solution
example (h₁ : A ∨ B) (h₂ : A → C) (h₃ : B → D) : C ∨ D :=
  h₁.elim
    (fun hA : A => Or.inl (h₂ hA))
    (fun hB : B => Or.inr (h₃ hB))

--Tactic mode solution
example (h₁ : A ∨ B) (h₂ : A → C) (h₃ : B → D) : C ∨ D := by
  cases h₁ with
  | inl hA =>
    left
    exact h₂ hA
  | inr hB =>
    right
    exact h₃ hB


-- Term mode solution
example (h : ¬ A ∧ ¬ B) : ¬ (A ∨ B) :=
  fun h_or : A ∨ B =>
    h_or.elim
      (fun hA : A => h.left hA)
      (fun hB : B => h.right hB)

--Tactic mode solution
example (h : ¬ A ∧ ¬ B) : ¬ (A ∨ B) := by
  obtain ⟨hA, hB⟩ := h
  intro (h_or : A ∨ B)
  cases h_or with
  | inl h1 =>
    exact hA h1
  | inr h2 =>
    exact hB h2


--Term mode solution
example : ¬ (A ↔ ¬ A) :=
  fun h1 : A ↔ ¬ A =>
    have h_notA : ¬ A :=
      fun h2 : A =>
        (h1.mp h2) h2  --h1.mp = forward direction
    have hA : A :=
      h1.mpr h_notA  --h1.mpr = reverse direction
    h_notA hA
