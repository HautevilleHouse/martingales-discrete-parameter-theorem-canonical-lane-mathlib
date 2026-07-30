import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure MartingaleConvergencePackage where
  almostSureConvergence : Prop
  limitIntegrable : Prop
  lpConvergence : Prop
  closureCondition : Prop

def MartingaleConvergenceClosed (M : MartingaleConvergencePackage) : Prop :=
  M.almostSureConvergence ∧ M.limitIntegrable ∧ M.lpConvergence ∧ M.closureCondition

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse