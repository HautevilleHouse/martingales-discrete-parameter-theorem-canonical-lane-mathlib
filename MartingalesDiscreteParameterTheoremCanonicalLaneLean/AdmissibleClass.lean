import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : MartingalePackage (F : FiltrationPackage)
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MartingaleClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse