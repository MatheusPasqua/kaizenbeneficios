agenda:
    menu_close()
    Gui, Agenda: Destroy
    Gui, Agenda: Add, Text, xp  w100 Right, Nome da Empresa
    Gui, Agenda: Add, Edit, x+5 w150 vnomedaempresa

    Gui, Agenda: Add, Text, xs  w100 Right, Nome do Contato
    Gui, Agenda: Add, Edit, x+5 w150 vnomedocontato

    Gui, Agenda: Add, Text, xs  w100 Right, Telefone
    Gui, Agenda: Add, Edit, x+5 w150 vtelefone

    Gui, Agenda: Add, Text, xs  w100 Right, Endereço
    Gui, Agenda: Add, Edit, x+5 w150 vendereco

    Gui, Agenda: Add, Text, xs  w100 Right, Data
    Gui, Agenda: Add, DateTime, x+5 w150 vdata_agenda ChooseNone, dd/MM/yyyy - dddd

    Gui, Agenda: Add, Text, xs  w100 Right, Horário (Hora - Minuto)
    Gui, Agenda: Add, DateTime, x+5 w72 vhorarioh 1, HH
    Gui, Agenda: Add, DateTime, x+5 w72 vhorariom 1, mm

    Gui, Agenda: Add, Text, xs  w100 Right, Número de Vidas
    Gui, Agenda: Add, Edit, x+5 w50 vnumerodevidas +Number

    Gui, Agenda: Add, Text, xs  w100 Right, Possui Plano?
    Gui, Agenda: Add, radio, x+5 vpossuiplanosim, Sim
    Gui, Agenda: Add, radio, x+5 vpossuiplanonao, Não

    Gui, Agenda: Add, Text, xs  w100 Right, Qual Plano?
    Gui, Agenda: Add, Edit, x+5 w150 vqualplano

    Gui, Agenda: Add, Button, xs w100 h50 gEnviar_Agenda, Enviar
    Gui, Agenda: Add, Button, x+5 w100 h50 gagendacancelar, Cancelar

    Gui, Agenda: Show,, Visita Empresarial
    return

    Enviar_Agenda:
    Gui, Agenda: Submit, Nohide
    if (nomedaempresa = "" or nomedocontato = "" or telefone = "" or endereco = "" or data_agenda = "" or horarioh = "" or horariom = "" or numerodevidas = "")
    {
        Msgbox Algum campo obrigatório não está preenchido.
    }
    else if(possuiplanosim = 0 and possuiplanonao = 0)
    {
        Msgbox "Possui plano" não está preenchido.
    }
    else
    {
        Gui, Agenda: Submit
        if (possuiplanosim = 1)
        {
            possuiplano := "Sim"
        }
        else if (possuiplanonao = 1)
        {
            possuiplano := "Não"
        }
        Clipboard :=

        FormatTime, data_agenda, %data_agenda% , dd/MM/yyyy
        FormatTime, horarioh, %horarioh% , HH
        FormatTime, horariom, %horariom% , mm
        
        #LTrim
        agenda_texto = 
        (
            Nome da Empresa:  %nomedaempresa%
            Nome do Contato:  %nomedocontato%

            Telefone: %telefone%
            Endereco: %endereco%

            Data: %data_agenda%
            Horário: %horarioh%:%horariom%

            Número de Vidas: %numerodevidas%
            Possui Plano?: %possuiplano%
            Qual plano?: %qualplano%
        )
        #LTrim, Off
        
        Clipboard := agenda_texto
        Msgbox,,, Entre na conversa do Artur ou do Ray no Whatsapp e com o campo de enviar mensagem selecionado aperte CTRL + V, 10
        IfMsgBox Timeout
            Gui, Agenda: Destroy
    }
return

agendacancelar:
    Gui, Agenda: Destroy
    return



