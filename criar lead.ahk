prosp_:
    menu_close()
    Gui, prosp: Destroy
    Gui, prosp: Margin, 5,5
    Gui, prosp: Color, 0x252526

    Gui, prosp: Font, s12 w1000 cWhite
    Gui, prosp: Add, GroupBox, xm w500 r1, Nome*
    Gui, prosp: Font, s10 w1000
    Gui, prosp: Add, Edit, xp+5 yp+20 ck w490 vprosp_nome,

    Gui, prosp: Font, s12 w1000
    Gui, prosp: Add, GroupBox, xm w500 r1, Consultor*
    Gui, prosp: Font, s10 w1000
    Gui, prosp: Add, DropDownList, xp+5 yp+20 ck w490 vprosp_consultor, Brenda Rodrigues|Bruna Gabellini|Bruna Morais|Carla Almeida|Dauane Teixeira|Fabiola Moreira|Flávia Oliveira|Giulia Marques|Janaina Alves|Laíse Soares|Letícia Sordi|Paloma Bonini|Vanessa Gonçalves

    Gui, prosp: Font, s12 w1000
    Gui, prosp: Add, GroupBox, xm w500 r1, Operadora*
    Gui, prosp: Font, s10 w1000
    Gui, prosp: Add, DropDownList, xp+5 yp+20 w490 vprosp_operadora, Sermed|Sermed PME|Benevida CA|Benevida PME|Santa Casa|Santa Casa Empresarial

    Gui, prosp: Font, s12 w1000
    Gui, prosp: Add, GroupBox, xm w500 r1, Canal*
    Gui, prosp: Font, s10 w1000
    Gui, prosp: Add, DropDownList, xp+5 yp+20 w490 vprosp_canal, Prospecção|Contato Próprio

    Gui, prosp: Font, s12 w1000
    Gui, prosp: Add, GroupBox, xm w500 r1, Telefone*
    Gui, prosp: Font, s10 w1000
    Gui, prosp: Add, Edit, xp+5 yp+20 ck w490 vprosp_telefone,

    Gui, prosp: Font, s12 w1000
    Gui, prosp: Add, GroupBox, xm w500 r1, Cidade
    Gui, prosp: Font, s10 w1000
    Gui, prosp: Add, Edit, xp+5 yp+20 ck w490 vprosp_cidade,

    Gui, prosp: Font, s12 w1000
    Gui, prosp: Add, GroupBox, xm w500 r1, E-mail*
    Gui, prosp: Font, s10 w1000
    Gui, prosp: Add, Edit, xp+5 yp+20 ck w490 vprosp_email,

    Gui, prosp: Font, s12 w1000
    Gui, prosp: Add, GroupBox, xm w500 r1, Idade(s)
    Gui, prosp: Font, s10 w1000
    Gui, prosp: Add, Edit, xp+5 yp+20 ck w490 vprosp_idades,

    Gui, prosp: Add, Button, xm y+20 w100 h50 genvio_prosp, Enviar
    Gui, prosp: Add, Progress, x+m w395 h50 cGreen vprog, Enviar

    Gui, prosp: Show,, Criar Lead
return

envio_prosp:
    Gui, prosp: Submit, Nohide
    cango()

    Chrome := new Rufaydium()
    Guicontrol, prosp: , prog, +5
    Chrome.capabilities.addArg("--headless")
    Guicontrol, prosp: , prog, +5
    Page := Chrome.NewSession()
    Guicontrol, prosp: , prog, +5
    Page.Navigate("https://forms.monday.com/forms/0eea97156b1e9796ef653ec2e2c61ef5?r=use1")
    Guicontrol, prosp: , prog, +5

    While !IsObject(checking) {
        Sleep 500
        checking := Page.querySelectorAll("Input")[0]
    Guicontrol, prosp: , prog, +5
    }

    Input := Page.querySelectorAll("Input")
    Guicontrol, prosp: , prog, +5

    Input[0].Sendkey(prosp_nome)
    Guicontrol, prosp: , prog, +5
    Input[1].Sendkey(prosp_consultor)
    Guicontrol, prosp: , prog, +5
    Input[1].Sendkey(key.Enter)
    Guicontrol, prosp: , prog, +5
    Input[2].Sendkey(prosp_operadora)
    Guicontrol, prosp: , prog, +5
    Input[2].Sendkey(key.Enter)
    Guicontrol, prosp: , prog, +5
    Input[3].Sendkey(prosp_canal)
    Guicontrol, prosp: , prog, +5
    Input[3].Sendkey(key.Enter)
    Guicontrol, prosp: , prog, +5
    Input[5].Sendkey(prosp_telefone)
    Guicontrol, prosp: , prog, +5

    if (cidade != "") {
        Input[6].Sendkey(prosp_cidade)
        Guicontrol, prosp: , prog, +5
        While (Page.querySelector("#react-select-3--option-0").count() = "")
            Sleep 500
        Input[6].Sendkey(key.Enter)
        Guicontrol, prosp: , prog, +5
    }

    Input[7].Sendkey(prosp_email)
    Guicontrol, prosp: , prog, +5
    Input[8].Sendkey(prosp_idades)
    Guicontrol, prosp: , prog, +5

    Page.querySelector("button").click()
    Guicontrol, prosp: , prog, +100
    MsgBox, 262144, Lead Criado, Prospecção criada com successo
    Gui, prosp: Destroy
return

prospGuiClose:
Gui, prosp: Destroy

cango() {
    Global
    If (prosp_nome = "" or prosp_consultor = "" or prosp_operadora  = "" or prosp_canal  = "" or  prosp_telefone  = "" or prosp_email = "") {
        MsgBox, 262192, Verifique os campos, Algum campo obrigatório não foi preenchido
        exit
    }
}