#NoEnv
#SingleInstance, Force

#Include <Gdip_All>
#Include <Rufaydium>

SetBatchLines, -1

Run atualização.exe

#1::
    open := !open
    if (open)
        goto main
    else if (!open)
        Gui, main: Destroy
return

; Main Gui
    main:
        title := ["00 a 18","19 a 23","24 a 28","29 a 33","34 a 38","39 a 43","44 a 48","49 a 53","54 a 58","59 ou +","Adesão","Mensalidade"]
        mainw := A_ScreenWidth * 0.8
        mainh := A_ScreenHeight * 0.8
        conth := mainh / 30
        font_size  := (mainh / 30)/2
        title_size := font_size*2
        Hotkey, ~LButton, Off

        OnMessage(0x201, "WM_LBUTTONDOWN")
    
        Gui, main: New
        Gui, main: -DPIScale -Sysmenu -Caption
        Gui, main: Color, 0x2C2C2C, 0x3f3f3f
        Gui, main: Margin, 0, 0
        ; Barra de Titulo    
        Gui, main: Font, cWhite s%title_size% w1000 q5
        Gui, main: Add, Text,     % "x" mainw - title_size - 5 " y0 h" conth*2 "            +BackgroundTrans Center 0x200 gmainfechar", X
        Gui, main: Add, Text,     % "x5                          y0 h" conth*2 "            +BackgroundTrans Center 0x200 gmenu_main", ≡
        Gui, main: Add, Progress, % "x0                          y0 h" conth*2 " w" mainw " +Background0x3c4b7d vtitlebar_main",
        Gui, main: Add, Text,     % "xp                          yp h" conth*2 " w" mainw " +BackgroundTrans Center 0x200 ", Kaizen Benefícios
        Gui, main: Add, Text,     % "x" mainw - title_size - 5 " yp hp                      +BackgroundTrans Center 0x200 gmainfechar", X
        Gui, main: Add, Text,     % "x5                          yp hp                      +BackgroundTrans Center 0x200 gmenu_main", ≡
        ; Campo de idades
        Gui, main: Font, cWhite s%font_size% w1000 q5
        Gui, main: Add, Text  , % "x0  y+" conth/2 " w" mainw * 0.1 " h" conth " Right"                               , Idades%A_Space%
        Gui, main: Add, Edit  , % "x+m               w" mainw * 0.8 " h" conth " -E0x200 Border -VScroll gmain_vars vidadestotal",
        Gui, main: Add, Button, % "x+m               w" mainw * 0.1 " h" conth " -E0x200 gcalcular_idades +Default"   , Calcular
        ; Barra de Titulos dos campos
        Gui, main: Add, Progress, % "x0 y+" conth/2 " w" mainw              " h" conth "           +Background0x252e4d",
        Gui, main: Add, Text,     % "xp yp            w" mainw * 0.15       " h" conth " Center 0x200 +BackgroundTrans", Faixas
        Gui, main: Add, Text,     % "x+0              w" mainw * 0.1        " h" conth " Center 0x200 +BackgroundTrans",
        Gui, main: Add, Text,     % "x+0              w" mainw * 0.1        " h" conth " Center 0x200 +BackgroundTrans", Valor
        Gui, main: Add, Text,     % "x+5              w" (mainw * 0.65) - 5 " h" conth " Center 0x200 +BackgroundTrans", Detalhes do plano Selecionado
        ; Faixas etárias - Qntd por Faixa Etária
        Loop 12 {
            Gui, main: Add, Text  , % "x0 y+m w" mainw * 0.15 " h" conth " Center 0x200 vfaixa" A_Index , % title[A_Index]
            Gui, main: Add, Edit  , % "x+0    w" mainw * 0.1  " h" conth " Center -E0x200 Border gmain_calc_in vedhide" A_Index,
            Gui, main: Add, UpDown, % "                                    Wrap range0-1000 gmain_calc_in vmain_idade" A_Index,                                                                , 
            Gui, main: Add, Edit  , % "x+0    w" mainw * 0.1  " h" conth " Center +ReadOnly -TabStop -E0x200 Border vcampo1_" A_Index, R$ 0,00
        }

        GuiControlGet, yis, main: Pos, faixa1
        Gui, main: Add, Edit,     % "x+5 y" yisy " w" (mainw * 0.65) - 5 " h" conth*12 " vmain_descr ReadOnly -VScroll",

        Gui, main: Font,          % "cWhite s" font_size + 8 " w1000 q5"
        Gui, main: Add, Progress, % "x0    w" mainw " h" conth*2 "              Background0x252e4d"
        Gui, main: Add, Text,     % "xp yp w" mainw " h" conth*2 " Center 0x200 BackgroundTrans vindicador" , Nenhum Plano Selecionado

        Gui, main: Font, cWhite s%font_size% w1000 q5

        Gui, main: Add, ListBox, % "x0 y+m w" mainw/3 " h" conth*8 " voperadora gmain_switch_operadora  -E0x200 Border 0x100", Santa Casa CA|Santa Casa PME|Sermed|Sermed PME|Benevida CA|Benevida PME|Benevida GM|Oeste Saúde
        Gui, main: Add, ListBox, % "x+m    w" mainw/3 " h" conth*8 " vplano     gmain_switch_operadora2 -E0x200 Border 0x100",
        Gui, main: Add, ListBox, % "x+m    w" mainw/3 " h" conth*8 " vplano2    gmain_vars              -E0x200 Border 0x100",
        
        Gui, main: Add, Button, % "x0  y+" conth/2 " w" mainw/5 " h" conth*2 " gmain_enviar venviar_proposta", Enviar Proposta
        ; Gui, main: Add, Button, % "x+m               w" mainw/5 " h" conth*2 " gcomparador                  ", Comparador

        GuiControl, main: Hide,  main_idade11
        GuiControl, main: Hide,  main_idade12
        GuiControl, main: Hide,  edhide11
        GuiControl, main: Hide,  edhide12
        GuiControl, main: Focus, idadestotal

        Gui, main: Show, % "xCenter yCenter w" mainw " h" mainh , Kaizen Benefícios
        SetTimer, habilitar_envio, 100
    return
    mainfechar:
        open := !open
        Gui, main: Destroy
    return
    calcular_idades:
        Gui, main: Submit, Nohide
        loop 10
            GuiControl, Main:, main_idade%A_Index%, % "-" main_idade%A_Index%

        Guicontrolget, idadestotal, main:            ; Pegar idades do campo de idades
        devolveridades := StrSplit(idadestotal, "-") ; Dividir as idades digitadas usando o "-" de separação

        loop % devolveridades.Length()
            if (devolveridades[A_Index] >= 0 and devolveridades[A_Index] <= 18)
                idadeconta_1++
            else if (devolveridades[A_Index] >= 19 and devolveridades[A_Index] <= 23)
                idadeconta_2++
            else if (devolveridades[A_Index] >= 24 and devolveridades[A_Index] <= 28)
                idadeconta_3++
            else if (devolveridades[A_Index] >= 29 and devolveridades[A_Index] <= 33)
                idadeconta_4++
            else if (devolveridades[A_Index] >= 34 and devolveridades[A_Index] <= 38)
                idadeconta_5++
            else if (devolveridades[A_Index] >= 39 and devolveridades[A_Index] <= 43)
                idadeconta_6++
            else if (devolveridades[A_Index] >= 44 and devolveridades[A_Index] <= 48)
                idadeconta_7++
            else if (devolveridades[A_Index] >= 49 and devolveridades[A_Index] <= 53)
                idadeconta_8++
            else if (devolveridades[A_Index] >= 54 and devolveridades[A_Index] <= 58)
                idadeconta_9++
            else if (devolveridades[A_Index] >= 59)
                idadeconta_10++

            Loop 10
                Guicontrol, Main:, main_idade%A_Index%, % "+" idadeconta_%A_Index%

        Sort, idadestotal, N D-
        formataridades := StrSplit(idadestotal, "-")

        loop % formataridades.Length() {
            If (formataridades.Length() = 1) {
                formatada := formataridades[A_Index]
                break
            }
            Else If (formataridades.Length() = 2) {
                formatada := formataridades[1] "-" formataridades[2]
                break
            }
            Else {
                if (A_Index = formataridades.Length())
                    formatada .= formataridades[A_Index]
                else
                    formatada .= formataridades[A_Index] "-"
            }
        }
        Guicontrol, main: Text, idadestotal, % formatada

        loop 10 {
            idadeconta_%A_Index% := 0
        }
        devolveridades :=
        formatada :=
    Return
    main_calc_in:
        Gui, main: Submit, Nohide
        totalidades :=
        main_adesao :=
        main_mensalidade :=
        
        loop 10
            GuiControl, main:, campo1_%A_Index%, % "R$ " StrReplace(Round(main_idade%A_Index% * valores(dados1,A_Index),2),".",",")

        Loop 10 {
            if (operadora = "Santa Casa CA" and plano != "")
                main_adesao += (main_idade%A_Index% * valores(dados1,A_Index))*0.99
            else if (operadora = "Santa Casa PME" and plano != "")
                main_adesao += (main_idade%A_Index% * valores(dados1,A_Index))/2
            else if (operadora = "Sermed" and plano2 = "Coletivo Adesão Standard" or plano2 = "Coletivo Adesão Executivo")
                main_adesao += (main_idade%A_Index% * valores(dados1,A_Index)) / 6 + (main_idade%A_Index% * valores(dados1,A_Index))
            else if (operadora = "Benevida CA" and plano != "")
                main_adesao += (main_idade%A_Index% * valores(dados1,A_Index)) / 6 + (main_idade%A_Index% * valores(dados1,A_Index))
            else if (operadora = "Benevida GM" and plano = "Coletivo Adesão com Copart Standard" or plano = "Coletivo Adesão com Copart Executivo")
                main_adesao += (main_idade%A_Index% * valores(dados1,A_Index)) / 6 + (main_idade%A_Index% * valores(dados1,A_Index))
            else if (operadora = "Benevida GM" and plano = "PME com Copart Standard" or plano = "PME com Copart Executivo")
                main_adesao += 0
            else if (operadora = "Sermed PME" or operadora = "Benevida PME")
                main_adesao += 0
            else if (operadora = "Oeste Saúde" and plano = "Coletivo Adesão com Copart")
                main_adesao += (main_idade%A_Index% * valores(dados1,A_Index)) / 6 + (main_idade%A_Index% * valores(dados1,A_Index))
            else if (operadora = "Oeste Saúde" and plano = "PME com Copart")
                main_adesao += 0
            else 
                main_adesao += main_idade%A_Index% * valores(dados1,A_Index)
            main_mensalidade += main_idade%A_Index% * valores(dados1,A_Index)
        }

        GuiControl, main:, campo1_11, % "R$ " StrReplace(Round(main_adesao,2),".",",")
        GuiControl, main:, campo1_12, % "R$ " StrReplace(Round(main_mensalidade,2),".",",")
        preencher_campos()
    return
    main_switch_operadora:
        Gui, main: Submit, Nohide
        if (operadora = "Santa Casa CA") {
            Guicontrol, main: , plano , |Controle Enfermaria|Controle Apartamento|Standard|Executivo
            Guicontrol, main: , plano2, |
        }
        if (operadora = "Santa Casa PME") {
            Guicontrol, main: , plano , |Controle Enfermaria|Controle Apartamento|Standard|Executivo
            Guicontrol, main: , plano2, |
        }
        if (operadora = "Sermed") {
            Guicontrol, main: , plano, |Union Hospitalar|Union Completo|Medida Certa
            Guicontrol, main: , plano2, |
        }
        if (operadora = "Sermed PME") {
            Guicontrol, main: , plano, |Union Hospitalar|Union Completo|Medida Certa|Tradicional
            Guicontrol, main: , plano2, |
        }
        if (operadora = "Benevida CA") {
            Guicontrol, main: , plano , |Standard com Copart|Executivo com Copart|Standard sem Copart|Executivo sem Copart
            Guicontrol, main: , plano2, |
        }
        if (operadora = "Benevida PME") {
            Guicontrol, main: , plano , |Standard com Copart|Executivo com Copart|Standard sem Copart|Executivo sem Copart
            Guicontrol, main: , plano2, |
        }
        if (operadora = "Benevida GM") {
            Guicontrol, main: , plano , |Coletivo Adesão com Copart Standard|Coletivo Adesão com Copart Executivo|PME com Copart Standard|PME com Copart Executivo
            Guicontrol, main: , plano2, |
        }
        if (operadora = "Oeste Saúde") {
            Guicontrol, main: , plano , |Coletivo Adesão com Copart|PME com Copart
            Guicontrol, main: , plano2, |
        }
        Gosub main_vars
    return
    main_switch_operadora2:
        Gui, main: Submit, Nohide
        if (operadora = "Sermed" and plano = "Union Hospitalar" or plano = "Union Completo" or plano = "Medida Certa")
            Guicontrol, main: ,plano2, |Pessoa Física Standard|Pessoa Física Executivo|Coletivo Adesão Standard|Coletivo Adesão Executivo
        if (operadora = "Sermed PME" and plano = "Union Hospitalar")
            Guicontrol, main: ,plano2, |Standard|Executivo
        if (operadora = "Sermed PME" and plano = "Union Completo")
            Guicontrol, main: ,plano2, |Até 29 vidas Standard|Até 29 vidas Executivo|30 vidas + Standard|30 vidas + Executivo
        if (operadora = "Sermed PME" and plano = "Medida Certa")
            Guicontrol, main: ,plano2, |Até 29 vidas Com Copart Standard|Até 29 vidas Com Copart Executivo|30 vidas + Com Copart Standard|30 vidas + Com Copart Executivo
        if (operadora = "Sermed PME" and plano = "Tradicional")
            Guicontrol, main: ,plano2, |Até 29 vidas Sem Copart Standard|Até 29 vidas Sem Copart Executivo|30 vidas + Sem Copart Standard|30 vidas + Sem Copart Executivo
        if (operadora = "Oeste Saúde" and plano = "Coletivo Adesão com Copart" or plano = "PME com Copart")
            Guicontrol, main: ,plano2, |Presidente Prudente|Adamantina|Dracena|Presidente Epitácio
        Gosub main_vars
    return
    main_vars:
        Gui, main: Submit, Nohide
        if (operadora = "Santa Casa CA") 
            in_oper1 := "sc_ca_",        dados2_oper := "Santa Casa ", main_assoc := 5, main_assoc_ades := 0
        else if (operadora = "Santa Casa PME")
            in_oper1 := "sc_pme_",       dados2_oper := "Santa Casa ", main_assoc := 0, main_assoc_ades := 0
        else if (operadora = "Sermed")
            in_oper1 := "sermed_",       dados2_oper := "Sermed ",     main_assoc := 4, main_assoc_ades := 4
        else if (operadora = "Sermed PME")
            in_oper1 := "sermed_pme_",   dados2_oper := "Sermed ",     main_assoc := 0, main_assoc_ades := 0
        else if (operadora = "Benevida CA")
            in_oper1 := "benevida_ca_",  dados2_oper := "Benevida ",   main_assoc := 4, main_assoc_ades := 4
        else if (operadora = "Benevida PME")
            in_oper1 := "benevida_pme_", dados2_oper := "Benevida ",   main_assoc := 0, main_assoc_ades := 0
        else if (operadora = "Benevida GM")
            in_oper1 := "benevida_gm_",  dados2_oper := "Benevida "
        else if (operadora = "Oeste Saúde")
            in_oper1 := "os_",           dados2_oper := "Oeste Saúde "

        ; Santa Casa
        if (plano = "Controle Enfermaria")
            1_plano := "controle_enfermaria",  dados2_plano1 := "Controle Enfermaria com Fator"
        else if (plano = "Controle Apartamento")
            1_plano := "controle_apartamento", dados2_plano1 := "Controle Apartamento com Fator"
        else if (plano = "Standard")
            1_plano := "standard",             dados2_plano1 := "Standard sem Fator"
        else if (plano = "Executivo")
            1_plano := "executivo",            dados2_plano1 := "Executivo sem Fator"
        ; Sermed
        else if (plano = "Union Hospitalar")
            1_plano := "union_hospitalar", dados2_plano1 := "Union Hospitalar "
        else if (plano = "Union Completo")
            1_plano := "union_completo",   dados2_plano1 := "Union "
        else if (plano = "Medida Certa")
            1_plano := "medida_certa",     dados2_plano1 := "Medida Certa "
        else if (plano = "Tradicional")
            1_plano := "tradicional",      dados2_plano1 := "Tradicional "
        ; Benevida
        else if (plano = "Standard com Copart")
            1_plano := "standard_com_copart",  dados2_plano1 := "Standard com Fator"
        else if (plano = "Executivo com Copart")
            1_plano := "executivo_com_copart", dados2_plano1 := "Executivo com Fator"
        else if (plano = "Standard sem Copart")
            1_plano := "standard_sem_copart",  dados2_plano1 := "Standard sem Fator"
        else if (plano = "Executivo sem Copart")
            1_plano := "executivo_sem_copart", dados2_plano1 := "Executivo sem Fator"
        ; Benevida GM
        else if (plano = "Coletivo Adesão com Copart Standard")
            1_plano := "ca_standard_com_copart",   dados2_plano1 := "Standard com Fator", main_assoc := 4, main_assoc_ades := 4
        else if (plano = "Coletivo Adesão com Copart Executivo")
            1_plano := "ca_executivo_com_copart",  dados2_plano1 := "Executivo com Fator", main_assoc := 4, main_assoc_ades := 4
        else if (plano = "PME com Copart Standard")
            1_plano := "pme_standard_com_copart",  dados2_plano1 := "Standard com Fator", , main_assoc := 0, main_assoc_ades := 4
        else if (plano = "PME com Copart Executivo")
            1_plano := "pme_executivo_com_copart", dados2_plano1 := "Executivo sem Fator", , main_assoc := 0, main_assoc_ades := 4
        ; Oeste Saúde
        else if (plano = "Coletivo Adesão com Copart")
            1_plano := "ca",  dados2_plano1 := "com Fator", main_assoc := 4, main_assoc_ades := 4
        else if (plano = "PME com Copart")
            1_plano := "pme", dados2_plano1 := "com Fator", main_assoc := 0, main_assoc_ades := 0

        ; Sermed e Sermed PME Union Hospitalar
        if (plano2 = "Pessoa Física Standard")
            2_plano := "_pessoa_fisica_standard",        dados2_plano2 := "Standard com Fator",  main_assoc := 0, main_assoc_ades := 0
        else if (plano2 = "Pessoa Física Executivo")
        2_plano := "_pessoa_fisica_executivo",           dados2_plano2 := "Executivo com Fator", main_assoc := 0, main_assoc_ades := 0
        else if (plano2 = "Coletivo Adesão Standard")
            2_plano := "_coletivo_por_adesao_standard",  dados2_plano2 := "Standard com Fator"
        else if (plano2 = "Coletivo Adesão Executivo")
            2_plano := "_coletivo_por_adesao_executivo", dados2_plano2 := "Executivo com Fator"
        else if (plano2 = "Standard")
            2_plano := "_standard",                      dados2_plano2 := "Standard com Fator",  main_assoc := 0, main_assoc_ades := 0
        else if (plano2 = "Executivo")
            2_plano := "_executivo",                     dados2_plano2 := "Executivo com Fator", main_assoc := 0, main_assoc_ades := 0
        ; Sermed PME Union Completo
        else if (plano2 = "Até 29 vidas Standard")
            2_plano := "_29_standard", dados2_plano2 := "Standard com Fator",   main_assoc := 0, main_assoc_ades := 0
        else if (plano2 = "Até 29 vidas Executivo")
            2_plano := "_29_executivo", dados2_plano2 := "Executivo com Fator", main_assoc := 0, main_assoc_ades := 0
        else if (plano2 = "30 vidas + Standard")
            2_plano := "_30_standard", dados2_plano2 := "Standard com Fator",   main_assoc := 0, main_assoc_ades := 0
        else if (plano2 = "30 vidas + Executivo")
            2_plano := "_30_executivo", dados2_plano2 := "Executivo com Fator", main_assoc := 0, main_assoc_ades := 0
        ; Sermed PME Medida Certa e Tradicional
        else if (plano2 = "Até 29 vidas Sem Copart Standard")
            2_plano := "_29_sem_copart_standard",  dados2_plano2 := "Standard sem Fator",  main_assoc := 0, main_assoc_ades := 0
        else if (plano2 = "Até 29 vidas Sem Copart Executivo")
            2_plano := "_29_sem_copart_executivo", dados2_plano2 := "Executivo sem Fator", main_assoc := 0, main_assoc_ades := 0
        else if (plano2 = "30 vidas + Sem Copart Standard")
            2_plano := "_30_sem_copart_standard",  dados2_plano2 := "Standard sem Fator",  main_assoc := 0, main_assoc_ades := 0
        else if (plano2 = "30 vidas + Sem Copart Executivo")
            2_plano := "_30_sem_copart_executivo", dados2_plano2 := "Executivo sem Fator", main_assoc := 0, main_assoc_ades := 0
        else if (plano2 = "Até 29 vidas Com Copart Standard")
            2_plano := "_29_com_copart_standard",  dados2_plano2 := "Standard com Fator",  main_assoc := 0, main_assoc_ades := 0
        else if (plano2 = "Até 29 vidas Com Copart Executivo")
            2_plano := "_29_com_copart_executivo", dados2_plano2 := "Executivo com Fator", main_assoc := 0, main_assoc_ades := 0
        else if (plano2 = "30 vidas + Com Copart Standard")
            2_plano := "_30_com_copart_standard",  dados2_plano2 := "Standard com Fator",  main_assoc := 0, main_assoc_ades := 0
        else if (plano2 = "30 vidas + Com Copart Executivo")
            2_plano := "_30_com_copart_executivo", dados2_plano2 := "Executivo com Fator", main_assoc := 0, main_assoc_ades := 0

        if (A_GuiControl = "operadora") {
            1_plano :=
            2_plano :=
            dados2_plano1 :=
            dados2_plano2 :=
            dados1 := in_oper1
            dados2 := dados2_oper
            ind := operadora
        }
        else if (A_GuiControl = "plano") {
            2_plano :=
            dados2_plano2 :=
            dados1 := in_oper1 1_plano
            dados2 := dados2_oper dados2_plano1
            ind := operadora " " plano
        }
        else if (A_GuiControl = "plano2") {
            dados1 := in_oper1 1_plano 2_plano
            dados2 := dados2_oper dados2_plano1 dados2_plano2
            ind := operadora " " plano " " plano2
        }
        gosub main_calc_in
    return
    habilitar_envio:
        Gui, main: Submit, Nohide
        if (operadora = "") {
            GuiControl, main: Disable, enviar_proposta
            exit
        }
        if (operadora = "Santa Casa CA" or operadora = "Santa Casa PME" or operadora = "Benevida CA" or operadora = "Benevida PME" or operadora = "Benevida GM" ) {
            if (plano = "") {
                GuiControl, main: Disable, enviar_proposta
                exit
            }
        }
        if (operadora = "Sermed" or operadora = "Sermed PME" or operadora = "Oeste Saúde"){
            If (plano2 = "") {
                GuiControl, main: Disable, enviar_proposta
                exit
            }
        }
        GuiControl, main: Enable, enviar_proposta
    return
; Envios
    main_enviar:
        Gui, main: Submit
        ; Verificar se informações foram colocadas
        if (main_idade1 = 0 and main_idade2 = 0 and main_idade3 = 0 and main_idade4 = 0 and main_idade5 = 0 and main_idade6 = 0 and main_idade7 = 0 and main_idade8 = 0 and main_idade9 = 0 and main_idade10 = 0){ 
            MsgBox, 0x1030, Informação Faltante, Nenhuma idade foi adicionada no campo das faixas de idades.
            exit
        }
        if (idadestotal = ""){
            MsgBox, 0x1030, Informação Faltante, Nenhuma idade foi adicionada ao campo de idades.
            exit
        }
        MsgBox, 262193, Selecionar Janela , Selecione a janela que irá enviar a proposta e clique em Ok.
        IfMsgBox, Cancel
            Exit

        GuiControlGet, valor_final, main:, main_descr
        WinActivate, "A"
        if (operadora = "Santa Casa CA" or operadora = "Santa Casa PME"){
            texto(santacasa("introducao_santacasa"))
            imagem("Santa Casa\fachada.png")
            imagem("Santa Casa\centroclinico.png")
            imagem("Santa Casa\telemedicina.jpg")
            texto(santacasa("estruturas_laboratoriais"))
            imagem("Santa Casa\cepac.png")
            imagem("Santa Casa\SC Bio Nuclear.png")
            imagem("Santa Casa\ir.png")
            imagem("Santa Casa\SC DIAP.png")		
            texto(santacasa("atendimento_nacional"))
            imagem("Santa Casa\abramge.png")
            if (plano = "Controle Enfermaria" or plano = "Controle Apartamento")
                imagem("Santa Casa\coberturas.jpg")
            texto(santacasa("coberturasmed"))
            if (plano = "Controle Enfermaria" or plano = "Controle Apartamento")
                texto(santacasa("coberturasod"))
            texto("*Redução de Carências 👇*")
            imagem("Santa Casa\carencia_ca.png")
            texto(valor_final)
            if (plano = "Controle Enfermaria" or plano = "Controle Apartamento")
                texto(santacasa("copart_controle"))
            texto("A seguir, vou lhe enviar um áudio detalhando as informações acima ok!")
            return
        }
        else if (operadora = "Sermed" or operadora = "Sermed PME"){
            if (plano = "Union Hospitalar"){
                texto(sermed("union_hospitalar_estruturas_hospitalar"))
				imagem("Sermed\Hospital Sao Lucas Ribeirania.jpg")
				imagem("Sermed\Sermed Coberturas.png")
				texto(sermed("union_hospitalar_carencias"))
				texto(valor_final)
				texto("A seguir, vou lhe enviar um áudio detalhando as informações acima ok!")
            }
            else if (plano = "Union Completo"){
                texto(sermed("union_estrutura_hospitalar"))
				imagem("Sermed\Hospital Sao Lucas Ribeirania.jpg")					
				imagem("Sermed\Maternidade Sinha Junqueira.png")					
				imagem("Sermed\Hospital Santa Lydia.png")					
				imagem("Sermed\Hospital Santa Casa Sertaozinho.png")					
				imagem("Sermed\Hospital Sao Lucas 2.png")					
				texto(sermed("union_estrutura_laboratoriais"))
				imagem("Sermed\Sabin.png")
				imagem("Sermed\Hospital Sao Lucas 2.png")
				imagem("Sermed\Humberto de Queiroz.png")
				texto(sermed("union_estrutura_medica"))
				imagem("Sermed\Sermed Saude.png")
				texto(sermed("union_estrutura_medica2"))
				texto(sermed("telemedicina"))
				imagem("Sermed\Sermed_telemedicina.jpg")
				texto(sermed("abramgetxt"))
				imagem("Sermed\abramge.png")
				texto(sermed("assistmed"))
				texto("*Redução de Carências* 👇")
				imagem("Sermed\Carencias.png")
				texto(valor_final)
				texto(sermed("union_copart"))
				texto("A seguir, vou lhe enviar um áudio detalhando as informações acima ok!")
            }
            else if (plano = "Medida Certa" or plano = "Tradicional"){
                texto(sermed("medida_certa_estrutura_hospitalar"))
				imagem("Sermed\Hospital Sao Lucas 2.png")					
				imagem("Sermed\Hospital Sao Lucas Ribeirania.jpg")					
				imagem("Sermed\Maternidade Sinha Junqueira.png")
				imagem("Benevida Imagens\Hospital Nova Bene.png")
				imagem("Santa Casa\fachada.png") ; Santa Casa
				imagem("Sermed\Hospital Santa Lydia.png")					
				imagem("Sermed\Hospital Santa Casa Sertaozinho.png")					
				texto(sermed("medida_certa_estrutura_laboratoriais"))
				imagem("Sermed\Sabin.png")
				imagem("Sermed\Hospital Sao Lucas 2.png")
				imagem("Sermed\Humberto de Queiroz.png")
				imagem("Sermed\laboratorio behring.png")
				imagem("Sermed\Baracchini.jpg")
				imagem("Santa Casa\cepac.png")
				texto(sermed("medida_certa_estrutura_medica"))
				imagem("Sermed\Sermed Saude.png")
				texto(sermed("telemedicina"))
				imagem("Sermed\Sermed_telemedicina.jpg")
				texto(sermed("abramgetxt"))
				imagem("Sermed\abramge.png")
				texto(sermed("assistmed"))
				texto("*Redução de Carências* 👇")
				imagem("Sermed\Carencias.png")
				texto(valor_final)
                if (plano = "Medida Certa")
				    texto(sermed("medida_certa_copart"))
				texto("A seguir, vou lhe enviar um áudio detalhando as informações acima ok!")
            }
        }
        else if (operadora = "Benevida CA" or operadora = "Benevida PME"){
            texto(benevida("estruturashospitalares"))
            imagem("Benevida Imagens\Hospital Nova Bene.png")
            imagem("Benevida Imagens\PAAP.png")
            imagem("Benevida Imagens\Hospital Electro Bonini.png")
            imagem("Benevida Imagens\Hospital São Lucas Ribeirania.png")
            imagem("Benevida Imagens\Atendimento Pediatrico.png")
            texto(benevida("estruturaslaboratoriais"))
            imagem("Benevida Imagens\DIAP.png")
            imagem("Benevida Imagens\IMERV.png")
            imagem("Benevida Imagens\Instituto da Visão.png")
            imagem("Benevida Imagens\Hermodinamica.png")
            texto(benevida("redecredenciada"))
            imagem("Benevida Imagens\rede credenciada.jpg")
            imagem("Benevida Imagens\Medclin.png")
            imagem("Benevida Imagens\telemedicina.jpg")
            texto(benevida("atendimentourgencia"))
            imagem("Benevida Imagens\cmb.png")
            texto(benevida("coberturas"))
            texto("*Redução de Carências* 👇")
            imagem("Benevida Imagens\benecarencias.png")
            texto(valor_final)
            if (plano = "Standard com Copart" or plano = "Executivo com Copart")
                texto(benevida("copartca"))
            texto("A seguir, vou lhe enviar um áudio detalhando as informações acima ok!")
        }
        else if (operadora = "Benevida GM"){
            texto(benevida_gm("estruturashospitalares"))
            imagem("Benevida\Hospital Nova Bene.png")
            imagem("Benevida\PAAP.png")
            imagem("Benevida\Hospital Electro Bonini.png")
            imagem("Benevida\Hospital São Lucas Ribeirania.png")
            imagem("Benevida\Santa_Casa_Guariba.jpg")
            imagem("Benevida\Atendimento Pediatrico.png")
            texto(benevida_gm("estruturaslaboratoriais"))
            imagem("Benevida\DIAP.png")
            imagem("Benevida\IMERV.png")
            imagem("Benevida\Instituto da Visão.png")
            imagem("Benevida\Hermodinamica.png")
            texto(benevida_gm("redecredenciada"))
            imagem("Benevida\rede credenciada.jpg")
            imagem("Benevida\Medclin.png")
            imagem("Benevida\centro_bem_estar.jpg")
            texto("*Telemedicina: - 24 horas por dia*`n400 profissionais 24 horas por dia para atendimento")
            imagem("Benevida\telemedicina.jpg")
            texto(benevida_gm("atendimentourgencia"))
            imagem("Benevida\cmb.png")
            texto(benevida_gm("coberturas"))
            texto("*Redução de Carências* 👇")
            imagem("Benevida\benecarencias.png")
            texto(valor_final)
            texto(benevida_gm("copart"))
            texto("A seguir, vou lhe enviar um áudio detalhando as informações acima.")
        }
        else if (operadora = "Oeste Saúde"){
            texto(oestesaude("estruturas_hospitalares", plano2))
            imagem("Oeste Saúde\01-Santa Casa de Misericórdia.jpg")
            imagem("Oeste Saúde\02-Hospital Iamada.jpg")
            imagem("Oeste Saúde\03-Hospital e Maternidade Nossa Senhora das Graças.jpg")
            texto(oestesaude("estruturas_laboratoriais_ac", plano2))
            imagem("Oeste Saúde\Lab2-Laboratório de Análises Clínicas Unoeste (Apec).jpg")
            imagem("Oeste Saúde\Lab - Laboratório de Análises Clínicas Marlene Spir.jpg")
            imagem("Oeste Saúde\Lab1-Centro de Análises Clínicas - Unilab.jpg")
            texto(oestesaude("estruturas_laboratoriais_di", plano2))
            imagem("Oeste Saúde\Diag1 - Cadri - Centro Avançado de Radiologia.jpg")
            imagem("Oeste Saúde\Diag2-Instituto de Radiologia de Presidente Prudente.jpg")
            imagem("Oeste Saúde\Diag3-Med Rad - Serviço de Radiologia e Ultrassonografia.jpg")
            texto(oestesaude("unidades_fisioterapia", plano2))
            imagem("Oeste Saúde\Fisio1 - Clínica de Ortopedia e Fraturas.png")
            if (plano2 = "Presidente Prudente"){
                texto(oestesaude("institutos_especializados"))
                imagem("Oeste Saúde\Espec1 - Instituto do Coração.jpg")
                imagem("Oeste Saúde\Espec2 - Instituto RH - Hematologia Hemoterapia.jpg")
            }
            texto(oestesaude("rede_credenciada"))
            if (plano2 = "Presidente Prudente")
                imagem("Oeste Saúde\CM_4.jpg")
            else if (plano2 = "Adamantina")
                imagem("Oeste Saúde\CM_1.jpg")
            else if (plano2 = "Dracena")
                imagem("Oeste Saúde\CM_2.jpg")
            else if (plano2 = "Presidente Epitácio")
                imagem("Oeste Saúde\CM_3.jpg")
            imagem("Oeste Saúde\Cred2 - Telemedicina.jpg")
            imagem("Oeste Saúde\abrangência.png")
            texto("**Em todas as cidades citadas acima os contratantes terão atendimento rotineiro.*")
            texto(oestesaude("abramge"))
            imagem("Sermed\abramge.png")
            texto(oestesaude("abramge_cobertura"))
            texto("Redução de Carências 👇")
            imagem("Oeste Saúde\carências.png")
            texto(valor_final)
            texto(oestesaude("copart"))
            texto("A seguir, vou lhe enviar um áudio detalhando as informações acima ok!")
        }

        valor_final :=
        operadora :=
        plano := 
        plano2 := 
        open := !open
    return
; Funções
    menu_close(){
        Global
        Gui, menu: Destroy
        menu_ := !menu_
        Hotkey, ~LButton, Off
    }
    WM_LBUTTONDOWN() {
        CoordMode, Mouse, Client
        MouseGetPos, , yipis
        if (yipis < A_ScreenHeight * 0.8 / 30 * 2)
            PostMessage, 0xA1, 2
    }
    organizar_idades(idades) {
        Sort, idades, N D-
        sep_idades := StrSplit(StrReplace(idades, A_Space), "-")

        loop % sep_idades.Count() {
            If (sep_idades.Count() = 1) {
                res_idades := sep_idades[A_Index] " anos"
                break
            }
            else if (sep_idades.Count() = 2) {
                res_idades := sep_idades[1] " e " sep_idades[2] " anos"
                break
            }
            else {
                If (A_Index = sep_idades.Count() - 1)
                    res_idades .= sep_idades[A_Index] " e "
                else If (A_Index = sep_idades.Count())
                    res_idades .= sep_idades[A_Index] " anos"
                else
                    res_idades .= sep_idades[A_Index] ", "
            } 
        }
        return res_idades
    }
    preencher_campos(){
        Global
        Gui, main: Submit, Nohide
        GuiControlGet, main_adesao_final, main:, campo1_11
        GuiControlGet, main_mensalidade_final, main:, campo1_12

        total_idades := StrSplit(idadestotal, "-")

        #LTrim, On
        valores_texto1 := "
        (
            Valores:
            
            *" dados2 "*
            
            " total_idades.count() " pessoas: " organizar_idades(idadestotal) "
            
            Taxa de Adesão:
            *R$ " StrReplace(Round(main_adesao + main_assoc_ades,2),".",",") "*
            
            Mensalidade:
            *R$ " StrReplace(Round(main_mensalidade + main_assoc,2),".",",") "*
        )"
        valores_texto2 := "
        (
            Valores:
            
            *" dados2 "*
            
            " total_idades.count() " pessoas: " organizar_idades(idadestotal) "
            
            Seis (06) Primeiras Mensalidades:
            *R$ " StrReplace(Round(main_adesao + main_assoc_ades,2),".",",") "*
            
            Mensalidade:
            *R$ " StrReplace(Round(main_mensalidade + main_assoc,2),".",",") "*
        )"
        valores_texto3 := "
        (
            Valores:
            
            *" dados2 "*
            
            " total_idades.count() " pessoas: " organizar_idades(idadestotal) "
            
            Mensalidade:
            *R$ " StrReplace(Round(main_mensalidade + main_assoc,2),".",",") "*
        )"
        valores_texto4 := "
        (
            Valores:
            
            *" dados2 "*
            
            " total_idades.count() " pessoas: " organizar_idades(idadestotal) "

           *Promoção:*
           
           Mensalidades (Agosto e Setembro 2023):
           *R$ " StrReplace(Round(25 *  total_idades.count() + 4, 2),".",",") "*
           
           Entre Setembro 2023 e Fevereiro 2024
           *R$ " StrReplace(Round(main_adesao + main_assoc_ades,2),".",",") "*
           
           A partir de então:
           *R$ " StrReplace(Round(main_mensalidade + main_assoc,2),".",",") "*
        )"
        #LTrim, Off

        if (operadora = "Santa Casa CA")
            GuiControl, main:, main_descr, % valores_texto1
        else if (operadora = "Santa Casa PME")
            GuiControl, main:, main_descr, % valores_texto1
        else if (operadora = "Sermed")
            GuiControl, main:, main_descr, % valores_texto1
        else if (operadora = "Sermed PME")
            GuiControl, main:, main_descr, % valores_texto3
        else if (operadora = "Benevida CA")
            GuiControl, main:, main_descr, % valores_texto2
        else if (operadora = "Benevida PME")
            GuiControl, main:, main_descr, % valores_texto3
        else if (operadora = "Benevida GM")
            GuiControl, main:, main_descr, % valores_texto1
        else if (operadora = "Oeste Saúde")
            GuiControl, main:, main_descr, % valores_texto1

        ; Santa Casa
        if (plano = "Controle Enfermaria")
            GuiControl, main:, main_descr, % valores_texto1
        else if (plano = "Controle Apartamento")
            GuiControl, main:, main_descr, % valores_texto1
        else if (plano = "Standard")
            GuiControl, main:, main_descr, % valores_texto1
        else if (plano = "Executivo")
            GuiControl, main:, main_descr, % valores_texto1
        ; Sermed
        else if (plano = "Union Hospitalar")
            GuiControl, main:, main_descr, % valores_texto1
        else if (plano = "Union Completo")
            GuiControl, main:, main_descr, % valores_texto1
        else if (plano = "Medida Certa")
            GuiControl, main:, main_descr, % valores_texto1
        else if (plano = "Tradicional")
            GuiControl, main:, main_descr, % valores_texto1
        ; Benevida
        else if (plano = "Standard com Copart")
            GuiControl, main:, main_descr, % valores_texto1
        else if (plano = "Executivo com Copart")
            GuiControl, main:, main_descr, % valores_texto1
        else if (plano = "Standard sem Copart")
            GuiControl, main:, main_descr, % valores_texto1
        else if (plano = "Executivo sem Copart")
            GuiControl, main:, main_descr, % valores_texto1
        ; Benevida GM
        else if (plano = "Coletivo Adesão com Copart Standard")
            GuiControl, main:, main_descr, % valores_texto2
        else if (plano = "Coletivo Adesão com Copart Executivo")
            GuiControl, main:, main_descr, % valores_texto2
        else if (plano = "PME com Copart Standard")
            GuiControl, main:, main_descr, % valores_texto3
        else if (plano = "PME com Copart Executivo")
            GuiControl, main:, main_descr, % valores_texto3
        ; Oeste Saúde
        else if (plano = "Coletivo Adesão com Copart")
            GuiControl, main:, main_descr, % valores_texto4
        else if (plano = "PME com Copart")
            GuiControl, main:, main_descr, % valores_texto3

        ; Sermed e Sermed PME Union Hospitalar
        if (plano2 = "Pessoa Física Standard")
            GuiControl, main:, main_descr, % valores_texto1
        else if (plano2 = "Pessoa Física Executivo")
            GuiControl, main:, main_descr, % valores_texto1
        else if (plano2 = "Coletivo Adesão Standard")
            GuiControl, main:, main_descr, % valores_texto2
        else if (plano2 = "Coletivo Adesão Executivo")
            GuiControl, main:, main_descr, % valores_texto2
        else if (plano2 = "Standard")
            GuiControl, main:, main_descr, % valores_texto3
        else if (plano2 = "Executivo")
            GuiControl, main:, main_descr, % valores_texto3
        ; Sermed PME Union Completo
        else if (plano2 = "Até 29 vidas Standard")
            GuiControl, main:, main_descr, % valores_texto3
        else if (plano2 = "Até 29 vidas Executivo")
            GuiControl, main:, main_descr, % valores_texto3
        else if (plano2 = "30 vidas + Standard")
            GuiControl, main:, main_descr, % valores_texto3
        else if (plano2 = "30 vidas + Executivo")
            GuiControl, main:, main_descr, % valores_texto3
        ; Sermed PME Medida Certa e Tradicional
        else if (plano2 = "Até 29 vidas Sem Copart Standard")
            GuiControl, main:, main_descr, % valores_texto3
        else if (plano2 = "Até 29 vidas Sem Copart Executivo")
            GuiControl, main:, main_descr, % valores_texto3
        else if (plano2 = "30 vidas + Sem Copart Standard")
            GuiControl, main:, main_descr, % valores_texto3
        else if (plano2 = "30 vidas + Sem Copart Executivo")
            GuiControl, main:, main_descr, % valores_texto3
        else if (plano2 = "Até 29 vidas Com Copart Standard")
            GuiControl, main:, main_descr, % valores_texto3
        else if (plano2 = "Até 29 vidas Com Copart Executivo")
            GuiControl, main:, main_descr, % valores_texto3
        else if (plano2 = "30 vidas + Com Copart Standard")
            GuiControl, main:, main_descr, % valores_texto3
        else if (plano2 = "30 vidas + Com Copart Executivo")
            GuiControl, main:, main_descr, % valores_texto3

        GuiControl, main:, indicador, % ind
    }
    imagem(imagem) {
        Global
        pToken := Gdip_Startup()
        Gdip_SetBitmapToClipboard(pBitmap := Gdip_CreateBitmapFromFile(imagem))
        Gdip_DisposeImage(pBitmap)
        Gdip_Shutdown(pToken)
        Send, ^v
        Sleep, 2000
        Send, {Enter}
        Sleep, 2000
    }
    texto(texto) {
        Clipboard :=
        Clipboard := texto
        ClipWait,,1
        SendInput, ^v
        Sleep, 500
        SendInput {Enter}
        Clipboard :=
        Sleep, 1000
    }
    santacasa(var){
       #Ltrim 
        sc_estruturas_laboratoriais =
        (
            ✓ Estruturas Laboratoriais

            *• Laboratório de Análises Clínicas:*

                💉 SEPAC 
                💉 Laboratório BioNuclear

            *Laboratórios de Exames / Imagem:*

                🎥 IR - Instituto de Radiologia
                🎥 DIAP - Diagnóstico por imagem de Alta Performance
        )
        sc_copart_controle := " 
        (
            Consultas eletivas e pronto atendimento - *R$25,00*
            
            Exames simples - *R$3,00*
            
            Exames especiais - *R$50,00*
            
            Cirurgias e Internações Hospitalares:
            👉 *Custo Zero*

            Procedimentos odontológicos:
            👉 *Custo Zero*
        )"
        sc_coberturasmed = 
        (
            ✓ *Assistência Médicas:*

            - Urgências, Emergências
            - Acidentes Pessoais

            *Consultas Médicas:*

            - Todas as Especialidades

            *Exames de:*

            - Baixa Complexidade
            - Média Complexidade
            - Alta Complexidade

            Cirurgias + 
            Internações Hospitalares 

            *Tratamentos:*

            - Fisioterapia
            - Câncer
            - Aids
            - Diálise
            - Hemodiálise
            - Cirurgias Plásticas (Reparadoras)

            *Terapias:*

            - Psicologia
            - Acupuntura
            - Fonoaudiologia
            - Nutricionista
        )
        sc_coberturasod = 
        (
            ✓ *Assistência Odontológica:*

            - Urgências e Emergências
            - Consultas
            - Odontopediatria
            - Radiologia (inclusive Panorâmica)
            - Prevenção (limpeza, aplicação de flúor)
            - Cirurgias (extração de dentes)
            - Dentistica (restaurações)
            - Endodontia (tratamento de canal)
            - Periodontia (tratamento de Gengiva
            - Prótese
        )
        sc_introducao_santacasa =
        (
            ✓ *Estrutura Hospitalar:*

            🏥 Santa Casa Saúde

            ✓ *Consultas Eletivas:*

            👩‍ Centro Clínico Santa Casa

            🥼 Consultórios Credenciados

            🧑‍🔬 *TeleMedicina (Novo)*
        )
        sc_atendimento_nacional =
        (
            ✓ Atendimento Nacional:

            - Urgências e Emergências em todo território Nacional através da Abramge:

            Associação Brasileira de Medicina de Grupo.

            🚑 Resgate Inter Hospitalar
        )
        #LTrim, Off
        return sc_%var%
    }
    sermed(var){
		#LTrim, On
		sermed_union_copart := "
		(
			*Co Participação:*

			✓ *Consultas Médicas:*
			Unidade Sermed:
			👉 *Custo Zero*

			✓ *Consultas Médicas:*
			Consultórios Credenciados
			👉 R$ 24,00

			✓ *Pronto Atendimento:*
			👉 R$ 29,00

			✓ *Exames:*
			👉 De R$ 2,58 até R$ 105,23

			✓ *Cirurgias e Internações Hospitalares*
			👉 Custo Zero 
		)"
		sermed_telemedicina := "*Telemedicina: 24 horas por dia* 👇👇👇"
		sermed_abramgetxt :=
		(
			"✓ *Atendimento Nacional:*

			- Urgências e Emergências em todo território Nacional através da Abramge:

			Associação Brasileira de Medicina de Grupo.

			🚑 Resgate Inter Hospitalar"
		)
		sermed_assistmed := "
		(
			*Coberturas:*

			*✓ Assistência Médica:*

			- Urgências e Emergências
			- Acidentes Pessoais

			Consultas Médicas:

			- Todas as Especialidades

			Exames de:

			- Baixa Complexidade
			- Média Complexidade
			- Alta Complexidade

			Cirurgias + 
			Internações Hospitalares 

			Tratamentos:

			- Fisioterapia
			- Câncer
			- Aids
			- Diálise
			- Hemodiálise
			- Cirurgias Plásticas (Reparadoras)

			Terapias:

			- Psicologia
			- Acupuntura
			- Fonoaudiologia
			- Nutricionista
		)"
		sermed_union_estrutura_hospitalar := "
		(
			✓ *Estruturas Hospitalares:*

			🏥 Hospital São Lucas Ribeirânia
			🏥 Maternidade Sinhá Junqueira
			🏥 Hospital Santa Lydia
			🏥 Santa Casa Sertãozinho
			🏥 Hospital São Lucas
		)"
		sermed_union_estrutura_laboratoriais := "
		(
			✓ *Estruturas Laboratoriais:*

			🏥 Sabin Medicina Diagnóstica
			🏥 Med Medicina Diagnóstica por Imagem
			🏥 Laboratório Humberto de Queiroz
			🏥 Ser Imagem - Sertãozinho
		)"
		sermed_union_estrutura_medica := "
		(
			✓ *Estrutura Consultas Médicas:*

			🏥 Unidade Sermed Ribeirão Preto:

			Especialidades Básicas:

			✓ Clínica Médica
			✓ Ginecologia
			✓ Pediatria
			✓ Ortopedia
			✓ Oftalmologia
			✓ Geriatria
		)"
		sermed_union_estrutura_medica2 := "
		(
			✓ *Estrutura Consultas Médicas:*

			Demais Especialidades:

			🏥 Consultórios Médicos Credenciados

			Após encaminhamento das especialidades básicas
		)"
		sermed_union_hospitalar_carencias := "
		(
			*Carências:*

			Urgências, Emergências + Acidentes Pessoais
			*24 horas* após a vigência do contrato

			Cirurgias e Internações Hospitalares
			*180 dias*

			Parto:
			*300 dias*

			Doenças e Lesões Pré Existentes
			*720 dias*
		)"
		sermed_union_hospitalar_estruturas_hospitalar := "
		(
			✓ *Estruturas Hospitalares:*

			🏥 Hospital São Lucas Ribeirânia
		)"
		sermed_medida_certa_estrutura_medica := "
		(
			✓ *Estrutura Consultas Médicas:*

			🏥 Rede Credenciada de Consultórios - livre acesso

			🏥 Unidade Sermed Ribeirão Preto - livre acesso
		)"
		sermed_medida_certa_estrutura_hospitalar := "
		(
			✓ *Estruturas Hospitalares:*

			🏥 Hospital São Lucas
			🏥 Hospital São Lucas Ribeirânia
			🏥 Maternidade Sinhá Junqueira
			🏥 Hospital Nova Bene
			🏥 Santa Casa de Ribeirão Preto
			🏥 Hospital Santa Lydia
			🏥 Santa Casa Sertãozinho
		)"
		sermed_medida_certa_estrutura_laboratoriais := "
		(
			✓ *Estruturas Laboratoriais:*

			🏥 Sabin Medicina Diagnóstica
			🏥 Med Medicina Diagnóstica por Imagem
			🏥 Laboratório Humberto de Queiroz
			🏥 Laboratório Behring
			🏥 Laboratório Baracchini
			🏥 Laboratório SEPAC
			🏥 RD Laboratório
			🏥 Ser Imagem - Sertãozinho
		)"
		sermed_medida_certa_copart := "
		(
			*Co Participação:*

			✓ *Consultas Médicas:*
			👉 R$ 24,00

            ✓ *Pronto Atendimento:*
			👉 R$ 29,00

			✓ *Exames:*
			👉 De R$ 1,98 até R$ 105,23

			✓ *Cirurgias e Internações Hospitalares*
			👉 Custo Zero 
		)"
		#LTrim, off
		return sermed_%var%
	}
    benevida(var){
        #LTrim, On
        bene_coberturas = 
        (
        ✓ *Coberturas*

            • Atendimento de urgências, emergências, acidentes pessoais.

            • Consultas Médicas, exames de baixa, média e alta complexidade, cirurgias e internações hospitalares.

            • Tratamentos, diálise, hemodiálise, câncer, aids, transplantes de rins, córnea e cirurgias plásticas desde que reparadoras.

            • Terapias, fonoaudiólogo, nutricionista, psicólogo e acupuntura.
        )
        bene_estruturashospitalares =
        (
        ✓ *Estruturas Hospitalares*

            • Hospital Nova Bene

            • Hospital São Lucas Ribeirânia
            Pediatria - 24 hrs

            • PAAP / Ribeirão Shopping
            Atendimento Pediátrico

            • Hospital Electro Bonini / Unaerp
            Maternidade (Alto Risco)
        )
        bene_estruturaslaboratoriais =
        (
        ✓ *Estruturas Laboratoriais*

            • *Benelab*
            Exames Laboratoriais

            • *Instituto da Visão*
            Oftalmologia

            • *MEDCLIN*
            Análises Clínicas

            • *DIAP*
            Exames de Diagnóstico por Imagem

            • *IMERV*
            Instituto de Radiologia e Mega Voltagem (Quimio e Radioterapia)

            • *AUDIOGRAMA*
            Clínica de Fonoaudiologia

            • *HEMODINÂMICA*
            Cardiologia Intervencionista
        )
        bene_redecredenciada =
        (
        ✓ *Rede Credenciada*

            • Rede Credenciada de Consultórios – livre opção de escolha

            • Medclin – Clínica de Especialidades – livre opção de escolha

            • Telemedicina - 24 horas por dia
        )
        bene_atendimentourgencia =
        (
        ✓ *Atendimento Urgência e Emergência Nacional*

            •CMB - Confederação das Santas Casas de Misericórdia, Hospitais e Entidades Filantrópicas
        )
        bene_copartca =
        (
            *Consultas Eletivas e Pronto Atendimento:*
            R$ 25,00

            *Exames:*
            De R$ 5,00 a R$ 40,00

            *Cirurgias e Internações:*
            *Custo Zero*
        )
        #LTrim, Off
        return bene_%var%
    }
    benevida_gm(var) {
        #Ltrim
        bene_gm_estruturashospitalares := "
        (
            *Grupo de Municípios - Ribeirão Preto, Guariba, Brodowski e Jardinópolis*
    
            ✓ *Estruturas Hospitalares*
    
                *► Ribeirão Preto:*
                     • Hospital Nova Bene
    
                     • Hospital São Lucas Ribeirânia
                     Pediatria - 24 hrs
    
                     • PAAP / Ribeirão Shopping
                     Atendimento Pediátrico
    
                     • Hospital Electro Bonini / Unaerp
                     Maternidade (Alto Risco)
                
                *► Guariba:*
                     • Nova Santa Casa de Guariba
        )"
        bene_gm_hospitalnovabene := "Benevida Imagens\Hospital Nova Bene.png"
        bene_gm_paap := "Benevida Imagens\PAAP.png"
        bene_gm_hospitalelectrobonini := "Benevida Imagens\Hospital Electro Bonini.png"
        bene_gm_hospitalsaolucasribeirania := "Benevida Imagens\Hospital São Lucas Ribeirania.png"
        bene_gm_atendimentopediatrico := "Benevida Imagens\Atendimento Pediatrico.png"
        bene_gm_estruturaslaboratoriais := "
        (
            ✓ *Estruturas Laboratoriais*
    
            *► Ribeirão Preto:*
                • *Benelab*
                Exames Laboratoriais
    
                • *Instituto da Visão*
                Oftalmologia
    
                • *MEDCLIN*
                Análises Clínicas
    
                • *DIAP*
                Exames de Diagnóstico por Imagem
    
                • *IMERV*
                Instituto de Radiologia e Mega Voltagem (Quimio e Radioterapia)
    
                • *AUDIOGRAMA*
                Clínica de Fonoaudiologia
    
                • *HEMODINÂMICA*
                Cardiologia Intervencionista
            
            *► Guariba:*
                • *MEDCLIN de Guariba*
                Análises Clínicas
    
            *► Brodowski:*
                • *THO Mais Saúde*
                Patologia Clínica e Medicina Laboral
        )"
        bene_gm_diap := "Benevida Imagens\DIAP.png"
        bene_gm_imerv := "Benevida Imagens\IMERV.png"
        bene_gm_institutodavisao := "Benevida Imagens\Instituto da Visão.png"
        bene_gm_hemodinamica := "Benevida Imagens\Hermodinamica.png"
        bene_gm_redecredenciada := "
        (
            ✓ *Rede Credenciada*
                *► Ribeirão Preto:*
                    • Rede Credenciada de Consultórios - livre opção de escolha
    
                    • Medclin - Clínica de Especialidades - livre opção de escolha
    
                *► Guariba:*
                    • Medclin Guariba - Clínica de Especialidades - livre opção de escolha
                
                *► Brodowski:*
                    • Clínica Médica Brodowski - Clínica de Especialidades - livre opção de escolha
                
                *► Jardinópolis:*
                    • Centro Bem Estar - Clínica de Especialidades - livre opção de escolha
        )"
        bene_gm_medclinguariba := "Benevida Imagens\medclin_guariba.jpg"
        bene_gm_redecredenciadadeconsultorio := "Benevida Imagens\rede credenciada.jpg"
        bene_gm_medclin := "Benevida Imagens\Medclin.png"
        bene_gm_telemedicina := "Benevida Imagens\telemedicina.jpg"
        bene_gm_atendimentourgencia := "
        (
            ✓ *Atendimento Urgência e Emergência Nacional*
    
                " A_Tab "• CMB - Confederação das Santas Casas de Misericórdia, Hospitais e Entidades Filantrópicas
        )"
        bene_gm_cmb := "Benevida Imagens\cmb.png"
        bene_gm_coberturas := "
        (
            ✓ *Coberturas*
    
                " A_Tab "• Atendimento de urgências, emergências, acidentes pessoais.
    
                " A_Tab "• Consultas Médicas, exames de baixa, média e alta complexidade, cirurgias e internações hospitalares.
    
                " A_Tab "• Tratamentos, diálise, hemodiálise, câncer, aids, transplantes de rins, córnea e cirurgias plásticas desde que reparadoras.
    
                " A_Tab "• Terapias, fonoaudiólogo, nutricionista, psicólogo e acupuntura.
        )"
        bene_gm_carencias := "Benevida Imagens\benecarencias.png"
        bene_gm_copart := "
        (
            *Consultas Eletivas e Pronto Atendimento:*
            R$ 25,00
    
            *Exames:*
            De R$ 5,00 a R$ 40,00
    
            *Cirurgias e Internações:*
            *Custo Zero*
        )"
        bene_gm_santa_casa_guariba := "Benevida Imagens\Santa_Casa_Guariba.jpg"
        bene_gm_centro_bem_estar := "Benevida Imagens\centro_bem_estar.jpg"
        return bene_gm_%var%
    }
    oestesaude(var, plano := "") {
        #LTrim, On
        os_estruturas_hospitalares := ""
           os_estruturas_hospitalares .= "*✓ Estruturas Hospitalares:*`n`n"
           if (plano = "Adamantina")
              os_estruturas_hospitalares .= "→ Santa Casa de Misericórdia de Adamantina`n`n"
           else if (plano = "Dracena")
              os_estruturas_hospitalares .= "→ Santa Casa de Misericórdia e Maternidade de Dracena`n`n"
           else if (plano = "Presidente Epitácio")
              os_estruturas_hospitalares .= "→ Santa Casa de Presidente Epitácio`n`n"
           os_estruturas_hospitalares .= "→ Santa Casa de Misericórdia Presidente Prudente`n"
           os_estruturas_hospitalares .= "→ Hospital Iamada`n"
           os_estruturas_hospitalares .= "→ Hospital e Maternidade Nossa Senhora das Graças`n"
           os_estruturas_hospitalares .= "→ Hospital Bezerra de Menezes`n"
           os_estruturas_hospitalares .= "→ Centro de Fraturas São Lucas`n"
           os_estruturas_hospitalares .= "→ Hospital de Olhos Oeste Paulista - Cepar"
           
        os_estruturas_laboratoriais_ac := ""
           os_estruturas_laboratoriais_ac .= "*✓ Estruturas Laboratoriais - Análises Clínicas:*`n`n"
           if (plano = "Adamantina") {
              os_estruturas_laboratoriais_ac .= "*• Adamantina*`n"
              os_estruturas_laboratoriais_ac .= "→ Labiol - Laboratório de Análises Clínicas - Alta Paulista`n"
              os_estruturas_laboratoriais_ac .= "→ Laboratório de Análises Clínicas São Paulo`n`n"
           }
           else if (plano = "Dracena") {
              os_estruturas_laboratoriais_ac .= "*• Dracena*`n"
              os_estruturas_laboratoriais_ac .= "→ Laboratório Trianon - Análises Clínicas`n"
              os_estruturas_laboratoriais_ac .= "→ São Lucas Laboratório de Dracena Ltda`n`n"
           }
           else if (plano = "Presidente Epitácio"){
              os_estruturas_laboratoriais_ac .= "*• Presidente Epitácio*`n"
              os_estruturas_laboratoriais_ac .= "→ Laboratório AC Roberto Shinhiti Nakata Ltda - Análises Clínicas`n"
              os_estruturas_laboratoriais_ac .= "→ Lacpe - Análises Clínicas`n"
              os_estruturas_laboratoriais_ac .= "→ Sanches Ricci Ltda - Análises Clínicas`n"
              os_estruturas_laboratoriais_ac .= "→ Laboratório de Análises Clínicas Exato`n"
              os_estruturas_laboratoriais_ac .= "→ Laboratório de Análises Clínicas - Ana Paula Duran`n`n"
           }
           os_estruturas_laboratoriais_ac .= "*• Presidente Prudente*`n"
           os_estruturas_laboratoriais_ac .= "→ Centro de Análises Clínicas - Unilab`n"
           os_estruturas_laboratoriais_ac .= "→ Exame Lab - Análises Clínicas`n"
           os_estruturas_laboratoriais_ac .= "→ Laboratório de Análises Clínicas Marlene Spir`n"
           os_estruturas_laboratoriais_ac .= "→ Laboratório de Análises Clínicas Unoeste (Apec)`n"
           os_estruturas_laboratoriais_ac .= "→ Laboratório Patologia Clínica Tiezzi`n"
           os_estruturas_laboratoriais_ac .= "→ Laboratório de Patologia e Citopatologia S/S`n"
           os_estruturas_laboratoriais_ac .= "→ Lacmen Medicina Nuclear `n"
           os_estruturas_laboratoriais_ac .= "→ Micromed - Anatomia Patológica e Citopato"
     
        os_estruturas_laboratoriais_di := ""
           os_estruturas_laboratoriais_di .= "*✓ Estruturas Laboratoriais - Diagnósticos por Imagem:*`n`n"
           if (plano = "Adamantina") {
              os_estruturas_laboratoriais_di .= "*• Adamantina*`n"
              os_estruturas_laboratoriais_di .= "→ Centro de Diagnóstico Imagem em Tomografia`n"
              os_estruturas_laboratoriais_di .= "→ Dia - Diagnóstico Imagem Avançada Ltda`n"
              os_estruturas_laboratoriais_di .= "→ Examina Diagnósticos Ltda`n"
              os_estruturas_laboratoriais_di .= "→ Centro de Diagnóstico Imagem`n`n"
           }
           else if (plano = "Dracena") {
              os_estruturas_laboratoriais_di .= "*• Dracena*`n"
              os_estruturas_laboratoriais_di .= "→ CDD - Centro de Diagnóstico de Dracena`n`n"
           }
           else if (plano = "Presidente Epitácio") {
              os_estruturas_laboratoriais_di .= "*• Presidente Epitácio*`n"
              os_estruturas_laboratoriais_di .= "→ Instituto de Radiologia Presidente Epitácio Ltda`n"
              os_estruturas_laboratoriais_di .= "→ Med Rad Diagnóstico por Imagem Ltda`n`n"
           }
           os_estruturas_laboratoriais_di .= "*• Presidente Prudente*`n"
           os_estruturas_laboratoriais_di .= "→ Cadri - Centro Avançado de Radiologia`n"
           os_estruturas_laboratoriais_di .= "→ Instituto de Radiologia de Presidente Prudente`n"
           os_estruturas_laboratoriais_di .= "→ Radiset`n"
           os_estruturas_laboratoriais_di .= "→ Med Rad - Serviço de Radiologia e Ultrassonografia`n"
           os_estruturas_laboratoriais_di .= "→ Clínica Médica Santa Helena - Eletroneuromiografia`n"
           os_estruturas_laboratoriais_di .= "→ Centro Prudentino de Oncologia`n"
           os_estruturas_laboratoriais_di .= "→ Clínica Onco Care Prudente"
     
        os_unidades_fisioterapia := ""
           os_unidades_fisioterapia := "*✓ Unidades de Fisioterapia:*`n`n"
           if (plano = "Adamantina") {
              os_unidades_fisioterapia .= "*• Adamantina*`n"
              os_unidades_fisioterapia .= "→ Fisio Clínica Granado Ltda`n`n"
           }
           else if (plano = "Dracena") {
              os_unidades_fisioterapia .= "*• Dracena*`n"
              os_unidades_fisioterapia .= "→ Center Fisico`n"
              os_unidades_fisioterapia .= "→ Clínica de Fisioterapia Querino`n`n"
           }
           else if (plano = "Presidente Epitácio") {
              os_unidades_fisioterapia .= "*• Presidente Epitácio*`n"
              os_unidades_fisioterapia .= "→ Clínica de Fisioterapia e Acupuntura Especi`n"
              os_unidades_fisioterapia .= "→ Instituto de Fisioterapia e Reabilitação Perin`n`n"
           }
           os_unidades_fisioterapia .= "*• Presidente Prudente*`n"
           os_unidades_fisioterapia .= "→ Clínica de Ortopedia e Fraturas`n"
           os_unidades_fisioterapia .= "→ Fisioclínica`n"
           os_unidades_fisioterapia .= "→ Phisycus - Clínica de Fisioterapia"
           
        os_institutos_especializados := "
        (
           *✓ Institutos Especializados: Presidente Prudente*
           
           → Instituto do Coração
           → Instituto do Rim
           → Instituto RH - Hematologia / Hemoterapia
        )"
        os_rede_credenciada := "
        (
           *✓ Rede Credenciada: Consultas Médicas*
           
           → Rede Credenciada de Consultórios - livre opção de escolha
           → Centro Médico de Especialidades Oeste Saúde - livre opção de escolha 
           → Telemedicina - 24 horas por dia
        )"
        os_abramge := "
        (
           *✓ Atendimento Urgência e Emergência Nacional: Abramge*
           
           → Urgências e Emergências em todo território Nacional através da Abramge:
           → Associação Brasileira de Medicina de Grupo.
           → Resgate Inter Hospitalar
        )"
        os_abramge_cobertura := "
        (
           *✓ Coberturas:*
           
           *Assistência Médica:*
           → Urgências e Emergências
           → Acidentes Pessoais
           
           Consultas Médicas:
           → Todas as Especialidades
           
           Exames de:
           → Baixa Complexidade
           → Média Complexidade
           → Alta Complexidade
           
           Cirurgias + Internações Hospitalares 
           
           Tratamentos:
           → Fisioterapia
           → Câncer
           → Aids
           → Diálise
           → Hemodiálise
           → Cirurgias Plásticas (Reparadoras)
           
           Terapias:
           → Psicologia
           → Acupuntura
           → Fonoaudiologia
           → Nutricionista
        )"
        os_copart := "
        (
           *✓ Coparticipação:*
           
           → Consulta em Consultório:
           R$ 29,90
           
           → Consulta em Pronto Socorro:
           R$ 41,25
           
           → Consulta Multidisciplinar:
           _(Psicólogo, Nutricionista, Terapia Ocupacional e Fonoaudiólogo)_
           R$ 10,80
     
           Exames:
           De R$ 0,90 a R$ 224,54
        )"
        #LTrim, Off
        return os_%var%
    }
; Menu GUI
    menu_main:
        menu_ := !menu_
        CoordMode, Mouse, Screen
        MouseGetPos, xis, yis
        if (menu_) {
            Gui, menu: New
            Gui, menu: -Caption -DPIScale SysMenu ToolWindow
            Gui, menu: Color, 0x2C2C2C, 0x3f3f3f
            Gui, menu: Font, s15 w1000 q5 cWhite, Segoe UI
            Gui, menu: margin, 5, 5
            govars := ["formularioca","formulariopme","adesao","prosp_","birthday","calc_imc","num_sus","agenda","agenda"]
            titvars := ["Formulário CA/PI","Formulário PME","Script Adesão","Criar Lead","Calcular Idades","Calcular IMC","Número SUS","Visital Empresarial","Atualizar"]
            
            Loop 9 {
                Gui, menu: Add, Progress, y+m w310 +Background0x3c4b7d Disabled
                Gui, menu: Add, Text, % "xp yp wp hp BackgroundTrans Center g" govars[A_Index], % titvars[A_Index]
            }

            Gui, menu: Show, % "x" xis - 20 " y" yis - 20 " ", Menu_
            Hotkey, ~LButton, On
        }
        else if (!menu_) {
            Gui, menu: Destroy
        }
    return
    ~LButton::
        MouseGetPos, , , get_menu_state,,1
        winget, janela_menu, ID, Menu_
        if (janela_menu != get_menu_state){
            Gui, menu: Destroy
            menu_ := !menu_
            Hotkey, ~LButton, Off
        }
    return
    main_atualizar:
        Gui, main: Submit
        MsgBox, 262144, Aguarde, Ao apertar "Ok" irá fazer o download na nova atualização e será instalado automaticamente. Aguarde...
        UrlDownloadToFile, https://www.dropbox.com/s/hdfw9ycvalua6g8/Setup.exe?dl=1, setup.exe
        RunWait, setup.exe
    Return
    
#Include d:\Desktop\Automações\Kaizen 4.0\comparador.ahk
#Include d:\Desktop\Automações\Kaizen 4.0\Agenda.ahk
#Include d:\Desktop\Automações\Kaizen 4.0\criar lead.ahk
#Include d:\Desktop\Automações\Kaizen 4.0\formularioca.ahk
#Include d:\Desktop\Automações\Kaizen 4.0\formulariopme.ahk
#Include d:\Desktop\Automações\Kaizen 4.0\script_adesao.ahk
#Include d:\Desktop\Automações\Kaizen 4.0\calcular_idade.ahk
#Include d:\Desktop\Automações\Kaizen 4.0\calcular_imc.ahk
#Include d:\Desktop\Automações\Kaizen 4.0\sus.ahk
