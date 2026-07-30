import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure StoppingTimePackage (F : FiltrationPackage) where
  stoppingTime : Type
  stoppingTimeProperty : Prop
  optionalSampling : Prop

structure StoppingTimeEvidence {F : FiltrationPackage} (T : StoppingTimePackage F) where
  stoppingTimePropertyClosed : T.stoppingTimeProperty
  optionalSamplingClosed : T.optionalSampling

def StoppingTimeClosed {F : FiltrationPackage} (T : StoppingTimePackage F) : Prop :=
  T.stoppingTimeProperty ∧ T.optionalSampling

theorem stopping_time_closed_from_evidence {F : FiltrationPackage} (T : StoppingTimePackage F)
    (E : StoppingTimeEvidence T) : StoppingTimeClosed T :=
  And.intro E.stoppingTimePropertyClosed E.optionalSamplingClosed

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse