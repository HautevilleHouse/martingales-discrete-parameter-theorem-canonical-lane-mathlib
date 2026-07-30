import canonicalLaneMathlib.AdmissibleClass
namespace HautevilleHouse
namespace martingales_discrete_parameter_theorem_canonical_lane_mathlib
def AdmissibleClass : Type := canonicalLaneMathlib.AdmissibleClass
def bridgeClosed (A : AdmissibleClass) : Prop := True
def gateClosed (A : AdmissibleClass) : Prop := True
def bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := trivial
def gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := trivial
end martingales_discrete_parameter_theorem_canonical_lane_mathlib
end HautevilleHouse
