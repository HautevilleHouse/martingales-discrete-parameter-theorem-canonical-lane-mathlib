import canonicalLaneMathlib.AdmissibleClass
import MartingalesDiscreteParameterTheoremCanonicalLaneLean.MartingaleBasicDefinitions

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure MartingaleConvergencePackage (Ω : Type u) [MeasurableSpace Ω] (F : Filtration Ω) (μ : Measure Ω) (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E] (X : AdaptedProcess Ω F E) where
  isMartingale : MartingaleProperty Ω F μ E X
  integrableSup : IntegrableCondition Ω μ E (λ n => λ ω => sup_{k ≥ n} ‖X.sequence k ω‖)
  aELimitExists : ∀ᵐ ω ∂ μ, ∃ (L : E), Filter.Tendsto (λ n => X.sequence n ω) Filter.atTop (nhds L)
  limitMeasurable : Measurable (λ ω => lim_{n→∞} X.sequence n ω)

def MartingaleConvergenceClosed (Ω : Type u) [MeasurableSpace Ω] (F : Filtration Ω) (μ : Measure Ω) (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E] (X : AdaptedProcess Ω F E) : Prop :=
  MartingaleConvergencePackage Ω F μ E X

theorem martingale_convergence_implies_limit (Ω : Type u) [MeasurableSpace Ω] (F : Filtration Ω) (μ : Measure Ω) (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E] (X : AdaptedProcess Ω F E) (pkg : MartingaleConvergencePackage Ω F μ E X) :
  ∀ᵐ ω ∂ μ, ∃ (L : E), Filter.Tendsto (λ n => X.sequence n ω) Filter.atTop (nhds L) := pkg.aELimitExists

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse