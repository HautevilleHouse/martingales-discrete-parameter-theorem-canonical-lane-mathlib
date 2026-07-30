import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure MartingalePackage (F : FiltrationPackage) where
  adaptedProcess : Type
  integrability : Prop
  martingaleProperty : Prop

structure MartingaleEvidence {F : FiltrationPackage} (M : MartingalePackage F) where
  integrabilityClosed : M.integrability
  martingalePropertyClosed : M.martingaleProperty

def MartingaleClosed {F : FiltrationPackage} (M : MartingalePackage F) : Prop :=
  M.integrability ∧ M.martingaleProperty

theorem martingale_closed_from_evidence {F : FiltrationPackage} (M : MartingalePackage F)
    (E : MartingaleEvidence M) : MartingaleClosed M :=
  And.intro E.integrabilityClosed E.martingalePropertyClosed

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse