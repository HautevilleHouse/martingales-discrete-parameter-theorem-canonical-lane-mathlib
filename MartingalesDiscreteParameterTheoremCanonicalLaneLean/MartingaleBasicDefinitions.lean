import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure Filtration (Ω : Type u) [MeasurableSpace Ω] where
  sigmaFields : ℕ → MeasurableSpace Ω
  isIncreasing : ∀ n m, n ≤ m → MeasurableSpace.IsSubordinate (sigmaFields n) (sigmaFields m)
  completeInitial : MeasurableSpace.IsComplete (sigmaFields 0)

structure AdaptedProcess (Ω : Type u) [MeasurableSpace Ω] (F : Filtration Ω) (E : Type v) [NormedAddCommGroup E] where
  sequence : ℕ → Ω → E
  measurable : ∀ n, Measurable (F.sigmaFields n) (by infer_instance) (sequence n)

structure IntegrableCondition (Ω : Type u) [MeasurableSpace Ω] (μ : Measure Ω) (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E] (X : ℕ → Ω → E) : Prop where
  integrable : ∀ n, Integrable (X n) μ

structure MartingaleProperty (Ω : Type u) [MeasurableSpace Ω] (F : Filtration Ω) (μ : Measure Ω) (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E] (X : AdaptedProcess Ω F E) : Prop where
  integrable : IntegrableCondition Ω μ E X.sequence
  adaptation : X.measurable
  conditionalExpectation : ∀ n m, n ≤ m → μ[(X.sequence m) | F.sigmaFields n] = X.sequence n

def MartingaleObject (Ω : Type u) [MeasurableSpace Ω] (F : Filtration Ω) (μ : Measure Ω) (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E] (X : AdaptedProcess Ω F E) : Prop :=
  MartingaleProperty Ω F μ E X

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse