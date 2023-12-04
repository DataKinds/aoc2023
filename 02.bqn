# 𝕨 is separator
# 𝕩 is string to split
Sp←{𝕩⊔˜-⟜1(𝕩≠𝕨)×(1⊸+ +` 𝕩=𝕨)}

Parse←{ 𝕊𝕩 :
  l←"Game 70: 6 blue, 16 green, 4 red; 6 green, 13 red, 2 blue; 7 green, 1 red, 2 blue; 8 green, 4 blue, 1 red; 10 red, 11 green"
  id←⊑⌽' 'Sp(⊑':'Sp l)
  (
  n
}
Parse 1
