# Rayguiua

[Raygui](https://github.com/raysan5/raygui) bindings for [Uiua](https://uiua.org).

To use these you will need either [Rayua](https://github.com/uiua-lang/rayua) or
[Iris](https://github.com/marcos-cat/iris). Simply establish the usual rendering
loop before using any of the components.


## Example

Here is a tiny example with a single TextBox that prints
it's contents whenever the user presses enter or the left
mouse button.

```uiua
# Experimental!
I ~ "git: https://github.com/marcos-cat/iris"
Gui ~ "git: https://github.com/donstenzel/rayguiua"

~ {
  Text ← "Input..."
}


New

I~Open 400_500 "Testing"
°I~Screen~FPS 60

I~Loop!(
  ⊃⍥&p⋅˜⍜Text◌ Gui~TextBox [10 10 100 20]⊸⊓Text(20 1)
)
```

If you clone this repo, you can try it out with `uiua run example.ua`.
Alternatively, copy the example into a local file and run that.

## Binaries

Right now there is only the binary I built on my system.
If this does not work for you, you can build Raygui as a standalone
yourself.

On Linux this looks something like this:
```bash
mv src/raygui.h src/raygui.c
gcc -I{PATH TO RAYLIB HEADERS} -L{PATH TO LIBRAYLIB} -o raygui.so src/raygui.c -shared -fpic -DRAYGUI_IMPLEMENTATION -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
mv src/raygui.c src/raygui.h
```
The path to raylib headers and path to libraylib (and the respective flags)
are only required if these are not somewhere in your PATH.

You will need the raylib shared library and headers, which match the
raygui version you are compiling. The master branches of them should
always line up, however, you will need to account for Rayua's internal
raylib version (5.5 at the time of writing)
