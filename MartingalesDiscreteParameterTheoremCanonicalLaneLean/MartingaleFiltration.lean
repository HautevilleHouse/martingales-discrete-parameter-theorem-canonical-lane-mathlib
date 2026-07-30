import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure FiltrationPackage where
  indexSet : Type
  sigmaAlgebras : indexSet → Type
  filtrationProperty : Prop
  adaptedness : Prop

structure FiltrationEvidence (F : FiltrationPackage) where
  filtrationPropertyClosed : F.filtrationProperty
  adaptednessClosed : F.adaptedness

def FiltrationClosed (F : FiltrationPackage) : Prop :=
  F.filtrationProperty ∧ F.adaptedness

theorem filtration_closed_from_evidence (F : FiltrationPackage) (E : FiltrationEvidence F) :
    FiltrationClosed F :=
  And.intro E.filtrationPropertyClosed E.adaptednessClosed

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse