calc_imc:
menu_close()
Gui, imc: Destroy
Gui, imc: Font, q5 S15 w700 cwhite
Gui, imc: Color, 0x1e1e1e

Gui, imc: Add, Text,, Peso
Gui, imc: Add, Text,, Altura

Gui, imc: Font, q5 s10 w700 ck
Gui, imc: Add, Edit, ys -WantReturn vpeso,
Gui, imc: Add, Edit, -WantReturn valtura,
Gui, imc: Font, q5 S15 w700 cwhite

Gui, imc: Add, Button, xs gimccalc +Default  , Calcular  

Gui, imc: Show,, Calcular IMC
return

imccalc:
Gui, imc: Submit, Nohide
peso := StrReplace(peso, ",", ".")
altura := StrReplace(Altura, ",", ".")
imc := peso / (altura * altura)
Msgbox % round(imc,0)
return

imcGuiClose:
imcGuiEscape:
Gui, imc: Destroy
return

