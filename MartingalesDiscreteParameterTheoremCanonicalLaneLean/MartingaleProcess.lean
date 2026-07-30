import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure MartingaleSpace where
  carrier : Type
  sigmaAlgebra : SigmaAlgebra carrier

structure MartingaleProcess where
  space : MartingaleSpace
  timeIndex : ℕ → Prop
  adapted : Prop
  integrable : Prop
  conditionalExpectation : Prop
  expectationPreserved : Prop

structure MartingaleEvidence (M : MartingaleProcess) where
  adaptedClosed : M.adapted
  integrableClosed : M.integrable
  conditionalExpectationClosed : M.conditionalExpectation
  expectationPreservedClosed : M.expectationPreserved

def MartingaleClosed (M : MartingaleProcess) : Prop :=
  M.adapted ∧ M.integrable ∧ M.conditionalExpectation ∧ M.expectationPreserved

theorem martingale_closed_from_evidence (M : MartingaleProcess) (E : MartingaleEvidence M) :
    MartingaleClosed M := by
  exact And.intro E.adaptedClosed
    (And.intro E.integrableClosed
      (And.intro E.conditionalExpectationClosed E.expectationPreservedClosed))

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse