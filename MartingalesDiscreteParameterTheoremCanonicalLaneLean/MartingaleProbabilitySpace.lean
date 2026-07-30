import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure MartingaleProbabilitySpace where
  carrier : Type u
  sigmaAlgebra : Set (Set carrier)
  probabilityMeasure : (Set carrier → ℝ)
  filtration : ℕ → Set (Set carrier)
  measureSpaceProperties : Prop
  filtrationProperties : Prop
  measureSpacePropertiesTerm : measureSpaceProperties
  filtrationPropertiesTerm : filtrationProperties

structure MartingaleProbabilitySpaceEvidence (Ω : MartingaleProbabilitySpace) where
  measureSpacePropertiesClosed : Ω.measureSpaceProperties
  filtrationPropertiesClosed : Ω. filtrationProperties

def MartingaleProbabilitySpaceClosed (Ω : MartingaleProbabilitySpace) : Prop :=
  Ω.measureSpaceProperties ∧ Ω.filtrationProperties

theorem martingale_probability_space_closed_from_evidence
    (Ω : MartingaleProbabilitySpace) (E : MartingaleProbabilitySpaceEvidence Ω) :
    MartingaleProbabilitySpaceClosed Ω := by
  exact And.intro E.measureSpacePropertiesClosed E.filtrationPropertiesClosed

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse
