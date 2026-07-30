import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

/-!
# Doob's Maximal Inequality Package

Doob's L¹ inequality and Lᵖ inequalities for discrete-parameter martingales.
-/

structure DoobInequalityPackage {Ω : Type} [inst : MeasurableSpace Ω]
    {F : Filtration} {X_adapted : AdaptedProcess Ω F} {X : Martingale Ω F X_adapted} where
  l1Inequality : ∀ λ > 0, λ * ℙ (∃ n : ℕ, |X_adapted.process n| ≥ λ) ≤ sup_{n} ∫ |X_adapted.process n| ∂ℙ
  lpInequality : ∀ p > 1, (∫ (sup_n |X_adapted.process n|)^p ∂ℙ)^(1/p) ≤ (p/(p-1)) * sup_n (∫ |X_adapted.process n|^p ∂ℙ)^(1/p)

structure DoobInequalityEvidence {Ω : Type} [inst : MeasurableSpace Ω]
    {F : Filtration} {X_adapted : AdaptedProcess Ω F} {X : Martingale Ω F X_adapted}
    (P : DoobInequalityPackage Ω F X_adapted X) where
  l1InequalityClosed : P.l1Inequality
  lpInequalityClosed : P.lpInequality

def DoobInequalityClosed {Ω : Type} [inst : MeasurableSpace Ω]
    {F : Filtration} {X_adapted : AdaptedProcess Ω F} {X : Martingale Ω F X_adapted}
    (P : DoobInequalityPackage Ω F X_adapted X) : Prop :=
  P.l1Inequality ∧ P.lpInequality

theorem doob_inequality_closed_from_evidence
    {Ω : Type} [inst : MeasurableSpace Ω] {F : Filtration}
    {X_adapted : AdaptedProcess Ω F} {X : Martingale Ω F X_adapted}
    (P : DoobInequalityPackage Ω F X_adapted X) (E : DoobInequalityEvidence P) :
    DoobInequalityClosed P := by
  exact And.intro E.l1InequalityClosed E.lpInequalityClosed

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse