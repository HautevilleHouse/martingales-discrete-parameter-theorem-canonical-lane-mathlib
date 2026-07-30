import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure MartingaleCentralLimitPackage where
  triangularArray : Type
  asymptoticNormality : Prop
  conditionalLindeberg : Prop

def MartingaleCentralLimitClosed (M : MartingaleCentralLimitPackage) : Prop :=
  M.asymptoticNormality ∧ M.conditionalLindeberg

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse