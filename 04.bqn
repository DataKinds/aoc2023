# Input preprocessing
# cat 04.1.in | perl -ne '/Card (.+:) +(.+) \| (.+)/ && print $1,$2,"|",$3,"\n"' | sponge 04.1.in
# (it actually works without this lol cuz we dont use id)
Sp←{𝕩⊔˜-⟜1(𝕩≠𝕨)×(1⊸+ +` 𝕩=𝕨)}
Squish←{(1-0=≠¨𝕩)/𝕩}
CardPoints←{
  id‿cs←':'Sp 𝕩
  winning‿mine←•ParseFloat⚇1 Squish¨ ' '⊸Sp¨ '|'⊸Sp cs
  {𝕊0 : 0 ; 𝕊x : 2⊸⋆ x-1} +´ winning∊mine
}
+´ CardPoints¨ •FLines "04.in"
