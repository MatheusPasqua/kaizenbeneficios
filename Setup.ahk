Process, Close, Kaizen.exe
Process, Waitclose, Kaizen.exe
Process, Close, Kaizen 2.exe
Process, Waitclose, Kaizen 2.exe

OnExit("opening")

Gui, atualizacao: -Caption +AlwaysOnTop
Gui, atualizacao: Color, k

Gui, atualizacao: Add, Text, cWhite, Instalando...
Gui, atualizacao: Add, Progress, w400 vprogresso, 0

Gui, atualizacao: Font, s10 w700
Gui, atualizacao: Add, Text, w400 h50 gkaizen2_install cWhite, Aguarde, ao final da instalação uma mensagem de concluído aparecerá
Gui, atualizacao: Show,, Instalação

kaizen2_install:
    FileRemoveDir, %A_Desktop%\Orçamentos, 1

    FileCreateDir, %A_Desktop%\Orçamentos\Benevida
    While !FileExist(A_Desktop "\Orçamentos\Benevida")
        Sleep 500
    Guicontrol, atualizacao: , progresso, +2

    FileCreateDir, %A_Desktop%\Orçamentos\Santa Casa
    While !FileExist(A_Desktop "\Orçamentos\Santa Casa")
        Sleep 500
    Guicontrol, atualizacao: , progresso, +2

    FileCreateDir, %A_Desktop%\Orçamentos\Sermed
    While !FileExist(A_Desktop "\Orçamentos\Sermed")
        Sleep 500
    Guicontrol, atualizacao: , progresso, +2
    
    FileCreateDir, %A_Desktop%\Orçamentos\Oeste Saúde
    While !FileExist(A_Desktop "\Orçamentos\Oeste Saúde")
        Sleep 500
    Guicontrol, atualizacao: , progresso, +2
    
    
    FileInstall, Benevida\Atendimento Pediatrico.png, %A_Desktop%\Orçamentos\Benevida\Atendimento Pediatrico.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Benevida\benecarencias.png, %A_Desktop%\Orçamentos\Benevida\benecarencias.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Benevida\centro_bem_estar.jpg, %A_Desktop%\Orçamentos\Benevida\centro_bem_estar.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Benevida\CMB.png, %A_Desktop%\Orçamentos\Benevida\CMB.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Benevida\DIAP.png, %A_Desktop%\Orçamentos\Benevida\DIAP.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Benevida\Hermodinamica.png, %A_Desktop%\Orçamentos\Benevida\Hermodinamica.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Benevida\Hospital Electro Bonini.png, %A_Desktop%\Orçamentos\Benevida\Hospital Electro Bonini.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Benevida\Hospital Nova Bene.png, %A_Desktop%\Orçamentos\Benevida\Hospital Nova Bene.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Benevida\Hospital São Lucas Ribeirania.png, %A_Desktop%\Orçamentos\Benevida\Hospital São Lucas Ribeirania.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Benevida\Hospital São Paulo.png, %A_Desktop%\Orçamentos\Benevida\Hospital São Paulo.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Benevida\IMERV.png, %A_Desktop%\Orçamentos\Benevida\IMERV.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Benevida\Instituto da Visão.png, %A_Desktop%\Orçamentos\Benevida\Instituto da Visão.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Benevida\Laboratório Controle.png, %A_Desktop%\Orçamentos\Benevida\Laboratório Controle.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Benevida\Medclin.png, %A_Desktop%\Orçamentos\Benevida\Medclin.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Benevida\PAAP.png, %A_Desktop%\Orçamentos\Benevida\PAAP.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Benevida\rede credenciada.jpg, %A_Desktop%\Orçamentos\Benevida\rede credenciada.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Benevida\Santa_Casa_Guariba.jpg, %A_Desktop%\Orçamentos\Benevida\Santa_Casa_Guariba.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Benevida\telemedicina.jpg, %A_Desktop%\Orçamentos\Benevida\telemedicina.jpg, 1
    Guicontrol, atualizacao: , progresso, +2    
    
    FileInstall, Oeste Saúde\01-Santa Casa de Misericórdia.jpg, %A_Desktop%\Orçamentos\Oeste Saúde\01-Santa Casa de Misericórdia.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\02-Hospital Iamada.jpg, %A_Desktop%\Orçamentos\Oeste Saúde\02-Hospital Iamada.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\03-Hospital e Maternidade Nossa Senhora das Graças.jpg, %A_Desktop%\Orçamentos\Oeste Saúde\03-Hospital e Maternidade Nossa Senhora das Graças.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\abrangência.png, %A_Desktop%\Orçamentos\Oeste Saúde\abrangência.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\carências.png, %A_Desktop%\Orçamentos\Oeste Saúde\carências.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\CM_1.jpg, %A_Desktop%\Orçamentos\Oeste Saúde\CM_1.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\CM_2.jpg, %A_Desktop%\Orçamentos\Oeste Saúde\CM_2.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\CM_3.jpg, %A_Desktop%\Orçamentos\Oeste Saúde\CM_3.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\CM_4.jpg, %A_Desktop%\Orçamentos\Oeste Saúde\CM_4.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\Cred2 - Telemedicina.jpg, %A_Desktop%\Orçamentos\Oeste Saúde\Cred2 - Telemedicina.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\Diag1 - Cadri - Centro Avançado de Radiologia.jpg, %A_Desktop%\Orçamentos\Oeste Saúde\Diag1 - Cadri - Centro Avançado de Radiologia.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\Diag2-Instituto de Radiologia de Presidente Prudente.jpg, %A_Desktop%\Orçamentos\Oeste Saúde\Diag2-Instituto de Radiologia de Presidente Prudente.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\Diag3-Med Rad - Serviço de Radiologia e Ultrassonografia.jpg, %A_Desktop%\Orçamentos\Oeste Saúde\Diag3-Med Rad - Serviço de Radiologia e Ultrassonografia.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\Espec1 - Instituto do Coração.jpg, %A_Desktop%\Orçamentos\Oeste Saúde\Espec1 - Instituto do Coração.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\Espec2 - Instituto RH - Hematologia Hemoterapia.jpg, %A_Desktop%\Orçamentos\Oeste Saúde\Espec2 - Instituto RH - Hematologia Hemoterapia.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\Fisio1 - Clínica de Ortopedia e Fraturas.png, %A_Desktop%\Orçamentos\Oeste Saúde\Fisio1 - Clínica de Ortopedia e Fraturas.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\Lab - Laboratório de Análises Clínicas Marlene Spir.jpg, %A_Desktop%\Orçamentos\Oeste Saúde\Lab - Laboratório de Análises Clínicas Marlene Spir.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\Lab1-Centro de Análises Clínicas - Unilab.jpg, %A_Desktop%\Orçamentos\Oeste Saúde\Lab1-Centro de Análises Clínicas - Unilab.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Oeste Saúde\Lab2-Laboratório de Análises Clínicas Unoeste (Apec).jpg, %A_Desktop%\Orçamentos\Oeste Saúde\Lab2-Laboratório de Análises Clínicas Unoeste (Apec).jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    
    FileInstall, Santa Casa\abramge.png, %A_Desktop%\Orçamentos\Santa Casa\abramge.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Santa Casa\carencia_ca.png, %A_Desktop%\Orçamentos\Santa Casa\carencia_ca.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Santa Casa\carencia_pme.png, %A_Desktop%\Orçamentos\Santa Casa\carencia_pme.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Santa Casa\centroclinico.png, %A_Desktop%\Orçamentos\Santa Casa\centroclinico.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Santa Casa\cepac.png, %A_Desktop%\Orçamentos\Santa Casa\cepac.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Santa Casa\coberturas.jpg, %A_Desktop%\Orçamentos\Santa Casa\coberturas.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Santa Casa\fachada.png, %A_Desktop%\Orçamentos\Santa Casa\fachada.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Santa Casa\ir.png, %A_Desktop%\Orçamentos\Santa Casa\ir.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Santa Casa\Logo.png, %A_Desktop%\Orçamentos\Santa Casa\Logo.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Santa Casa\SC Bio Nuclear.png, %A_Desktop%\Orçamentos\Santa Casa\SC Bio Nuclear.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Santa Casa\SC DIAP.png, %A_Desktop%\Orçamentos\Santa Casa\SC DIAP.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Santa Casa\telemedicina.jpg, %A_Desktop%\Orçamentos\Santa Casa\telemedicina.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    
    FileInstall, Sermed\abramge.png, %A_Desktop%\Orçamentos\Sermed\abramge.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Sermed\Baracchini.jpg, %A_Desktop%\Orçamentos\Sermed\Baracchini.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Sermed\Carencias.png, %A_Desktop%\Orçamentos\Sermed\Carencias.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Sermed\Hospital Santa Casa Sertaozinho.png, %A_Desktop%\Orçamentos\Sermed\Hospital Santa Casa Sertaozinho.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Sermed\Hospital Santa Lydia.png, %A_Desktop%\Orçamentos\Sermed\Hospital Santa Lydia.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Sermed\Hospital Sao Lucas 2.png, %A_Desktop%\Orçamentos\Sermed\Hospital Sao Lucas 2.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Sermed\Hospital Sao Lucas Ribeirania.jpg, %A_Desktop%\Orçamentos\Sermed\Hospital Sao Lucas Ribeirania.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Sermed\Humberto de Queiroz.png, %A_Desktop%\Orçamentos\Sermed\Humberto de Queiroz.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Sermed\laboratorio behring.png, %A_Desktop%\Orçamentos\Sermed\laboratorio behring.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Sermed\Maternidade Sinha Junqueira.png, %A_Desktop%\Orçamentos\Sermed\Maternidade Sinha Junqueira.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Sermed\Sabin.png, %A_Desktop%\Orçamentos\Sermed\Sabin.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Sermed\Sermed Coberturas.png, %A_Desktop%\Orçamentos\Sermed\Sermed Coberturas.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Sermed\Sermed Saude.png, %A_Desktop%\Orçamentos\Sermed\Sermed Saude.png, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Sermed\Sermed_telemedicina.jpg, %A_Desktop%\Orçamentos\Sermed\Sermed_telemedicina.jpg, 1
    Guicontrol, atualizacao: , progresso, +2
    
    FileInstall, atualização.exe, %A_Desktop%\Orçamentos\atualização.exe, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, Kaizen.exe, %A_Desktop%\Orçamentos\Kaizen.exe, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, syspin.exe, %A_Desktop%\Orçamentos\syspin.exe, 1
    Guicontrol, atualizacao: , progresso, +2
    FileInstall, versao.ini, %A_Desktop%\Orçamentos\versao.ini, 1
    Guicontrol, atualizacao: , progresso, +2Guicontrol, atualizacao: , progresso, +2

    While !FileExist(A_Desktop "\Orçamentos\syspin.exe")
        Sleep 500
    Guicontrol, atualizacao: , progresso, +2

    While !FileExist(A_Desktop "\Orçamentos\Kaizen.exe")
        Sleep 500
    Guicontrol, atualizacao: , progresso, +2

    Runwait %A_Desktop%\Orçamentos\syspin.exe "%A_Desktop%\Orçamentos\Kaizen 2.exe" 5387, %A_Desktop%\Orçamentos, Hide
    Runwait %A_Desktop%\Orçamentos\syspin.exe "%A_Desktop%\Orçamentos\Kaizen.exe" 5386, %A_Desktop%\Orçamentos, Hide
    Guicontrol, atualizacao: , progresso, 100
    MsgBox, 262208, Concluído, Instalação concluída.

    IniRead, ver_2, temp\versao.ini, conf, version
    IniWrite, %ver_2%, versao.ini, conf, version
    FileRemoveDir, %A_Desktop%\Orçamentos\temp, 1
    FileDelete, %A_Desktop%\Orçamentos\syspin.exe
    Exitapp

opening() {
    Run %A_Desktop%\Orçamentos\Kaizen.exe, %A_Desktop%\Orçamentos
}