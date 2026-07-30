import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MartingalesDiscreteParameterTheoremCanonicalLaneLean.MartingaleProcess

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure DoobConvergencePackage where
  martingale : MartingaleProcess
  supNorm : Prop
  a.s. convergence : Prop
  L1convergence : Prop

structure DoobConvergenceEvidence (D : DoobConvergencePackage) where
  supNormClosed : D.supNorm
  a.s.convergenceClosed : D.a.s.convergence
  L1convergenceClosed : D.L1convergence

def DoobConvergenceClosed (D : DoobConvergencePackage) : Prop :=
  D.supNorm ∧ D.a.s.convergence ∧ D.L1convergence

theorem doob_convergence_closed_from_evidence (D : DoobConvergencePackage)
    (E : DoobConvergenceEvidence D) : DoobConvergenceClosed D := by
  exact And.intro E.supNormClosed
    (And.intro E.a.s.convergenceClosed E.L1convergenceClosed)

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse