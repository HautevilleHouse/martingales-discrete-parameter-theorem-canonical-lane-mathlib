import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MartingalesDiscreteParameterTheoremCanonicalLaneLean.MartingaleProcess

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure MartingaleInequalitiesPackage where
  martingale : MartingaleProcess
  doobInequality : Prop
  chebyshevInequality : Prop
  convexInequality : Prop

structure MartingaleInequalitiesEvidence (I : MartingaleInequalitiesPackage) where
  doobInequalityClosed : I.doobInequality
  chebyshevInequalityClosed : I.chebyshevInequality
  convexInequalityClosed : I.convexInequality

def MartingaleInequalitiesClosed (I : MartingaleInequalitiesPackage) : Prop :=
  I.doobInequality ∧ I.chebyshevInequality ∧ I.convexInequality

theorem martingale_inequalities_closed_from_evidence (I : MartingaleInequalitiesPackage)
    (E : MartingaleInequalitiesEvidence I) : MartingaleInequalitiesClosed I := by
  exact And.intro E.doobInequalityClosed
    (And.intro E.chebyshevInequalityClosed E.convexInequalityClosed)

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse