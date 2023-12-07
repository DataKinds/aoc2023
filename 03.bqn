i←{∾⟜((⊑≢𝕩)⥊'.')⌾⍉𝕩}>•FLines "03.in"
inums←10≠"0123456789"⊐i
igears←{𝕩× 2+ +`⌾⥊ 𝕩}'*'⍷i
isyms←(1-(i='.'))-inums
caPart1←inums+2×isyms
caPart2←inums+igears

DilateAdj←{(DilateOrtho 𝕩)++´⟨»⌾⍉ »𝕩, »⌾⍉ «𝕩, «⌾⍉ »𝕩, «⌾⍉ «𝕩⟩}
DilateOrtho←{+´⟨𝕩,»𝕩,«𝕩,»⌾⍉𝕩,«⌾⍉𝕩⟩}
Sp←{𝕩⊔˜-⟜1(𝕩≠𝕨)×(1⊸+ +` 𝕩=𝕨)}

# Part 1
# Digits are given state 1, symbols are given state 2, and significant
# digits are given state 3. 1 adjacent to 2 or 3 becomes 3.
StepCA1←{
  nums←1=𝕩
  syms←2=𝕩
  sigs←3=𝕩
  newThrees←0≠(2=nums+0≠DilateOrtho sigs)+(2=nums+0≠DilateAdj syms)
  𝕩⌈3×newThrees
}
finalCA←3=StepCA1⍟100 caPart1
indices←/⥊finalCA
•Show +´ •ParseFloat¨ (⊐ indices-↕≠indices)⊔indices⊏⥊i

# Part 2
# Each gear is given a unique CA value > 2, and numbers are given the
# values of the adjacent gears.
Range←{(⊑𝕩)⊸+ ∘ (↕1⊸+) ∘ -˜´ 𝕩}
StepCA2←{
  nums←1=𝕩
  sigs←2=𝕩
  gears←𝕩×2<𝕩
  𝕩⌈nums×DilateAdj gears
}
finalCA2←{𝕩×𝕩>2} StepCA2⍟100 caPart2
numStrs←{(Range (⌊´⋈⌈´) 1⊸⊑⊔⥊(𝕩= finalCA2-igears))⊏⥊i}¨ (Range 3⋈(⌈´⥊finalCA2))
mulStrs←{
  𝕊⟨x⟩ : x ;
  𝕊x : {(⊑𝕩)∾"*"∾(¯1⊸⊑𝕩)} x
}¨ {(1⊸- 0⊸= ≠¨𝕩)/𝕩}¨ '.'Sp¨numStrs
•Show +´ ×´¨ •ParseFloat⚇1 {(2=≠¨𝕩)/𝕩} {(1-0=≠¨𝕩)/𝕩}¨ '*'Sp¨mulStrs

