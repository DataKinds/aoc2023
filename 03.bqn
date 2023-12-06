i←{∾⟜((⊑≢𝕩)⥊'.')⌾⍉𝕩}>•FLines "03.in"
inums←10≠"0123456789"⊐i
igears←{𝕩× 2+ +`⌾⥊ 𝕩}'*'⍷i
isyms←(1-(i='.'))-inums
caPart1←inums+2×isyms
caPart2←inums+igears

DilateAdj←{(DilateOrtho 𝕩)++´⟨»⌾⍉ »𝕩, »⌾⍉ «𝕩, «⌾⍉ »𝕩, «⌾⍉ «𝕩⟩}
DilateOrtho←{+´⟨𝕩,»𝕩,«𝕩,»⌾⍉𝕩,«⌾⍉𝕩⟩}

# Part 1
StepCA1←{
  nums←1=𝕩
  syms←2=𝕩
  sigs←3=𝕩
  newThrees←0≠(2=nums+0≠DilateOrtho sigs)+(2=nums+0≠DilateAdj syms)
  𝕩⌈3×newThrees
}
finalCA←3=StepCA1⍟100 caPart1
indices←/⥊finalCA
+´ •ParseFloat¨ (⊐ indices-↕≠indices)⊔indices⊏⥊i

# Part 2
# Each gear is given a unique CA value > 3, and those values are propagated same as part 1.
Sp←{𝕩⊔˜-⟜1(𝕩≠𝕨)×(1⊸+ +` 𝕩=𝕨)}
StepCA2←{
  nums←1=𝕩
  sigs←2=𝕩
  gears←𝕩×2<𝕩
  𝕩⌈nums×DilateAdj gears
}
finalCA2←{𝕩×𝕩>2} StepCA2⍟100 caPart2
+´ ×´¨ {𝕩 /˜ 2=≠¨𝕩} •ParseFloat⚇1 '*'Sp¨ (-⟜1{𝕩×𝕩>0}finalCA2-2)⊔i
