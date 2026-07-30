import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MartingalesDiscreteParameterTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MartingaleClosed A.object.process

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse