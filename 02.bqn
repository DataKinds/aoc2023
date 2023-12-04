# 𝕨 is separator
# 𝕩 is string to split
Sp←{𝕩⊔˜-⟜1(𝕩≠𝕨)×(1⊸+ +` 𝕩=𝕨)}

l←"Game 70: 6 blue, 16 green, 4 red; 6 green, 13 red, 2 blue; 7 green, 1 red, 2 blue; 8 green, 4 blue, 1 red; 10 red, 11 green"
ParseGame←{ 𝕊𝕩 :
  head‿tail←':'Sp 𝕩
  id←⊑⌽' 'Sp head
  games←(>⟜0∘≠¨)⊸/⚇2 (' '⊸Sp)⚇1 (','⊸Sp)¨ ';'Sp tail
  (•ParseFloat id)⋈•ParseFloat⚇¯2⌾((⊏⍉)¨) >⚇¯1 games
}
ParseGame l
