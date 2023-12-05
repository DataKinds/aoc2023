# 𝕨 is separator
# 𝕩 is string to split
Sp←{𝕩⊔˜-⟜1(𝕩≠𝕨)×(1⊸+ +` 𝕩=𝕨)}

l←"Game 70: 6 blue, 16 green, 4 red; 6 green, 13 red, 2 blue; 7 green, 1 red, 2 blue; 8 green, 4 blue, 1 red; 10 red, 11 green"
ParseGame←{ 𝕊𝕩 :
  head‿tail←':'Sp 𝕩
  id←⊑⌽' 'Sp head
  •Show tail
  games←(>⌽)⚇¯1 (>⟜0∘≠¨)⊸/⚇2 (⌽' '⊸Sp)⚇1 (','⊸Sp)¨ ';'Sp tail
  •Show ≢¨ games
  (•ParseFloat id)⋈•ParseFloat⚇¯2⌾((1⊸⊏ ⍉)¨) games
}
id‿gs←ParseGame l

# takes a game 𝕩 and produces a ⟨3⟩-array in RGB order
SortGame←{
  tagged←(⊏˘𝕩)⍒⊸⊏𝕩
  needed←"red"‿"green"‿"blue"∊˘tagged
}
# 𝕨 is the bag contents ≢𝕨 is ⟨3,2⟩
# 𝕩 is the game round. ≢𝕩 is ⟨n,2⟩ for n≤3.
# they both should look like
# ┌─            
# ╵ "red"   4   
#   "green" 16  
#   "blue"  6   
#              ┘
# returns the viability of the game
ProcessGame←{
  𝕩
}

ParseGame l
