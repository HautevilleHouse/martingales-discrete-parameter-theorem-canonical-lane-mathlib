import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure OptionalStoppingPackage where
  stoppingTime : Type
  stoppedProcess : Type
  expectationEquality : Prop
  boundedCondition : Prop

def OptionalStoppingClosed (O : OptionalStoppingPackage) : Prop :=
  O.expectationEquality ∧ O.boundedCondition

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse