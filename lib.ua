# Experimental!

Rg ← &ffi⊂□"bin/raygui.so"

# TODO
# - [/] Add signature comments with names from raygui.h
#   - [ ] figure out what the int returns do
# - [x] use with rayua/iris
# - [ ] Create a more complex example (button that adds items to a list?)
# - [ ] Some higher level wrapping
#   - [ ] enable / disable as inverses
#   - [ ] pseudo properties like Style as getter / setter (un-by)
# - [ ] add library path logic from rayua (and also libs for other platforms?? [how tho])

┌─╴Ty
  → ↚ $"_*" # pointer, cause it points to the thing!

  Bool ← "int"

  String ← →"const char"

  Rect ← "{float; float; float; float}"

  Color ← "{unsigned char; unsigned char; unsigned char; unsigned char}"

  Image ← "{const unsigned char*; int; int; int; int}"

  Texture ← "unsigned int; int; int; int; int"

  GlyphInfo ← $"{int; int; int; int; _}" Image

  Font ← $"{int; int; int; _; _; _}" Texture Rect GlyphInfo

  V₂ ← "{float; float}"
  V₃ ← "{float; float; float}"
└─╴

Enable  ← ◌ Rg {"void" "GuiEnable"} {}
Disable ← ◌ Rg {"void" "GuiDisable"} {}

Lock     ← ◌ Rg {"void" "GuiLock"} {}
Unlock   ← ◌ Rg {"void" "GuiUnlock"} {}
IsLocked ← (Rg Ty!{Bool "GuiIsLocked"} {})

SetAlpha ← ◌ Rg {"void" "GuiSetAlpha" "float"} □₁

GetState ← (Rg {"int" "GuiGetState"} {})
SetState ← ◌ Rg {"void" "GuiSetState" "int"} □₁

GetFont ← (Rg Ty!{Font "GuiGetFont"} {})
SetFont ← Rg Ty!{"void" "GuiSetFont" Font} □₁

# styleId ? controlId propertyId
GetStyle ← Rg {"int" "GuiGetStyle" "int" "int"} □₂
# ? controlId propertyId value
SetStyle ← ◌Rg {"void" "GuiSetStyle" "int" "int" "int"} □₃

# ? file
LoadStyle        ← ◌ Rg Ty!{"void" "GuiLoadStyle" String} □₁
LoadStyleDefault ← ◌ Rg {"void" "GuiLoadStyleDefault"} {}

EnableTooltip  ← ◌ Rg {"void" "GuiEnableTooltip"} {}
DisableTooltip ← ◌ Rg {"void" "GuiDisableTooltip"} {}
SetTooltip     ← ◌ Rg Ty!{"void" "GuiSetTooltip" String} □₁

# Gets the text with iconId prepended, if possible
# text ? iconId text
IconText ← Rg Ty!{String "GuiIconText" "int" String} □₂

SetIconScale ← ◌ Rg {"void" "GuiSetIconScale" "int"} □₁

GetIcons ← (Rg Ty!{→"unsigned int" "GuiGetIcons"} {})

# icons ? file loadName
LoadIcons ← Rg Ty!{→→"char" "GuiLoadIcons" String Bool} □₂

# ? iconId x y size color
DrawIcon ← ◌ Rg Ty!{"void" "GuiDrawIcon" "int" "int" "int" "int" Color} □₅

# ? bounds title
WindowBox ← Rg Ty!{"int" "GuiWindowBox" Rect String} □₂

# ? bounds text
GroupBox ← Rg Ty!{"int" "GuiGroupBox" Rect String} □₂

# ? bounds text
Line ← Rg Ty!{"int" "GuiLine" Rect String} □₂

# ? bounds text
Panel ← Rg Ty!{"int" "GuiPanel" Rect String} □₂

# ? bounds tabNames active
TabBar ← °□₂ Rg Ty!{"int" "GuiTabBar" Rect $"_:2" String "int" →"int"} □₃

# ? bounds text content scroll view
ScrollPanel ← °□₃ Rg Ty!{"int" "GuiScrollPanel" Rect String Rect →V₂ →Rect} □₅

# ? bounds text
Label ← Rg Ty!{"int" "GuiLabel" Rect String} □₂

# clicked ? bounds text
Button ← Rg Ty!{"int" "GuiButton" Rect String} □₂

# ? bounds text
LabelButton ← Rg Ty!{"int" "GuiLabelButton" Rect String} □₂

# clicked active ? bounds text active
Toggle ← °□₂ Rg Ty!{"int" "GuiToggle" Rect String →Bool} □₃

# clicked active ? bounds text active
ToggleGroup ← °□₂ Rg Ty!{"int" "GuiToggleGroup" Rect String →"int"} □₃

# clicked active ? bounds text active
ToggleSlider ← °□₂ Rg Ty!{"int" "GuiToggleSlider" Rect String →"int"} □₃

# clicked checked ? bounds text checked
CheckBox ← °□₂ Rg Ty!{"int" "GuiCheckBox" Rect String →Bool} □₃

# clicked active ? bounds text active
ComboBox ← °□₂ Rg Ty!{"int" "GuiComboBox" Rect String →"int"} □₃

# clicked new ? bounds text current editable
DropdownBox ← °□₂ Rg Ty!{"int" "GuiComboBox" Rect String →"int" Bool} □₄

# clicked new ? bounds text current min max editable
Spinner ← °□₂ Rg Ty!{"int" "GuiSpinner" Rect String →"int" "int" "int" Bool} □₆

# clicked new ? bounds text current min max editable
ValueBox ← °□₂ Rg Ty!{"int" "GuiValueBox" Rect String →"int" "int" "int" Bool} □₆

# clicked textValue new ? bounds text textValue current editable
ValueBoxFloat ← °□₃ Rg Ty!{"int" "GuiValueBoxFloat" Rect String →"char" →"float" Bool} □₅

# return new ? bounds current textSize editable
TextBox ← °□₂ Rg Ty!{"int" "GuiTextBox" Rect →"char" "int" Bool} □₄

# clicked new ? bounds textLeft textRight current min max
Slider ← °□₂ Rg Ty!{"int" "GuiSlider" Rect String String →"float" "float" "float"} □₆

# clicked new ? bounds textLeft textRight current min max
SliderBar ← °□₂ Rg Ty!{"int" "GuiSliderBar" Rect String String →"float" "float" "float"} □₆

# clicked new ? bounds textLeft textRight current min max
ProgressBar ← °□₂ Rg Ty!{"int" "GuiProgressBar" Rect String String →"float" "float" "float"} □₆

# ? bounds text
StatusBar ← Rg Ty!{"int" "GuiStatusBar" Rect String} □₂

# ? bounds text
DummyRec ← Rg Ty!{"int" "GuiDummyRec" Rect String} □₂

# focused newCell ? bounds text spacing divisions currentCell
Grid ← °□₂ Rg Ty!{"int" "GuiGrid" Rect String "float" "int" →V₂} □₅

# focused newScroll newActive ? bounds text currentScroll currentActive
ListView ← °□₃ Rg Ty!{"int" "GuiListView" Rect String →"int" →"int"} □₄

# focused newScroll newActive newFocus ? bounds texts currentScroll currentActive currentFocus
ListViewEx ← °□₄ Rg Ty!{"int" "GuiListViewEx" Rect $"_:2" String "int" →"int" →"int" →"int"} □₅

# pressed ? bounds title message buttons
MessageBox ← Rg Ty!{"int" "GuiMessageBox" Rect String String String} □₄

# pressed new secret ? bounds title message buttons current maxSize secret
TextInputBox ← °□₃ Rg Ty!{"int" "GuiTextInputBox" Rect String String String →"char" "int" →Bool} □₇

# picked new ? bounds text current
ColorPicker ← °□₂ Rg Ty!{"int" "GuiColorPicker" Rect String →Color} □₃

# picked new ? bounds text current
ColorPanel ← °□₂ Rg Ty!{"int" "GuiColorPanel" Rect String →Color} □₃

# picked new ? bounds text current
ColorBarAlpha ← °□₂ Rg Ty!{"int" "GuiColorBarAlpha" Rect String →"float"} □₃

# picked new ? bounds text current
ColorBarHue ← °□₂ Rg Ty!{"int" "GuiColorBarHue" Rect String →"float"} □₃

# picked new ? bounds text current
ColorPickerHSV ← °□₂ Rg Ty!{"int" "GuiColorPickerHSV" Rect String →V₃} □₃

# picked new ? bounds text current
ColorPanelHSV ← °□₂ Rg Ty!{"int" "GuiColorPanelHSV" Rect String →V₃} □₃
