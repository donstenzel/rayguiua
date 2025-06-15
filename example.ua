# Experimental!
I ~ "git: https://github.com/marcos-cat/iris"
Gui ~ "lib"

~ {
  Text ← "Input..."
}

New

I~Open 400_500 "Testing"
°I~Screen~FPS 60

I~Loop!(
  ⊃⍥&p⋅˜⍜Text◌ Gui~TextBox [10 10 100 20]⊸⊓Text(20 1)
)
