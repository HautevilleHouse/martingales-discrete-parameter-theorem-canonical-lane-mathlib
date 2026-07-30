import canonicalLaneMathlib.AdmissibleClass
import MartingalesDiscreteParameterTheoremCanonicalLaneLean.MartingaleBasicDefinitions

namespace HautevilleHouse
namespace MartingalesDiscreteParameterTheoremCanonicalLaneLean

structure DoobMaximalInequalityPackage (Ω : Type u) [MeasurableSpace Ω] (F : Filtration Ω) (μ : Measure Ω) (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E] (X : AdaptedProcess Ω F E) where
  isSubmartingale : Prop
  maximalFunction : ℕ → (Ω → ℝ)
  inequality : ∀ λ > 0, ∀ n, μ[{ω | sup_{k ≤ n} ‖X.sequence k ω‖ ≥ λ}] ≤ (1/λ) * ∫ ω, ‖X.sequence n ω‖ ∂ μ
  integrableMax : ∀ n, Integrable (maximalFunction n) μ

structure DoobLpInequalityPackage (Ω : Type u) [MeasurableSpace Ω] (F : Filtration Ω) (μ : Measure Ω) (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E] (p : ℝ) (hp : 1 < p) (X : AdaptedProcess Ω F E) where
  isMartingale : MartingaleProperty Ω F μ E X
  lpInequality : ∀ n, (∫ ω, (‖X.sequence n ω‖) ^ p ∂ μ) ^ (1/p) ≤ (p/(p-1)) * (∫ ω, (sup_{k ≤ n} ‖X.sequence k ω‖) ^ p ∂ μ) ^ (1/p)

def DoobInequalityClosed (Ω : Type u) [MeasurableSpace Ω] (F : Filtration Ω) (μ : Measure Ω) (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E] (X : AdaptedProcess Ω F E) : Prop :=
  DoobMaximalInequalityPackage Ω F μ E X

theorem doob_inequality_implies_submartingale (Ω : Type u) [MeasurableSpace Ω] (F : Filtration Ω) (μ : Measure Ω) (E : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E] (X : AdaptedProcess Ω F E) (pkg : DoobMaximalInequalityPackage Ω F μ E X) : pkg.isSubmartingale := pkg.isSubmartingale

end MartingalesDiscreteParameterTheoremCanonicalLaneLean
end HautevilleHouse