# 𝕨 is separator
# 𝕩 is string to split
Sp←{𝕩⊔˜-⟜1(𝕩≠𝕨)×(1⊸+ +` 𝕩=𝕨)}

ParseGame←{ 𝕊𝕩 :
  head‿tail←':'Sp 𝕩
  id←⊑⌽' 'Sp head
  games←(>⌽)⚇¯1 (>⟜0∘≠¨)⊸/⚇2 (⌽' '⊸Sp)⚇1 (','⊸Sp)¨ ';'Sp tail
  (•ParseFloat id)⋈•ParseFloat⚇¯2⌾((1⊸⊏ ⍉)¨) games
}

# 𝕩 is the game round. ≢𝕩 is ⟨n,2⟩ for n≤3.
# it should have the label in the left column and the value in the right, like:
# ┌─            
# ╵ "red"   4   
#   "green" 16  
#   "blue"  6   
#              ┘
# we produce a ⟨3⟩-list of values in RGB order
SortGame←{
  defaults←⍉"red"‿"green"‿"blue" ≍ 0‿0‿0
  sorted←(∊0⊸⊏˘)⊸/ (⊏˘(𝕩∾defaults))⍒⊸⊏(𝕩∾defaults)
  1⊸⊏˘ sorted
}
# 𝕨 is a ⟨3⟩-list of the bag contents in RGB order
# 𝕩 is a ⟨3⟩-list representing the game in RGB order
ValidateGame←{0⊸= +´ <⟜0 𝕨-𝕩}

# Part 1
+´ {
  id‿gs←ParseGame 𝕩
  gsOk←0⊸= +´ 1⊸- (12‿13‿14⊸ValidateGame¨) (SortGame¨ gs)
  id×gsOk
}¨ •FLines "02.in"

# Part 2
+´ {
  id‿gs←ParseGame 𝕩
  ×´ ⌈´ SortGame¨ gs
}¨ •FLines "02.in"
