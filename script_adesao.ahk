adesao:
    menu_close()
    data_ok := 0

    Gui, adesao: Destroy

    Gui, adesao: -DPIscale
    Gui, adesao: Margin, 5, 5
    Gui, adesao: Color, 0d0d0d, 404040
    Gui, adesao: Font, w700 s10 CWhite

    Gui, adesao: Add, Edit, w150 vitem1, 
    Gui, adesao: Add, Text, x+m w330 vtext_item1, Nome da pessoa que está conversando:
    
    Gui, adesao: Add, Radio, xs  vitem9, Saúde
    Gui, adesao: Add, Radio, x+m vitem10, Odontológico

    Gui, adesao: Add, DropDownList, xs  w150 vitem2, Sermed|Benevida|Santa Casa
    Gui, adesao: Add, Text, x+m w330 vtext_item2, Operadora:
   
    Gui, adesao: Add, DropDownList, xs  w150 vitem3, Col. Adesão|PME|Pessoa Física
    Gui, adesao: Add, Text, x+m w330 vtext_item3, Tipo de Plano:
       
    Gui, adesao: Add, Edit, xs  w150 vitem4,
    Gui, adesao: Add, Text, x+m w330 vtext_item4, Titular:
   
    Gui, adesao: Add, Edit, xs  w150 vitem5 +Number,
    Gui, adesao: Add, Text, x+m w330 vtext_item5 , Qtd. Dependentes:

    Gui, adesao: Add, Edit, xs  w150 vitem6,
    Gui, adesao: Add, Text, x+m w330 vtext_item6, Data de Vencimento (Boleto Adesão):
    
    Gui, adesao: Add, DateTime, xs  w150 vitem7 ChooseNone, dd/MM/yyyy - dddd
    Gui, adesao: Add, Text, x+m w330 vtext_item7, Vigência do Contrato a Partir do dia:
    
    Gui, adesao: Add, DateTime, xs  w150 vitem8 ChooseNone, dd/MM/yyyy - dddd
    Gui, adesao: Add, Text, x+m w330 vtext_item8, Data de Vencimento da mensalidade do plano:
    
    Gui, adesao: Add, Edit, xs  w150 vitem11,
    Gui, adesao: Add, Text, x+m w330 vtext_item11, Valor (6 mensalidades)

    Gui, adesao: Add, Edit, xs  w150 vitem12,
    Gui, adesao: Add, Text, x+m w330 vtext_item12, Valor Mensalidades Seguintes
    
    Gui, adesao: Add, Button, xs w70 h43 genviar_adesao, Enviar
    
    Gui, adesao: Show
    Gui, adesao: Submit, Nohide
return

enviar_adesao:
    check_campos()
    
    If (data_ok = 0) {
        Msgbox Algum campo obrigatório não foi preenchido.
        Exit
    }
    else {
        Gui, adesao: Submit, Nohide
        data_ok++
        
        if (item9 = 1)
            sa_od := "Médica"
        else if (Item10 = 1)
            sa_od := "Odontológica"
        
        Clipboard :=
        FormatTime, item7, %item7% , dd/MM/yyyy
        FormatTime, item8, %item8% , dd/MM/yyyy
        
        #LTrim
        adesao_texto := " 
        (
            *" item1 ",*
            
            Em nome da *Kaizen Benefícios* agradecemos por sua preferência e principalmente por sua confiança no processo de contratação do seu Plano de Assistência " sa_od ".

            Abaixo, seguem as principais informações a respeito do Plano contratado:

            Operadora: *" item2 "*

            Tipo de Plano: *" item3 "*

            Titular: *" item4 "*

            Qtd. Dependentes: *" item5 "*
        )"
        if (item3 = "PME" and item2 = "Santa Casa") {
            adesao_texto .= "
            (
                `n
                Data de Vencimento (Boleto Adesão): *" item6 "*
            )"
        }
        adesao_texto .= "
        (
            `n
            Vigência do Contrato a Partir do dia: *" item7 "*

            Data de Vencimento da mensalidade do plano: *" item8 "*
        )"
        if (item2 = "Sermed" or item2 = "Benevida" and item3 = "Col. Adesão")
            adesao_texto .= "
            (
                `n
                Valor das 6 (seis) primeiras mensalidades: *R$ " item11 "*

                Valor das mensalidades seguintes: *R$" item12 "*
            )"
        adesao_texto2 := " 
        (
            Segue abaixo, o boleto referente a taxa de adesão, com vencimento programado para o dia *" item6 "*
        )"
        
        adesao_texto3 := " 
        (
            Segue abaixo, o boleto referente a primeira mensalidade do seu plano, com vencimento programado para o dia *" item8 "*
        )"
        
        If (item2 = "Benevida")
            adesao_texto .= "`n`nMês de Renovação Automática: *Junho*"
        Else if (item2 = "Sermed")
            adesao_texto .= "`n`nMês de Renovação Automática: *Dezembro*"
        Else if (item2 = "Santa Casa")
            adesao_texto .= "`n`nMês de Renovação Automática: *Janeiro*"
       
        #LTrim, Off


        MsgBox, 262209, Enviar texto adesão, Entre na conversa do Lead no Whatsapp e com o campo de enviar mensagem selecionado aperte ok.
        IfMsgBox, Cancel
            Exit
        else {
            Gui, adesao: Submit
            WinActivate, A

            Clipboard := 
            Clipboard := adesao_texto 
            Clipwait,,1
            SendInput ^v
            Sleep 2000
            SendInput {Enter}

            if (item3 = "PME" and item2 = "Santa Casa") {
                Clipboard := 
                Clipboard := adesao_texto2
                Clipwait,,1
                SendInput ^v
                Sleep 2000
                SendInput {Enter}
            }

            if (item2 = "Sermed" or item2 = "Benevida" and item3 = "Col. Adesão") {
                Clipboard := 
                Clipboard := adesao_texto3
                Clipwait,,1
                SendInput ^v
                Sleep 2000
                SendInput {Enter}
            }

        }
        data_ok = 0
    }
return

adesaoGuiClose:
adesaoGuiEscape:
    Gui, Adesao: Destroy
    return

check_campos() {
    Global
    Gui, adesao: Submit, Nohide
    if (item1 = "" or item2 = "" or item3 = "" or item4 = "" or item5 = "" or item7 = "" or item8 = "" or item9 = 0 and item10 = 0)
        data_ok := 0
    Else
        data_ok := 1
    return data_ok
}