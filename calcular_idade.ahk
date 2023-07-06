birthday:
menu_close()
Gui, calc_idades: Destroy
Gui, calc_idades: Font, q5 S15 w700 cwhite
Gui, calc_idades: Color, 0x1e1e1e
Gui, calc_idades: Add, Text, Center w273, Digite as datas de nascimento, separado por linhas.
Gui, calc_idades: Add, Text, Center w273 cYellow, Formato da data:`n13/10/2020 (Dia/Mês/Ano)
Gui, calc_idades: Font, S10 w700 ck
Gui, calc_idades: Add, Edit, xm y+m w273 r20 vdatas,
Gui, calc_idades: Font, S15 w700 cwhite
Gui, calc_idades: Add, Button, xs gcalc_idades, Calcular
Gui, calc_idades: Add, Button, x+m gcalc_copiar, Copiar Idades
Gui, calc_idades: Show,, Calcular idades
Return

data_idades()
{
    Global
    Gui, calc_idades: Submit, Nohide
    eachdata := StrSplit(datas, "`n")
    birth := []
    Loop % eachdata.Length()
    {
        FormatTime, hoje_%A_index%, A_now, yyyyMMdd
        niver := StrSplit(eachdata[A_Index], "/")
        dia := niver[1]
        mes := niver[2]
        ano := niver[3]
        birth.push(niver[3] . niver[2] . niver[1])
        Envsub, hoje_%A_Index%, birth[A_index], days
        
        aniversario_msgbox .= eachdata[A_Index] " - " Floor((hoje_%A_Index% / 365,2425))  "`n"
     
        if (eachdata.Length() != A_Index)
            aniversario_separado .= Floor((hoje_%A_Index% / 365,2425)) "-"
        else
            aniversario_separado .= Floor((hoje_%A_Index% / 365,2425))
    }
    Clipboard :=
    Clipboard := aniversario_separado
    Clipwait,,1
}
return

clear_var()
{
    Global
    eachdata :=
    birth :=
    niver :=
    aniversario_msgbox :=
    aniversario_separado :=
}

calc_idades:
    clear_var()
    data_idades()
    MsgBox % aniversario_msgbox
return


calc_Copiar:
    clear_var()
    data_idades()
    Clipboard :=
    Clipboard := aniversario_msgbox
    Clipwait,,1
return

calc_idadesGuiEscape:
calc_idadesGuiClose:
Gui, calc_idades: Destroy
Return