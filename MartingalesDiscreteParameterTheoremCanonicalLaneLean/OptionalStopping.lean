import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure OptionalStoppingPackage (M : MartingalePackage (F : FiltrationPackage)) where
  optionalStoppingTheorem : Prop
  boundedStoppingTime : Prop
  stoppedMartingale : Prop

structure OptionalStoppingEvidence {M : MartingalePackage F} (O : OptionalStoppingPackage M) where
  optionalStoppingTheoremClosed : O.optionalStoppingTheorem
  boundedStoppingTimeClosed : O.boundedStoppingTime
  stoppedMartingaleClosed : O.stoppedMartingale

def OptionalStoppingClosed {M : MartingalePackage F} (O : OptionalStoppingPackage M) : Prop :=
  O.optionalStoppingTheorem ∧ O.boundedStoppingTime ∧ O.stoppedMartingale

theorem optional_stopping_closed_from_evidence
    {M : MartingalePackage F} (O : OptionalStoppingPackage M)
    (E : OptionalStoppingEvidence O) : OptionalStoppingClosed O :=
  And.intro E.optionalStoppingTheoremClosed
    (And.intro E.boundedStoppingTimeClosed E.stoppedMartingaleClosed)

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse