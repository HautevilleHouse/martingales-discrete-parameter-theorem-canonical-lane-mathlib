import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure QuadraticVariationPackage (Ω : MartingaleProbabilitySpace) (M : Martingale Ω) where
  squareIntegrability : ∀ n : ℕ, (∫ x, (M.adaptedProcess n x)^2 dΩ.probabilityMeasure) < ∞
  doobMeyerDecomposition : Prop
  predictableVariationProcess : ℕ → (Ω.carrier → ℝ)
  variationProperties : Prop
  squareIntegrabilityTerm : squareIntegrability
  doobMeyerDecompositionTerm : doobMeyerDecomposition
  predictableVariationProcessTerm : predictableVariationProcess
  variationPropertiesTerm : variationProperties

structure QuadraticVariationEvidence (Ω : MartingaleProbabilitySpace) (M : Martingale Ω)
    (Q : QuadraticVariationPackage Ω M) where
  squareIntegrabilityClosed : Q.squareIntegrability
  doobMeyerDecompositionClosed : Q.doobMeyerDecomposition
  predictableVariationProcessClosed : Q.predictableVariationProcess
  variationPropertiesClosed : Q.variationProperties

def QuadraticVariationClosed (Ω : MartingaleProbabilitySpace) (M : Martingale Ω)
    (Q : QuadraticVariationPackage Ω M) : Prop :=
  Q.squareIntegrability ∧ Q.doobMeyerDecomposition ∧
  Q.predictableVariationProcess ∧ Q.variationProperties

theorem quadratic_variation_closed_from_evidence (Ω : MartingaleProbabilitySpace) (M : Martingale Ω)
    (Q : QuadraticVariationPackage Ω M) (E : QuadraticVariationEvidence Ω M Q) :
    QuadraticVariationClosed Ω M Q := by
  exact And.intro E.squareIntegrabilityClosed
    (And.intro E.doobMeyerDecompositionClosed
      (And.intro E.predictableVariationProcessClosed E.variationPropertiesClosed))

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse
