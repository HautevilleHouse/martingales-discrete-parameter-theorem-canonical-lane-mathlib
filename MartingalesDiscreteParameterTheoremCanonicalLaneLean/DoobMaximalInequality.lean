import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure DoobMaximalInequalityPackage where
  submartingale : Type
  maximalFunction : Type
  lpBound : Prop
  weakTypeInequality : Prop

def DoobMaximalInequalityClosed (D : DoobMaximalInequalityPackage) : Prop :=
  D.lpBound ∧ D.weakTypeInequality

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse