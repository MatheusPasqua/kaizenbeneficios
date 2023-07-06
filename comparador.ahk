comparador:
    menu_close()
    WinGetPos toolbarx, toolbary, toolbarw, toolbarh, ahk_class Shell_TrayWnd

    title         := ["00 a 18","19 a 23","24 a 28","29 a 33","34 a 38","39 a 43","44 a 48","49 a 53","54 a 58","59 ou +","Total"]
    title2        := ["Plano 1","Plano 2","Diferença Mensal","Diferença Anual"]
    title_size    := (A_ScreenHeight - toolbarh) / 32
    font_size     := ((A_ScreenHeight - toolbarh) / 32) / 2
    controlheight := (A_ScreenHeight - toolbarh) / 32
    ScreenHeight  := (A_ScreenHeight - toolbarh) / 16

    Gui, comparador: New
    Gui, comparador: -DPIScale -Sysmenu -Caption
    Gui, comparador: Color , 0x2C2C2C, 0x3f3f3f
    Gui, comparador: Margin, 0, 0
    Gui, comparador: Font  , s%title_size% w1000 q5 cWhite
    ; Topo
    Gui, comparador: Add, Text,     % "x" A_ScreenWidth - title_size " y0 h" ScreenHeight*2 " gcomparadorfechar Right +backgroundtrans", X%A_Space%
    Gui, comparador: Add, Progress, % "x0 y0 w" A_ScreenWidth " h" ScreenHeight*2 " +Background0x193D6F",
    Gui, comparador: Add, Text,     % "x0 y0 w" A_ScreenWidth " h" ScreenHeight*2 " Center +backgroundtrans 0x200", Comparador de Preços
    Gui, comparador: Add, Progress, % "x0 y" ScreenHeight*2 - 1 " w" A_ScreenWidth " h1",
    Gui, comparador: Add, Text,     % "x" A_ScreenWidth - title_size " y0 h" ScreenHeight*2 " gcomparadorfechar Right +backgroundtrans", X%A_Space%

    ; Titulos e Campos de Idades
    Gui, comparador: Font,          % "s" font_size " w1000 q5 cWhite"
    Gui, comparador: Add, Progress, % "x0 y" ScreenHeight*2.5 " w" A_ScreenWidth " h" (ScreenHeight)/2 " +Background0x193D6F",
    Gui, comparador: Add, Text,     % "x0 y" ScreenHeight*2.5 " w" A_ScreenWidth / 5 " h" (ScreenHeight)/2 " Center +backgroundtrans 0x200", Idades
    Loop 11 {
        if (A_Index = 1) {
            Gui, comparador: Add, Text, % "x0 y+0 w" A_ScreenWidth / 10 " h" controlheight " Center 0x200", % title[A_Index]
            Gui, comparador: Add, Edit, % "x+0 yp w" A_ScreenWidth / 10 " h" controlheight " Center vcomparador_idade" A_Index " gcalc_in", 0
        }
        else {
            Gui, comparador: Add, Text, % "x0 y+0 w" A_ScreenWidth / 10 " h" controlheight " Center 0x200", % title[A_Index]
            Gui, comparador: Add, Edit, % "x+0 yp w" A_ScreenWidth / 10 " h" controlheight " Center vcomparador_idade" A_Index " gcalc_in", 0
        }
    }
    ; Campos de valores dos planos e diferença
    Loop 4 { 
        in_loop_control := A_index
        Gui, comparador: Add, Text, % "x" A_ScreenWidth / 5 * A_Index " y" ScreenHeight*2.5 " w" A_ScreenWidth / 5 " h" (ScreenHeight)/2 " Center +backgroundtrans 0x200", % title2[A_Index]
        Loop 11
            Gui, comparador: Add, Edit, % "x" A_ScreenWidth / 5 * in_loop_control " y+0 w" A_ScreenWidth / 5 " h" controlheight " Center vcampo" in_loop_control "_" A_Index " +ReadOnly", R$ 0,00
    }
    ; Referência de plano selecionado
    Gui, comparador: Add, Edit,    % "x" A_ScreenWidth / 5 " y+0 w" A_ScreenWidth / 5 " h" ScreenHeight*2 " -VScroll +ReadOnly vref1 Center", Nenhum Plano Selecionado  
    Gui, comparador: Add, Edit,    % "x+0 yp w" A_ScreenWidth / 5 " h" ScreenHeight*2 " -VScroll +ReadOnly vref2 Center", Nenhum Plano Selecionado  
    ; Lista de seleção de plano
    Gui, comparador: Add, ListBox, % "x0 y+0  w" A_ScreenWidth / 3 " h" ScreenHeight*4 " vcomp_operadora gswitch_operadora ", Santa Casa CA|Santa Casa PME|Sermed CA|Sermed PME|Benevida CA|Benevida PME|Benevida GM|Oeste Saúde
    Gui, comparador: Add, ListBox, % "x+0     w" A_ScreenWidth / 3 " h" ScreenHeight*4 " vcomp_plano     gswitch_operadora2",
    Gui, comparador: Add, ListBox, % "x+0     w" A_ScreenWidth / 3 " h" ScreenHeight*4 " vcomp_plano2                      ",
    ; Botões
    Gui, comparador: Add, Button , % "x0 y+" ScreenHeight/2 " h" ScreenHeight " w" A_ScreenWidth/4 " glista vbut_1", Plano 1
    Gui, comparador: Add, Button , x+0 yp wp hp glista vbut_2, Plano 2
    ; Desabilitando acessos para reabilitar novamente depois
    Loop 11 
        Guicontrol, comparador: +ReadOnly, comparador_idade%A_Index%
    Guicontrol, comparador: +ReadOnly, comparador_idade11
    
    Gui, comparador: Show, % "x0 y0 h" A_ScreenHeight - toolbarh " w" toolbarw, Comparador de Preços
return

comparadorGuiEscape:
comparadorfechar:
    Gui, comparador: Destroy
return

calc_in:
    Gui, comparador: Submit, Nohide
    total1 :=
    total2 := 
    totalidades := 
    loop 10 {
        GuiControl, comparador:, campo1_%A_Index%, % "R$ " StrReplace(Round(comparador_idade%A_Index% * valores(dados1,A_Index),2),".",",")
        GuiControl, comparador:, campo2_%A_Index%, % "R$ " StrReplace(Round(comparador_idade%A_Index% * valores(dados2,A_Index),2),".",",")
        GuiControl, comparador:, campo3_%A_Index%, % "R$ " StrReplace(StrReplace(Round(comparador_idade%A_Index% * valores(dados2,A_Index) - comparador_idade%A_Index% * valores(dados1,A_Index),2),".",","),"-","")
        GuiControl, comparador:, campo4_%A_Index%, % "R$ " StrReplace(StrReplace(Round(((comparador_idade%A_Index% * valores(dados2,A_Index)) - (comparador_idade%A_Index% * valores(dados1,A_Index)))*12,2),".",","),"-","")
    }
    Loop 10 {
        total1 += comparador_idade%A_Index% * valores(dados1,A_Index)
        total2 += comparador_idade%A_Index% * valores(dados2,A_Index)
        totalidades += comparador_idade%A_Index%
    }
    GuiControl, comparador:, comparador_idade11, % totalidades
    GuiControl, comparador:, campo1_11, % "R$ " StrReplace(Round(total1,2),".",",")
    GuiControl, comparador:, campo2_11, % "R$ " StrReplace(Round(total2,2),".",",")
    GuiControl, comparador:, campo3_11, % "R$ " StrReplace(Round(total2 - total1,2),".",",")
    GuiControl, comparador:, campo4_11, % "R$ " StrReplace(Round((total2 - total1)*12,2),".",",")
return
    
lista:
    Gui, comparador: Submit, Nohide
    Loop 2
        dados%A_Index% :=

    If (comp_operadora = "" or comp_plano = "")
        exit

    Loop 11
        GuiControl, comparador: -ReadOnly, comparador_idade%A_Index%

    Loop 2 {
        If (A_GuiControl = "but_"A_Index) {
            GuiControl, comparador:, ref%A_Index%, % comp_operadora " " comp_plano " " comp_plano2
            ; Operadoras
            if (comp_operadora = "Santa Casa CA")
                in_oper%A_Index% := "sc_ca_"
            if (comp_operadora = "Santa Casa PME")
                in_oper%A_Index% := "sc_pme_"
            if (comp_operadora = "Sermed CA")
                in_oper%A_Index% := "sermed_"
            if (comp_operadora = "Sermed PME")
                in_oper%A_Index% := "sermed_pme_"
            if (comp_operadora = "Benevida CA")
                in_oper%A_Index% := "benevida_ca_"
            if (comp_operadora = "Benevida PME")
                in_oper%A_Index% := "benevida_pme_"
            if (comp_operadora = "Benevida GM")
                in_oper%A_Index% := "benevida_gm_"
            if (comp_operadora = "Oeste Saúde")
                in_oper%A_Index% := "os_"
            ; Santa Casa
            if (comp_plano = "Controle Enfermaria")
                %A_Index%_plano%A_Index% := "controle_enfermaria"
            if (comp_plano = "Controle Apartamento")
                %A_Index%_plano%A_Index% := "controle_apartamento"
            if (comp_plano = "Standard")
                %A_Index%_plano%A_Index% := "standard"
            if (comp_plano = "Executivo")
                %A_Index%_plano%A_Index% := "executivo"
            ; Sermed
            if (comp_plano = "Union Hospitalar")
                %A_Index%_plano%A_Index% := "union_hospitalar"
            if (comp_plano = "Union Completo")
                %A_Index%_plano%A_Index% := "union_completo"
            if (comp_plano = "Medida Certa")
                %A_Index%_plano%A_Index% := "medida_certa"
            if (comp_plano = "Tradicional")
                %A_Index%_plano%A_Index% := "tradicional"
            ; Benevida
            if (comp_plano = "Standard com Copart")
                %A_Index%_plano%A_Index% := "standard_com_copart"
            if (comp_plano = "Executivo com Copart")
                %A_Index%_plano%A_Index% := "executivo_com_copart"
            if (comp_plano = "Standard sem Copart")
                %A_Index%_plano%A_Index% := "standard_sem_copart"
            if (comp_plano = "Executivo sem Copart")
                %A_Index%_plano%A_Index% := "executivo_sem_copart"
            ; Benevida GM
            if (comp_plano = "Coletivo Adesão com Copart STD")
                %A_Index%_plano%A_Index% := "ca_standard_com_copart"
            if (comp_plano = "Coletivo Adesão com Copart EXE")
                %A_Index%_plano%A_Index% := "ca_executivo_com_copart"
            if (comp_plano = "PME com Copart STD")
                %A_Index%_plano%A_Index% := "pme_standard_com_copart"
            if (comp_plano = "PME com Copart EXE")
                %A_Index%_plano%A_Index% := "pme_executivo_com_copart"
            ; Oeste Saúde
            if (comp_plano = "Coletivo Adesão com Copart")
                %A_Index%_plano%A_Index% := "ca"
            if (comp_plano = "PME com Copart")
                %A_Index%_plano%A_Index% := "pme"
            ; Sermed CA e Sermed PME Union Hospitalar
            if (comp_plano2 = "Pessoa Física STD")
                %A_Index%_plano2%A_Index% := "_pessoa_fisica_standard"
            if (comp_plano2 = "Pessoa Física EXE")
                %A_Index%_plano2%A_Index% := "_pessoa_fisica_executivo"
            if (comp_plano2 = "Coletivo Adesão STD")
                %A_Index%_plano2%A_Index% := "_coletivo_por_adesao_standard"
            if (comp_plano2 = "Coletivo Adesão EXE")
                %A_Index%_plano2%A_Index% := "_coletivo_por_adesao_executivo"
            if (comp_plano2 = "Standard")
                %A_Index%_plano2%A_Index% := "_standard"
            if (comp_plano2 = "Executivo")
                %A_Index%_plano2%A_Index% := "_executivo"
            ; Sermed PME Union Completo
            if (comp_plano2 = "Até 29 vidas Standard")
                %A_Index%_plano2%A_Index% := "_29_standard"
            if (comp_plano2 = "Até 29 vidas Executivo")
                %A_Index%_plano2%A_Index% := "_29_executivo"
            if (comp_plano2 = "30 vidas + Standard")
                %A_Index%_plano2%A_Index% := "_30_standard"
            if (comp_plano2 = "30 vidas + Executivo")
                %A_Index%_plano2%A_Index% := "_30_executivo"
            ; Sermed PME Medida Certa e Tradicional
            if (comp_plano2 = "Até 29 vidas Sem Copart Standard")
                %A_Index%_plano2%A_Index% := "_29_sem_copart_standard"
            if (comp_plano2 = "Até 29 vidas Sem Copart Executivo")
                %A_Index%_plano2%A_Index% := "_29_sem_copart_executivo"
            if (comp_plano2 = "30 vidas + Sem Copart Standard")
                %A_Index%_plano2%A_Index% := "_30_sem_copart_standard"
            if (comp_plano2 = "30 vidas + Sem Copart Executivo")
                %A_Index%_plano2%A_Index% := "_30_sem_copart_executivo"
            if (comp_plano2 = "Até 29 vidas Com Copart Standard")
                %A_Index%_plano2%A_Index% := "_29_com_copart_standard"
            if (comp_plano2 = "Até 29 vidas Com Copart Executivo")
                %A_Index%_plano2%A_Index% := "_29_com_copart_executivo"
            if (comp_plano2 = "30 vidas + Com Copart Standard")
                %A_Index%_plano2%A_Index% := "_30_com_copart_standard"
            if (comp_plano2 = "30 vidas + Com Copart Executivo")
                %A_Index%_plano2%A_Index% := "_30_com_copart_executivo"
        }
        dados%A_Index% := in_oper%A_Index% %A_Index%_plano%A_Index% %A_Index%_plano2%A_Index%
    }
    goto calc_in
return

switch_operadora:
    Gui, comparador: Submit, Nohide
    if (comp_operadora = "Santa Casa CA") {
        Guicontrol, comparador: , comp_plano , |Controle Enfermaria|Controle Apartamento|Standard|Executivo
        Guicontrol, comparador: , comp_plano2, |
    }
    if (comp_operadora = "Santa Casa PME") {
        Guicontrol, comparador: , comp_plano , |Controle Enfermaria|Controle Apartamento|Standard|Executivo
        Guicontrol, comparador: , comp_plano2, |
    }
    if (comp_operadora = "Sermed CA")
        Guicontrol, comparador: , comp_plano, |Union Hospitalar|Union Completo|Medida Certa
    if (comp_operadora = "Sermed PME")
        Guicontrol, comparador: , comp_plano, |Union Hospitalar|Union Completo|Medida Certa|Tradicional
    if (comp_operadora = "Benevida CA") {
        Guicontrol, comparador: , comp_plano , |Standard com Copart|Executivo com Copart|Standard sem Copart|Executivo sem Copart
        Guicontrol, comparador: , comp_plano2, |
    }
    if (comp_operadora = "Benevida PME") {
        Guicontrol, comparador: , comp_plano , |Standard com Copart|Executivo com Copart|Standard sem Copart|Executivo sem Copart
        Guicontrol, comparador: , comp_plano2, |
    }
    if (comp_operadora = "Benevida GM") {
        Guicontrol, comparador: , comp_plano , |Coletivo Adesão com Copart STD|Coletivo Adesão com Copart EXE|PME com Copart STD|PME com Copart EXE
        Guicontrol, comparador: , comp_plano2, |
    }
    if (comp_operadora = "Oeste Saúde") {
        Guicontrol, comparador: , comp_plano , |Coletivo Adesão com Copart|PME com Copart
        Guicontrol, comparador: , comp_plano2, |
    }
return

switch_operadora2:
    Gui, comparador: Submit, Nohide
    if (comp_operadora = "Sermed CA" and comp_plano = "Union Hospitalar" or comp_plano = "Union Completo" or comp_plano = "Medida Certa")
        Guicontrol, comparador: ,comp_plano2, |Pessoa Física STD|Pessoa Física EXE|Coletivo Adesão STD|Coletivo Adesão EXE
    if (comp_operadora = "Sermed PME" and comp_plano = "Union Hospitalar")
        Guicontrol, comparador: ,comp_plano2, |Standard|Executivo
    if (comp_operadora = "Sermed PME" and comp_plano = "Union Completo")
        Guicontrol, comparador: ,comp_plano2, |Até 29 vidas Standard|Até 29 vidas Executivo|30 vidas + Standard|30 vidas + Executivo
    if (comp_operadora = "Sermed PME" and comp_plano = "Medida Certa")
        Guicontrol, comparador: ,comp_plano2, |Até 29 vidas Com Copart Standard|Até 29 vidas Com Copart Executivo|30 vidas + Com Copart Standard|30 vidas + Com Copart Executivo
    if (comp_operadora = "Sermed PME" and comp_plano = "Tradicional")
        Guicontrol, comparador: ,comp_plano2, |Até 29 vidas Sem Copart Standard|Até 29 vidas Sem Copart Executivo|30 vidas + Sem Copart Standard|30 vidas + Sem Copart Executivo
Return

valores(var,num) {
    sc_ca_controle_enfermaria  := [105.45,118.10,129.92,142.91,157.19,172.90,266.25,332.83,382.76,631.51]
    sc_ca_controle_apartamento := [137.09,153.52,168.87,185.76,204.33,224.76,346.12,432.65,497.56,820.95]
    sc_ca_standard             := [222.42,249.12,274.02,301.39,331.55,364.67,561.62,702.02,807.32,1332.10]
    sc_ca_executivo            := [253.35,283.74,312.13,343.34,377.66,415.43,639.75,799.72,919.67,1517.44]
    
    sc_pme_controle_enfermaria  := [89.57,100.30,110.34,121.39,133.51,146.86,226.14,282.68,325.08,536.36]
    sc_pme_controle_apartamento := [116.44,130.40,143.43,157.80,173.56,190.92,294.02,367.50,422.64,697.35]
    sc_pme_standard             := [146.91,165.58,182.16,200.36,220.17,242.41,373.32,466.65,536.65,885.50]
    sc_pme_executivo            := [215.35,241.19,265.29,291.82,321.00,353.10,543.76,679.70,781.67,1289.72]
    
    sermed_union_hospitalar_pessoa_fisica_standard        := [69.27,72.94,77.11,81.49,86.79,92.43,169.80,186.78,278.67,415.50]
    sermed_union_hospitalar_pessoa_fisica_executivo       := [96.92,102.06,107.87,114.02,121.43,129.33,237.57,261.33,389.91,581.35]
    sermed_union_hospitalar_coletivo_por_adesao_standard  := [62.63,65.95,69.72,73.69,78.47,83.57,153.52,168.87,251.96,375.68]
    sermed_union_hospitalar_coletivo_por_adesao_executivo := [87.63,92.27,97.53,103.09,109.79,116.93,214.80,236.28,352.52,525.61]

    sermed_union_completo_pessoa_fisica_standard        := [151.42,159.45,168.53,178.14,189.72,202.05,371.17,408.28,609.16,908.26]
    sermed_union_completo_pessoa_fisica_executivo       := [192.57,202.78,214.33,226.55,241.28,256.96,472.04,519.24,774.71,1155.09]
    sermed_union_completo_coletivo_por_adesao_standard  := [141.94,149.45,157.98,166.98,177.83,189.40,347.92,382.72,571.01,851.38]
    sermed_union_completo_coletivo_por_adesao_executivo := [164.76,173.48,183.38,193.82,206.43,219.85,404.00,444.48,662.82,988.28]

    sermed_medida_certa_pessoa_fisica_standard        := [189.63,199.68,211.06,223.09,237.59,253.04,464.83,511.31,762.88,1137.45]
    sermed_medida_certa_pessoa_fisica_executivo       := [228.07,240.16,253.85,268.32,285.76,304.33,559.06,614.96,917.52,1368.02]
    sermed_medida_certa_coletivo_por_adesao_standard  := [178.66,188.12,198.84,210.18,223.84,238.69,437.93,481.73,718.73,1071.64]
    sermed_medida_certa_coletivo_por_adesao_executivo := [213.52,224.84,237.66,251.20,267.53,284.91,523.40,575.74,859.01,1280.79]

    sermed_pme_union_hospitalar_standard  := [57.10,60.13,63.56,67.18,71.54,76.19,139.97,153.96,229.71,342.50]
    sermed_pme_union_hospitalar_executivo := [79.89,84.12,88.92,93.99,100.10,106.60,195.83,215.41,321.40,479.20]

    sermed_pme_union_completo_29_standard  := [117.20,123.41,130.45,137.88,146.84,156.39,287.29,316.01,471.49,703]
    sermed_pme_union_completo_29_executivo := [140.60,148.05,156.49,165.41,176.16,187.61,344.65,379.11,565.63,843.36]
    sermed_pme_union_completo_30_standard  := [98.72,103.95,109.88,116.14,123.69,131.73,241.99,266.19,397.16,592.17]
    sermed_pme_union_completo_30_executivo := [114.43,120.49,127.36,134.62,143.37,152.69,280.49,308.54,460.34,686.37]

    sermed_pme_tradicional_29_sem_copart_standard  := [193.67,203.93,215.56,227.85,242.66,258.43,474.73,522.21,779.13,1161.68]
    sermed_pme_tradicional_29_sem_copart_executivo := [251.77,265.11,280.23,296.20,315.45,335.96,617.15,678.87,1012.87,1510.19]
    sermed_pme_tradicional_30_sem_copart_standard  := [155.10,163.32,172.63,182.47,194.33,206.96,380.19,418.21,623.96,930.33]
    sermed_pme_tradicional_30_sem_copart_executivo := [201.63,212.32,224.42,237.21,252.63,269.05,494.24,543.67,811.15,1209.43]
    
    sermed_pme_medida_certa_29_com_copart_standard  := [170.36,179.39,189.61,200.42,213.45,227.32,417.59,459.35,685.36,1021.86]
    sermed_pme_medida_certa_29_com_copart_executivo := [221.47,233.21,246.50,260.55,277.48,295.52,542.87,597.16,890.96,1328.42]
    sermed_pme_medida_certa_30_com_copart_standard  := [124.10,130.68,138.13,146,155.49,165.60,304.20,334.62,499.25,744.39]
    sermed_pme_medida_certa_30_com_copart_executivo := [161.33,169.88,179.56,189.80,202.14,215.27,395.46,435.01,649.03,967.70]

    benevida_ca_standard_com_copart  := [86.21,96.56,106.22,116.85,128.52,141.37,217.68,272.13,312.97,516.37]
    benevida_ca_executivo_com_copart := [108.63,121.67,133.84,147.23,161.94,178.14,274.31,342.91,394.38,650.66]
    benevida_ca_standard_sem_copart  := [176.04,197.18,216.90,238.58,262.42,288.68,444.50,555.68,639.03,1054.38]
    benevida_ca_executivo_sem_copart := [211.25,236.60,260.28,286.31,314.90,346.41,633.42,666.82,766.83,1265.27]

    benevida_pme_standard_com_copart  := [76.27,85.43,93.97,103.37,113.70,125.07,192.58,240.74,276.85,456.80]
    benevida_pme_executivo_com_copart := [97.87,109.62,120.58,132.64,145.89,160.48,247.11,308.91,355.25,586.16]
    benevida_pme_standard_sem_copart  := [143.00,160.17,176.19,193.81,213.17,234.49,361.07,451.37,519.08,856.48]
    benevida_pme_executivo_sem_copart := [171.60,192.21,211.43,232.57,255.80,281.38,433.27,541.63,622.87,1027.74]

    benevida_gm_ca_standard_com_copart   := [101.01,113.13,124.46,136.91,150.58,165.65,255.07,318.87,366.70,605.05]
    benevida_gm_ca_executivo_com_copart  := [163.48,183.11,201.43,221.57,243.71,268.08,412.82,516.06,593.47,979.22]
    benevida_gm_pme_standard_com_copart  := [95.09,106.51,117.17,128.88,141.76,155.94,240.11,300.14,345.15,569.50]
    benevida_gm_pme_executivo_com_copart := [123.62,138.47,152.32,167.55,184.29,202.73,312.14,390.19,448.73,740.39]
    
    os_ca  := [110.25,152.93,181.62,196.72,209.92,257.53,296.50,368.96,479.06,660.66]
    os_pme := [105.84,146.82,173.91,189.51,201.52,247.23,284.64,354.20,459.90,634.23]
    return %var%[num]
}