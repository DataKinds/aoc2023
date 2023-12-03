ParseLine ← {
  fl ← 0‿¯1⊸⊏ (∊⟜"0123456789" 𝕩) / 𝕩
  •ParseFloat fl
}
+´ParseLine¨•FLines "01.in"

valE ← "zero"‿"one"‿"two"‿"three"‿"four"‿"five"‿"six"‿"seven"‿"eight"‿"nine"
valD ← ⋈¨"0123456789"
Val ← {⊑ +˝ ((≠𝕩)⊸↑)¨ (∾˜↕10) × (valD∾valE) ⍷⌜ (⋈𝕩)}
ParseLine2 ← (0‿¯1⊸⊏)∘((0⊸≠)⊸/)∘Val∘(∾⟜"     ")
ParseLine2¨•FLines "01.2.in"
+´ {+´ ⟨10,1⟩⊸×}¨ ParseLine2¨ •FLines "01.in"
