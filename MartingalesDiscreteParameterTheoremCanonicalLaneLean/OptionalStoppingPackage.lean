import canonicalLaneMathlib.AdmissibleClass
import MartingalesDiscreteParameterTheoremCanonicalLaneLean.MartingaleBasicDefinitions

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure StoppingTime (Ω : Type u) [MeasurableSpace Ω] (F : Filtration Ω) where
  tau : Ω → ℕ
  measurable : ∀ n, {ω | tau ω ≤ n} ∈ F.sigmaFields n

structure OptionalStoppingPackage (Ω : Type u) [MeasurableSpace Ω] (F : Filtration Ω) (μ : Measure Ω) (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E] (X : AdaptedProcess Ω F E) (τ : StoppingTime Ω F) where
  isMartingale : MartingaleProperty Ω F μ E X
  boundedTau : ∃ N, ∀ ω, τ.tau ω ≤ N
  stoppedProcess : AdaptedProcess Ω F E
  optionalStopping : μ[stoppedProcess.sequence (τ.tau ω)] = μ[stoppedProcess.sequence 0]
  integrability : ∀ n, Integrable (stoppedProcess.sequence n) μ

def OptionalStoppingClosed (Ω : Type u) [MeasurableSpace Ω] (F : Filtration Ω) (μ : Measure Ω) (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E] (X : AdaptedProcess Ω F E) (τ : StoppingTime Ω F) : Prop :=
  OptionalStoppingPackage Ω F μ E X τ

theorem optional_stopping_holds (Ω : Type u) [MeasurableSpace Ω] (F : Filtration Ω) (μ : Measure Ω) (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E] (X : AdaptedProcess Ω F E) (τ : StoppingTime Ω F) (pkg : OptionalStoppingPackage Ω F μ E X τ) :
  μ[pkg.stoppedProcess.sequence (τ.tau ω)] = μ[pkg.stoppedProcess.sequence 0] := pkg.optionalStopping

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse