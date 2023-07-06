formularioca:
	menu_close()
	Gui, 5: Destroy
	Gui, 5: -Sysmenu

	;~ --------------------------------------Titulo
		Gui, 5: font, s15
		Gui, 5: Add, Text, x12 y2 w400 h22, Coletivo por Adesão
		Gui, 5: font, s8

	;~ --------------------------------------Grupos
		Gui, 5: Add, GroupBox, x5 y30 w410 h345, Informações
		Gui, 5: Add, GroupBox, x+5 w410 h345, Dependentes

	;~ --------------------------------------Campos
		Gui, 5: Add, DropDownList, x15 y70 w120 h40 r5 vestadocivil, Casado(a)|Solteiro(a)|Separado(a)|Divorciado(a)|Viúvo(a)
		Gui, 5: Add, Edit, x+10 w260 h20 vemail,

		Gui, 5: Add, Edit, x15 y+25 w120 h20 vtelefone,
		Gui, 5: Add, Edit, x+10 w140 h20 vtelefone2,
		Gui, 5: Add, Edit, x+10 w110 h20 vvigencia,

		Gui, 5: Add, DropDownList, x15 y+25 w269 h20 r4 voperadora goper, Santa Casa|Sermed|Benevida
		Gui, 5: Add, Edit, x+10 w110 h20 vhorariocontato ,

		Gui, 5: Add, DropDownList, x15 y+25 w205 h10 r7 vplano,
		Gui, 5: Add, Edit, x+10 w173 h20 vcity,

		Gui, 5: Add, DropDownList, x15 y+25 w267 h10 r11 vtipodeplano,
		Gui, 5: Add, Edit, x+10 w110 h20 vvaloradesao,

		Gui, 5: Add, DropDownList, x15 y+25 w110 h10 r2 vjateveplano gescolha1, Sim|Não
		Gui, 5: Add, Edit, x+10 w140 h20 vqualplano,
		Gui, 5: Add, Edit, x+10 w110 h20 vdatadoplano,

		Gui, 5: Add, Edit, x15 y+25 w189 h20 vnometitular,
		Gui, 5: Add, Edit, x+10 w189 h20 vleadmonday,

	;~ --------------------------------------Botôes
		Gui, 5: Add, Button, x15 y+25 w90 h40 genviar, Enviar
		Gui, 5: Add, Button, x+12 w90 h40 gcancelar5, Cancelar

	;~ --------------------------------------Textos
		Gui, 5: Add, Text, x15 y55 w120 h15 , Estado Civil
		Gui, 5: Add, Text, x+10 w260 h15 , E-mail*

		Gui, 5: Add, Text, x15 y+30 w120 h15 , Telefone*
		Gui, 5: Add, Text, x+10 w140 h15 , Telefone Secundário
		Gui, 5: Add, Text, x+10 w110 h15 , Vigência*

		Gui, 5: Add, Text, x15 y+30 w269 h15 , Operadora*
		Gui, 5: Add, Text, x+10 w110 h15 , Horário para Contato

		Gui, 5: Add, Text, x15 y+30 w205 h15 , Produto*
		Gui, 5: Add, Text, x+10 w160 h15 , Cidade da Venda

		Gui, 5: Add, Text, x15 y+30 w267 h15 , Tipo de Plano*
		Gui, 5: Add, Text, x+10 w110 h15 , Valor da Adesão*

		Gui, 5: Add, Text, x15 y+30 w110 h15 , Possui plano ativo?*
		Gui, 5: Add, Text, x+10 w140 h15 , Qual Plano?
		Gui, 5: Add, Text, x+10 w110 h15 , Data do Plano

		Gui, 5: Add, Text, x15 y+30 w189 h15 , Nome do Titular*
		Gui, 5: Add, Text, x+10 w189 h15 , Nome do Lead (Monday)*

	;~ --------------------------------------Campos
		Gui, 5: Add, DropDownList, x432 y70 w120 h20 r2 vvinc1, Esposo(a)|Filho(a)
		Gui, 5: Add, Edit, x+10 w260 h20 vnome1, 
		Gui, 5: Add, DropDownList, x432 y+25 w120 h20 r2 vvinc2 , Esposo(a)|Filho(a)
		Gui, 5: Add, Edit, x+10 w260 h20 vnome2,
		Gui, 5: Add, DropDownList, x432 y+25 w120 h20 r2 vvinc3, Esposo(a)|Filho(a)
		Gui, 5: Add, Edit, x+10 w260 h20 vnome3,
		Gui, 5: Add, DropDownList, x432 y+25 w120 h20 r2 vvinc4 , Esposo(a)|Filho(a)
		Gui, 5: Add, Edit, x+10 w260 h20 vnome4,
		Gui, 5: Add, DropDownList, x432 y+25 w120 h20 r2 vvinc5 , Esposo(a)|Filho(a)
		Gui, 5: Add, Edit, x+10 w260 h20 vnome5,
		Gui, 5: Add, DropDownList, x432 y+25 w120 h20 r2 vvinc6, Esposo(a)|Filho(a)
		Gui, 5: Add, Edit, x+10 w260 h20 vnome6,

	;~ --------------------------------------Textos
		Gui, 5: Add, Text, x430 y55 w130 h15, Vínculo do dependente 1
		Gui, 5: Add, Text, x+10 w260 h15 , Nome
		Gui, 5: Add, Text, x430 y+30 w130 h15 , Vínculo do dependente 2
		Gui, 5: Add, Text, x+10 w260 h15 , Nome
		Gui, 5: Add, Text, x430 y+30 w130 h15 , Vínculo do dependente 3
		Gui, 5: Add, Text, x+10 w260 h15 , Nome
		Gui, 5: Add, Text, x430 y+30 w130 h15 , Vínculo do dependente 4
		Gui, 5: Add, Text, x+10 w260 h15 , Nome
		Gui, 5: Add, Text, x430 y+30 w130 h15 , Vínculo do dependente 5
		Gui, 5: Add, Text, x+10 w260 h15 , Nome
		Gui, 5: Add, Text, x430 y+30 w130 h15 , Vínculo do dependente 6
		Gui, 5: Add, Text, x+10 w260 h15 , Nome

	Gui, 5: Add, Text, x10 w260 h15 , * Campos marcadas com asterisco são obrigatórios.

		GuiControl, 5: Hide, datadoplano
		GuiControl, 5: Hide, qualplano
		GuiControl, 5: Hide, Qual Plano?
		GuiControl, 5: Hide, Data do Plano
		
	Gui, 5: Show,, Formulário Documentos - Coletivo por Adesão
return

oper:
	Gui, 5: Submit, NoHide
	if(operadora=="Santa Casa") {
		GuiControl,, plano, |Coletivo por Adesão
		GuiControl,, tipodeplano, |Controle Enfermaria Com Copart|Controle Apto Com Copart|Premium Com Copart|Standart Sem Copart|Executivo Sem Copart|Controle Enfermaria Com Copart + Odonto|Controle Apto Com Copart + Odonto|Premium Com Copart + Odonto|Standart Sem Copart + Odonto|Executivo Sem Copart + Odonto|Somente Odonto
		GuiControl, Choose, plano, 1
	}
	else if (operadora=="Sermed") {
		GuiControl,, plano, |Coletivo por Adesão|Pessoa Física
		GuiControl,, tipodeplano, |Union Hospitalar Standard|Union Hospitalar Executivo|Union Completo Standard|Union Completo Executivo|Medida Certa Standard|Medida Certa Executivo|Somente Odonto
		GuiControl, Choose, plano, 1
	}
	else if (operadora=="Benevida") {
		GuiControl,, plano, |Coletivo por Adesão
		GuiControl,, tipodeplano, |Standard com Copart|Executivo com Copart|Standard sem Copart|Executivo sem Copart
		GuiControl, Choose, plano, 1
	}
Return

escolha1:
	Gui, 5: Submit, NoHide
	if(jateveplano=="Não") {
		GuiControl, Hide, datadoplano
		GuiControl, Hide, qualplano
		GuiControl, Hide, Qual Plano?
		GuiControl, Hide, Data do Plano
	}
	else {
		GuiControl, Show, datadoplano
		GuiControl, Show, qualplano
		GuiControl, Show, Qual Plano?
		GuiControl, Show, Data do Plano
	}
return

cancelar5:
	Gui, 5: Destroy
Return

notsent:
		MsgBox Algum campo obrigatório não está preenchido.
return

enviar:
Gui, 5: Submit, Nohide
	if (telefone = "") || (email = "") || (vigencia = "") || (operadora = "") || (plano = "") || (tipodeplano = "") || (valoradesao = "") || (jateveplano = "") || (nometitular = "") || (leadmonday = "") {
		MsgBox Algum campo obrigatório não está preenchido.
		Exit
	}
	Else
		Gui, 5: Submit

	StringUpper, plano, plano
	StringUpper, operadora, operadora
	StringUpper, leadmonday, leadmonday, T
	StringUpper, nometitular, nometitular, T
		
	if nome1 is not Space 
	{
		MsgBox, 262193, Selecionar Janela , Selecione a janela que irá enviar a proposta e clique em Ok.
		IfMsgBox OK
		{
			WinActivate, "A"
			Sleep, 500
			SendInput, *%operadora%* - *%plano%*^`n*%tipodeplano%*^`n-------------^`n*Nome do Lead (Monday):* %leadmonday%^`n*Nome do titular:* %nometitular%^`n*Estado Civil:* %estadocivil%^`n*E-mail:* %email%^`n*Telefone:* %telefone%^`n*Telefone Secundário:* %telefone2%^`n*Cidade da Venda:* %city%^`n*Vigência:* %vigencia%^`n*Horário para contato:* %horariocontato%^`n*Valor da Adesão:* %valoradesao%^`n*Já teve plano:* %jateveplano%^`n*Qual Plano?* %qualplano%^`n*Data do Plano:* %datadoplano%^`n------------^`n*Nome 1:* %nome1%^`n*Vínculo do Dependente 1:* %vinc1%^`n*Nome 2:* %nome2%^`n*Vínculo do Dependente 2:* %vinc2%^`n*Nome 3:* %nome3%^`n*Vínculo do Dependente 3:* %vinc3%^`n*Nome 4:* %nome4%^`n*Vínculo do Dependente 4:* %vinc4%^`n*Nome 5:* %nome5%^`n*Vínculo do Dependente 5:* %vinc5%^`n*Nome 6:* %nome6%^`n*Vínculo do Dependente 6:* %vinc6%
			Send, {Enter}
			Gui, 5: Destroy
		}
		else
			Exit
	}
	else {
		MsgBox, 262193, Selecionar Janela , Selecione a janela que irá enviar a proposta e clique em Ok.
		IfMsgBox OK
		{
			WinActivate, "A"
			Sleep, 500
			SendInput, *%operadora%* - *%plano%*^`n*%tipodeplano%*^`n-------------^`n*Nome do Lead (Monday):* %leadmonday%^`n*Nome do titular:* %nometitular%^`n*Estado Civil:* %estadocivil%^`n*E-mail:* %email%^`n*Telefone:* %telefone%^`n*Telefone Secundário:* %telefone2%^`n*Cidade da Venda:* %city%^`n*Vigência:* %vigencia%^`n*Horário para contato:* %horariocontato%^`n*Valor da Adesão:* %valoradesao%^`n*Já teve plano:* %jateveplano%^`n*Qual Plano?* %qualplano%^`n*Data do Plano:* %datadoplano%
			Send, {Enter}
		}
		else
			Exit
	}
return