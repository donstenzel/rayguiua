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
# - [x] add all the enums (Gui*)
#   - [x] State
#   - [x] TextAlignment
#   - [x] TextAlignmentVertical
#   - [x] TextWrapMode
#   - [x] Control
#   - [x] ControlProperty
#   - [x] DefaultProperty
#   - [x] ToggleProperty
#   - [x] SliderProperty
#   - [x] ProgressBarProperty
#   - [x] ScrollBarProperty
#   - [x] CheckBoxProperty
#   - [x] ComboBoxProperty
#   - [x] DropdownBoxProperty
#   - [x] TextBoxProperty
#   - [x] ValueBoxProperty
#   - [x] ListViewProperty
#   - [x] ColorPickerProperty

┌─╴State
  |Normal
  |Focused
  |Pressed
  |Disabled
└─╴

┌─╴Text
  ┌─╴Align
    |Left
    |Center
    |Right

    ┌─╴Vertical
      |Top
      |Middle
      |Bottom
    └─╴
  └─╴

  ┌─╴Wrap
    |None
    |Char
    |Word
  └─╴
└─╴

┌─╴Control
  |Default
  |Label
  |Button
  |Toggle
  |Slider
  |ProgressBar
  |CheckBox
  |ComboBox
  |DropdownBox
  |TextBox
  |ValueBox
  |Control₁₁
  |ListView
  |ColorPicker
  |ScrollBar
  |StatusBar

  # N → in normal state
  # F → in focused state
  # P → in pressed state
  # D → in disabled state
  ┌─╴Property
    |BorderColorN
    |BaseColorN
    |TextColorN
    |BorderColorF
    |BaseColorF
    |TextColorF
    |BorderColorP
    |BaseColorP
    |TextColorP
    |BorderColorD
    |BaseColorD
    |TextColorD
    |BorderWidth
    |TextPadding
    |TextAlignment
  └─╴

  ┌─╴Default
    TextSize              ← 16
    TextSpacing           ← 17
    LineColor             ← 18
    BackgroundColor       ← 19
    TextLineSpacing       ← 20
    TextAlignmentVertical ← 21
    TextWrapMode          ← 22
  └─╴
└─╴

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

Icons ~ "icons.ua"
┌─╴Icon
  RawData ← (Rg Ty!{→"unsigned int" "GuiGetIcons"} {})

  SetScale ← ◌ Rg {"void" "GuiSetIconScale" "int"} □₁

  # Gets the text with iconId prepended, if possible
  # text ? iconId text
  Text ← Rg Ty!{String "GuiIconText" "int" String} □₂

  # icons ? file loadName
  Load ← Rg Ty!{→→"char" "GuiLoadIcons" String Bool} □₂

  # ? iconId x y size color
  Draw ← ◌ Rg Ty!{"void" "GuiDrawIcon" "int" "int" "int" "int" Color} □₅
└─╴

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

┌─╴ScrollPanel
  # ? bounds text content scroll view
  Call ← °□₃ Rg Ty!{"int" "GuiScrollPanel" Rect String Rect →V₂ →Rect} □₅

  ┌─╴P
    ArrowSize     ← 16
    ArrowVisible  ← 17
    SliderPadding ← 18
    SliderSize    ← 19
    Padding       ← 20
    Speed         ← 21
  └─╴
└─╴

# state ? bounds text
Label ← Rg Ty!{"int" "GuiLabel" Rect String} □₂

# clicked ? bounds text
Button ← Rg Ty!{"int" "GuiButton" Rect String} □₂

# clicked ? bounds text
LabelButton ← Rg Ty!{"int" "GuiLabelButton" Rect String} □₂

┌─╴Toggle
  # clicked active ? bounds text active
  Call ← °□₂ Rg Ty!{"int" "GuiToggle" Rect String →Bool} □₃

  # clicked active ? bounds text active
  Group ← °□₂ Rg Ty!{"int" "GuiToggleGroup" Rect String →"int"} □₃

  # clicked active ? bounds text active
  Slider ← °□₂ Rg Ty!{"int" "GuiToggleSlider" Rect String →"int"} □₃

  ┌─╴P
    GroupPadding ← 16
  └─╴
└─╴

┌─╴CheckBox
  # clicked checked ? bounds text checked
  Call ← °□₂ Rg Ty!{"int" "GuiCheckBox" Rect String →Bool} □₃

  ┌─╴P
    Padding ← 16
  └─╴
└─╴

┌─╴ComboBox
  # clicked active ? bounds text active
  ComboBox ← °□₂ Rg Ty!{"int" "GuiComboBox" Rect String →"int"} □₃

  ┌─╴P
    ButtonWidth   ← 16
    ButtonSpacing ← 17
  └─╴
└─╴

┌─╴DropdownBox
  # clicked new ? bounds text current editable
  Call ← °□₂ Rg Ty!{"int" "GuiComboBox" Rect String →"int" Bool} □₄

  ┌─╴P
    Padding     ← 16
    ItemSpacing ← 17
    ArrowHidden ← 18
    RollUp      ← 19
  └─╴
└─╴

┌─╴Box
  # return new ? bounds current maxLen editable
  Text ← °□₂ Rg Ty!{"int" "GuiTextBox" Rect →"char" "int" Bool} □₄

  ┌─╴Value
    # clicked new ? bounds text current min max editable
    Call ← °□₂ Rg Ty!{"int" "GuiValueBox" Rect String →"int" "int" "int" Bool} □₆

    # clicked textValue new ? bounds text textValue current editable
    Float ← °□₃ Rg Ty!{"int" "GuiValueBoxFloat" Rect String →"char" →"float" Bool} □₅

    ┌─╴P
      ButtonWidth   ← 16
      ButtonSpacing ← 17
    └─╴
  └─╴

  # clicked new ? bounds text current min max editable
  Spinner ← °□₂ Rg Ty!{"int" "GuiSpinner" Rect String →"int" "int" "int" Bool} □₆

  ┌─╴P
    ReadOnly ← 16
  └─╴
└─╴

┌─╴Slider
  # clicked new ? bounds textLeft textRight current min max
  Call ← °□₂ Rg Ty!{"int" "GuiSlider" Rect String String →"float" "float" "float"} □₆

  # clicked new ? bounds textLeft textRight current min max
  Bar ← °□₂ Rg Ty!{"int" "GuiSliderBar" Rect String String →"float" "float" "float"} □₆

  ┌─╴P
    Width   ← 16
    Padding ← 17
  └─╴
└─╴

┌─╴ProgressBar
  # clicked new ? bounds textLeft textRight current min max
  Call ← °□₂ Rg Ty!{"int" "GuiProgressBar" Rect String String →"float" "float" "float"} □₆

  ┌─╴P
    Padding ← 16
  └─╴
└─╴

# ? bounds text
StatusBar ← Rg Ty!{"int" "GuiStatusBar" Rect String} □₂

# ? bounds text
DummyRec ← Rg Ty!{"int" "GuiDummyRec" Rect String} □₂

# focused newCell ? bounds text spacing divisions currentCell
Grid ← °□₂ Rg Ty!{"int" "GuiGrid" Rect String "float" "int" →V₂} □₅

┌─╴ListView
  # focused newScroll newActive ? bounds text currentScroll currentActive
  Call ← °□₃ Rg Ty!{"int" "GuiListView" Rect String →"int" →"int"} □₄

  # focused newScroll newActive newFocus ? bounds texts currentScroll currentActive currentFocus
  Extended ← °□₄ Rg Ty!{"int" "GuiListViewEx" Rect $"_:2" String "int" →"int" →"int" →"int"} □₅

  ┌─╴P
    ItemHeight      ← 16
    ItemSpacing     ← 17
    ScrollBarWidth  ← 18
    ScrollBarSide   ← 19
    ItemBorderN     ← 20 # 0 = left, 1 = right
    ItemBorderWidth ← 21
  └─╴
└─╴

┌─╴Popup
  # pressed ? bounds title message buttons
  Call ← Rg Ty!{"int" "GuiMessageBox" Rect String String String} □₄

  # pressed new secret ? bounds title message buttons current maxSize secret
  Input ← °□₃ Rg Ty!{"int" "GuiTextInputBox" Rect String String String →"char" "int" →Bool} □₇
└─╴

┌─╴Color
  ┌─╴Picker
    # picked new ? bounds text current
    Call ← °□₂ Rg Ty!{"int" "GuiColorPicker" Rect String →Color} □₃

    # picked new ? bounds text current
    HSV ← °□₂ Rg Ty!{"int" "GuiColorPickerHSV" Rect String →V₃} □₃

    ┌─╴P
      SelectorSize     ← 16
      HueBarWidth      ← 17
      HueBarPadding    ← 18
      SelectorHeight   ← 19
      SelectorOverflow ← 20
    └─╴
  └─╴

  ┌─╴Panel
    # picked new ? bounds text current
    Call ← °□₂ Rg Ty!{"int" "GuiColorPanel" Rect String →Color} □₃

    # picked new ? bounds text current
    HSV ← °□₂ Rg Ty!{"int" "GuiColorPanelHSV" Rect String →V₃} □₃
  └─╴

  ┌─╴Bar
    # picked new ? bounds text current
    Alpha ← °□₂ Rg Ty!{"int" "GuiColorBarAlpha" Rect String →"float"} □₃

    # picked new ? bounds text current
    Hue ← °□₂ Rg Ty!{"int" "GuiColorBarHue" Rect String →"float"} □₃
  └─╴
└─╴
