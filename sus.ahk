num_sus:
    menu_close()
    Gui, sus: -Caption +AlwaysOnTop
    Gui, sus: Color, 0x202124
    Gui, sus: Font, s12 w700 cWhite q5, Segoe UI
    Gui, sus: Margin,10,10

    Gui, sus: Add, Text,   y20     w160 Right  , CPF
    Gui, sus: Add, Edit,   x+5  w120 ck vsus_cpf,
    Gui, sus: Add, Text,   xm+s w160 Right, Data de Nascimento
    Gui, sus: Add, Edit,   x+5  w120 ck vsus_data,
    Gui, sus: Add, Text,   xm+s w160 Right, Número do Sus
    Gui, sus: Add, Text,   x+5  w160 vnum_sus 0x1000 Center,
    Gui, sus: Add, Button, xm y+20 w60 h30 Center gsus_enviar +Default, Enviar
    Gui, sus: Add, Button, x+5  w60 h30 Center gcopiar vcopiar, Copiar
    Gui, sus: Add, Button, x+5  w60 h30 Center gsusGuiClose, Fechar

    GuiControl, sus: Disable, copiar

    Gui, sus: Show
Return

susGuiClose:
    Gui, sus: Destroy
Return

copiar:
    Gui, sus: Submit, Nohide
    ToolTip, Numero copiado para a Área de Transferência, h50
    Clipboard := copy_sus
    Sleep 2000
    ToolTip
return

sus_enviar:
    Gui, Sus: Submit, Nohide

    sus_data := RegExReplace(sus_data, "\D")
    sus_data := SubStr(sus_data, 1, 2) "/" SubStr(sus_data, 3, 2) "/" SubStr(sus_data, 5, 4)

    Chrome := new Rufaydium()
    Chrome.capabilities.HeadlessMode := true
    Page := Chrome.NewSession()
    Page.Navigate("https://cnesadm.datasus.gov.br/cnesadm/publico/usuarios/cadastro")

    Input1 := Page.querySelectorAll("Input")[0]
    Input1.SendKey(sus_cpf)

    Input2 := Page.querySelectorAll("Input")[1]
    Input2.SendKey(sus_data)

    Page.querySelectorAll("Button")[0].click()

    Page.Screenshot(A_Desktop "\teste.png")

    if (Page.querySelector("#cns.form-control").value != "")
    {
        GuiControl, sus: Text, num_sus, % Page.querySelector("#cns.form-control").value
        copy_sus := Page.querySelector("#cns.form-control").value
        GuiControl, sus: Enable, copiar
    }
    Else
        MsgBox, 262192, Dado errado, O CPF ou a Data de Nascimento digitada está incorreta.

    Page.Close()
return