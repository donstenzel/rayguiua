# Experimental!
I ~ "git: https://github.com/marcos-cat/iris"
Gui ~ "lib"

~ {
  Text ← "..."
}

New

I~Open 120_65 "Testing"
°I~Screen~FPS 60

Gui~LoadStyle "style/lavanda.rgs"

I~Loop!(
  ◌ Gui~Label [10 10 100 20] "Enter topic..."
  ⊃⍥&p⋅˜⍜Text◌ Gui~Box~Text [10 35 100 20]⊸⊓Text(20 1)
)
