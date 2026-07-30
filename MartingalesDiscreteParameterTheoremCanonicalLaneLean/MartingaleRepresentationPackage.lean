import canonicalLaneMathlib.AdmissibleClass
import MartingalesDiscreteParameterTheoremCanonicalLaneLean.MartingaleBasicDefinitions

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure MartingaleRepresentationPackage (Ω : Type u) [MeasurableSpace Ω] (F : Filtration Ω) (μ : Measure Ω) (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E] (X : AdaptedProcess Ω F E) where
  isMartingale : MartingaleProperty Ω F μ E X
  representation : ∃ (H : ℕ → Ω → (E →L[ℝ] E)),
    (∀ n, Measurable (F.sigmaFields n) (by infer_instance) (H n)) ∧
    (∀ n, X.sequence (n+1) - X.sequence n = H n • (someUniformIntegrableIncrement n))
  incrementIntegrability : IntegrableCondition Ω μ E (λ n => someUniformIntegrableIncrement n)

def MartingaleRepresentationClosed (Ω : Type u) [MeasurableSpace Ω] (F : Filtration Ω) (μ : Measure Ω) (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E] (X : AdaptedProcess Ω F E) : Prop :=
  MartingaleRepresentationPackage Ω F μ E X

theorem martingale_representation_implies_decomposition (Ω : Type u) [MeasurableSpace Ω] (F : Filtration Ω) (μ : Measure Ω) (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E] (X : AdaptedProcess Ω F E) (pkg : MartingaleRepresentationPackage Ω F μ E X) :
  ∃ (H : ℕ → Ω → (E →L[ℝ] E)), (∀ n, Measurable (F.sigmaFields n) (by infer_instance) (H n)) ∧ (∀ n, X.sequence (n+1) - X.sequence n = H n • (someUniformIntegrableIncrement n)) := pkg.representation

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse