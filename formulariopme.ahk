formulariopme:
menu_close()
Gui, 9: Destroy
Gui, 9: -Sysmenu

;~ --------------------------------------Botôes
Gui, 9: Add, Button, x15 y420 w90 h40 genviarpme, Enviar
Gui, 9: Add, Button, x+12 w90 h40 gcancelar9, Cancelar
Gui, 9: Add, Text, x10 w260 h15 , * Campos marcados com asterisco são obrigatórios.
;~ --------------------------------------Titulo
Gui, 9: font, w700 s15
Gui, 9: Add, Text, x12 y2 w400 h22, PME
Gui, 9: font, w700 s8

Gui, 9: Font, w700
Gui, 9: Add, Tab3, x10 y30 cblack, Informações|+ Dependentes
Gui, 9: Font, W400
;~ --------------------------------------Grupos
Gui, 9: Add, GroupBox, x20 y50 w410 h350,
Gui, 9: Add, GroupBox, x+5 w580 h350, Dependentes

;~ --------------------------------------Campos
Gui, 9: Add, DropDownList, x30 y85 w120 h40  r5 vestadocivil, Casado(a)|Solteiro(a)|Separado(a)|Divorciado(a)|Viúvo(a)
Gui, 9: Add, Edit, x+10 w260 h20 vemail,

Gui, 9: Add, Edit, x30 y+25 w120 h20 vtelefone,
Gui, 9: Add, Edit, x+10 w140 h20 vtelefone2,
Gui, 9: Add, Edit, x+10 w110 h20 vvigencia,

Gui, 9: Add, DropDownList, x30 y+25 w189 h20 r3 voperadora goperpme, Santa Casa|Sermed|Benevida
Gui, 9: Add, DropDownList, x+10  w189 h10 r7 vplano,

Gui, 9: Add, DropDownList, x30 y+25 w267 h10 r11 vtipodeplano,
Gui, 9: Add, Edit, x+10 w110 h20 vvaloradesao,

Gui, 9: Add, DropDownList, x30 y+25 w110 h10 r2 vjateveplano gescolha1pme, Sim|Não
Gui, 9: Add, Edit, x+10 w140 h20 vqualplano,
Gui, 9: Add, Edit, x+10 w117 h20 vdatadoplano,

Gui, 9: Add, Edit, x30 y+25 w189 h20 vnomeempresa,
Gui, 9: Add, Radio, x+25 h20 vempresa, Empresa
Gui, 9: Add, Radio, x+25 h20 vcolaborador, Colaborador

Gui, 9: Add, Edit, x30 y+33 w189 h20 vnometitular,
Gui, 9: Add, Edit, x+10 w189 h20 vleadmonday,

;~ --------------------------------------Textos
Gui, 9: Add, Text, x30 y70 w120 h15, Estado Civil  ;1
Gui, 9: Add, Text, x+10 w260 h15, E-mail*  ;1

Gui, 9: Add, Text, x30 y+30 w120 h15, Telefone* ;2
Gui, 9: Add, Text, x+10 w140 h15, Telefone Secundário ;2
Gui, 9: Add, Text, x+10 w110 h15, Vigência* ;2

Gui, 9: Add, Text, x30 y+30 w189 h15, Operadora* ;3
Gui, 9: Add, Text, x+10 w189 h15, Produto* ;3

Gui, 9: Add, Text, x30 y+30 w267 h15, Tipo de Plano* ;4
Gui, 9: Add, Text, x+10 w110 h15, Valor da Adesão* ;4

Gui, 9: Add, Text, x30 y+30 w110 h15, Possui plano ativo?* ;5
Gui, 9: Add, Text, x+10 w140 h15, Qual Plano? ;5
Gui, 9: Add, Text, x+10 w110 h15, Data do Plano ;5

Gui, 9: Add, Text, x30 y+30 w189 h15 , Nome da Empresa ;6
Gui, 9: Add, GroupBox, x+10 w189 h45, Fatura para:* ;6

Gui, 9: Add, Text, x30 y+7 w189 h15, Nome do Titular* ;7
Gui, 9: Add, Text, x+10 w189 h15, Nome do Lead (Monday)* ;7

;~ --------------------------------------Campos
Gui, 9: Add, DropDownList, x442 y85 w80 h20 r5 vvinc1, Esposo(a)|Filho(a)|Colaborador(a)|Sócio(a)|*Titular*
Gui, 9: Add, Edit, x+10 w150 h20 vnome1,
Gui, 9: Add, Edit, x+10 w150 h20 vemail1,
Gui, 9: Add, Edit, x+10 w150 h20 vtelvinc1,
Gui, 9: Add, DropDownList, x442 y+25 w80 h20 r5 vvinc2 , Esposo(a)|Filho(a)|Colaborador(a)|Sócio(a)|*Titular*
Gui, 9: Add, Edit, x+10 w150 h20 vnome2,
Gui, 9: Add, Edit, x+10 w150 h20 vemail2,
Gui, 9: Add, Edit, x+10 w150 h20 vtelvinc2,
Gui, 9: Add, DropDownList, x442 y+25 w80 h20 r5 vvinc3, Esposo(a)|Filho(a)|Colaborador(a)|Sócio(a)|*Titular*
Gui, 9: Add, Edit, x+10 w150 h20 vnome3,
Gui, 9: Add, Edit, x+10 w150 h20 vemail3,
Gui, 9: Add, Edit, x+10 w150 h20 vtelvinc3,
Gui, 9: Add, DropDownList, x442 y+25 w80 h20 r5 vvinc4 , Esposo(a)|Filho(a)|Colaborador(a)|Sócio(a)|*Titular*
Gui, 9: Add, Edit, x+10 w150 h20 vnome4,
Gui, 9: Add, Edit, x+10 w150 h20 vemail4,
Gui, 9: Add, Edit, x+10 w150 h20 vtelvinc4,
Gui, 9: Add, DropDownList, x442 y+25 w80 h20 r5 vvinc5 , Esposo(a)|Filho(a)|Colaborador(a)|Sócio(a)|*Titular*
Gui, 9: Add, Edit, x+10 w150 h20 vnome5,
Gui, 9: Add, Edit, x+10 w150 h20 vemail5,
Gui, 9: Add, Edit, x+10 w150 h20 vtelvinc5,
Gui, 9: Add, DropDownList, x442 y+25 w80 h20 r5 vvinc6, Esposo(a)|Filho(a)|Colaborador(a)|Sócio(a)|*Titular*
Gui, 9: Add, Edit, x+10 w150 h20 vnome6,
Gui, 9: Add, Edit, x+10 w150 h20 vemail6,
Gui, 9: Add, Edit, x+10 w150 h20 vtelvinc6,
Gui, 9: Add, DropDownList, x442 y+25 w80 h20 r5 vvinc7, Esposo(a)|Filho(a)|Colaborador(a)|Sócio(a)|*Titular*
Gui, 9: Add, Edit, x+10 w150 h20 vnome7,
Gui, 9: Add, Edit, x+10 w150 h20 vemail7,
Gui, 9: Add, Edit, x+10 w150 h20 vtelvinc7,

;~ --------------------------------------Textos
Gui, 9: Add, Text, x442 y70 w90 h15, Vínculo 1
Gui, 9: Add, Text, x+0 w150 h15, Nome
Gui, 9: Add, Text, x+10 w150 h15, E-mail
Gui, 9: Add, Text, x+10 w150 h15, Telefone
Gui, 9: Add, Text, x442 y+30 w90 h15, Vínculo 2
Gui, 9: Add, Text, x+0 w150 h15, Nome
Gui, 9: Add, Text, x+10 w150 h15, E-mail
Gui, 9: Add, Text, x+10 w150 h15, Telefone
Gui, 9: Add, Text, x442 y+30 w90 h15, Vínculo 3
Gui, 9: Add, Text, x+0 w150 h15, Nome
Gui, 9: Add, Text, x+10 w150 h15, E-mail
Gui, 9: Add, Text, x+10 w150 h15, Telefone
Gui, 9: Add, Text, x442 y+30 w90 h15, Vínculo 4
Gui, 9: Add, Text, x+0 w150 h15, Nome
Gui, 9: Add, Text, x+10 w150 h15, E-mail
Gui, 9: Add, Text, x+10 w150 h15, Telefone
Gui, 9: Add, Text, x442 y+30 w90 h15, Vínculo 5
Gui, 9: Add, Text, x+0 w150 h15, Nome
Gui, 9: Add, Text, x+10 w150 h15, E-mail
Gui, 9: Add, Text, x+10 w150 h15, Telefone
Gui, 9: Add, Text, x442 y+30 w90 h15, Vínculo 6
Gui, 9: Add, Text, x+0 w150 h15, Nome
Gui, 9: Add, Text, x+10 w150 h15, E-mail
Gui, 9: Add, Text, x+10 w150 h15, Telefone
Gui, 9: Add, Text, x442 y+30 w90 h15, Vínculo 7
Gui, 9: Add, Text, x+0 w150 h15, Nome
Gui, 9: Add, Text, x+10 w150 h15, E-mail
Gui, 9: Add, Text, x+10 w150 h15, Telefone

Gui, 9: Tab, + Dependentes
;~ --------------------------------------Campos 2
Gui, 9: Add, DropDownList, x30 y85 w80 h20 r5 vvinc8, Esposo(a)|Filho(a)|Colaborador(a)|Sócio(a)|*Titular*
Gui, 9: Add, Edit, x+10 w150 h20 vnome8,
Gui, 9: Add, Edit, x+10 w150 h20 vemail8,
Gui, 9: Add, Edit, x+10 w150 h20 vtelvinc8,
Gui, 9: Add, DropDownList, x30 y+25 w80 h20 r5 vvinc9, Esposo(a)|Filho(a)|Colaborador(a)|Sócio(a)|*Titular*
Gui, 9: Add, Edit, x+10 w150 h20 vnome9,
Gui, 9: Add, Edit, x+10 w150 h20 vemail9,
Gui, 9: Add, Edit, x+10 w150 h20 vtelvinc9,
Gui, 9: Add, DropDownList, x30 y+25 w80 h20 r5 vvinc10, Esposo(a)|Filho(a)|Colaborador(a)|Sócio(a)|*Titular*
Gui, 9: Add, Edit, x+10 w150 h20 vnome10,
Gui, 9: Add, Edit, x+10 w150 h20 vemail10,
Gui, 9: Add, Edit, x+10 w150 h20 vtelvinc10,
Gui, 9: Add, DropDownList, x30 y+25 w80 h20 r5 vvinc11, Esposo(a)|Filho(a)|Colaborador(a)|Sócio(a)|*Titular*
Gui, 9: Add, Edit, x+10 w150 h20 vnome11,
Gui, 9: Add, Edit, x+10 w150 h20 vemail11,
Gui, 9: Add, Edit, x+10 w150 h20 vtelvinc11,
Gui, 9: Add, DropDownList, x30 y+25 w80 h20 r5 vvinc12, Esposo(a)|Filho(a)|Colaborador(a)|Sócio(a)|*Titular*
Gui, 9: Add, Edit, x+10 w150 h20 vnome12,
Gui, 9: Add, Edit, x+10 w150 h20 vemail12,
Gui, 9: Add, Edit, x+10 w150 h20 vtelvinc12,
Gui, 9: Add, DropDownList, x30 y+25 w80 h20 r5 vvinc13, Esposo(a)|Filho(a)|Colaborador(a)|Sócio(a)|*Titular*
Gui, 9: Add, Edit, x+10 w150 h20 vnome13,
Gui, 9: Add, Edit, x+10 w150 h20 vemail13,
Gui, 9: Add, Edit, x+10 w150 h20 vtelvinc13,
Gui, 9: Add, DropDownList, x30 y+25 w80 h20 r5 vvinc14, Esposo(a)|Filho(a)|Colaborador(a)|Sócio(a)|*Titular*
Gui, 9: Add, Edit, x+10 w150 h20 vnome14,
Gui, 9: Add, Edit, x+10 w150 h20 vemail14,
Gui, 9: Add, Edit, x+10 w150 h20 vtelvinc14,

;~ --------------------------------------Textos 2
Gui, 9: Add, Text, x30 y70 w90 h15, Vínculo 8
Gui, 9: Add, Text, x+0 w150 h15 , Nome
Gui, 9: Add, Text, x+10 w150 h15 , E-mail
Gui, 9: Add, Text, x+10 w150 h15, Telefone
Gui, 9: Add, Text, x30 y+30 w90 h15 , Vínculo 9
Gui, 9: Add, Text, x+0 w150 h15 , Nome
Gui, 9: Add, Text, x+10 w150 h15 , E-mail
Gui, 9: Add, Text, x+10 w150 h15, Telefone
Gui, 9: Add, Text, x30 y+30 w90 h15 , Vínculo 10
Gui, 9: Add, Text, x+0 w150 h15 , Nome
Gui, 9: Add, Text, x+10 w150 h15 , E-mail
Gui, 9: Add, Text, x+10 w150 h15, Telefone
Gui, 9: Add, Text, x30 y+30 w90 h15 , Vínculo 11
Gui, 9: Add, Text, x+0 w150 h15 , Nome
Gui, 9: Add, Text, x+10 w150 h15 , E-mail
Gui, 9: Add, Text, x+10 w150 h15, Telefone
Gui, 9: Add, Text, x30 y+30 w90 h15 , Vínculo 12
Gui, 9: Add, Text, x+0 w150 h15 , Nome
Gui, 9: Add, Text, x+10 w150 h15 , E-mail
Gui, 9: Add, Text, x+10 w150 h15, Telefone
Gui, 9: Add, Text, x30 y+30 w90 h15 , Vínculo 13
Gui, 9: Add, Text, x+0 w150 h15 , Nome
Gui, 9: Add, Text, x+10 w150 h15 , E-mail
Gui, 9: Add, Text, x+10 w150 h15, Telefone
Gui, 9: Add, Text, x30 y+30 w90 h15 , Vínculo 14
Gui, 9: Add, Text, x+0 w150 h15 , Nome
Gui, 9: Add, Text, x+10 w150 h15 , E-mail
Gui, 9: Add, Text, x+10 w150 h15, Telefone

	GuiControl, 9: Hide, datadoplano
	GuiControl, 9: Hide, qualplano
	GuiControl, 9: Hide, Qual Plano?
	GuiControl, 9: Hide, Data do Plano
	
Gui, 9: Show,, Formulário Documentos - PME
return

operpme:
	Gui, 9: Submit, NoHide
	if(operadora=="Sermed")
		{
			GuiControl,, plano, |
			GuiControl,, tipodeplano, |
			GuiControl,, plano, PME
			GuiControl,, tipodeplano, Union Hospitalar Standard|Union Hospitalar Executivo|Union Completo Standard|Union Completo Executivo|Tradicional Standard|Tradicional Executivo|Somente Odonto
			GuiControl, Choose, plano, 1
		}
	else if(operadora=="Santa Casa")
		{
			GuiControl,, plano, |
			GuiControl,, tipodeplano, |
			GuiControl,, plano, PME
			GuiControl,, tipodeplano, Controle Enfermaria Com Copart|Controle Apto Com Copart|Premium Com Copart|Standart Sem Copart|Executivo Sem Copart|Controle Enfermaria Com Copart + Odonto|Controle Apto Com Copart + Odonto|Premium Com Copart + Odonto|Standart Sem Copart + Odonto|Executivo Sem Copart + Odonto|Somente Odonto
			GuiControl, Choose, plano, 1
		}
	else if(operadora=="Benevida")
		{
			GuiControl,, plano, |
			GuiControl,, tipodeplano, |
			GuiControl,, plano, PME
			GuiControl,, tipodeplano, Standard com Copart|Executivo com Copart|Standard sem Copart|Executivo sem Copart
			GuiControl, Choose, plano, 1
		}
Return

escolha1pme:
	Gui, 9: Submit, NoHide
	if(jateveplano=="Não")
		{
			GuiControl, Hide, datadoplano
			GuiControl, Hide, qualplano
			GuiControl, Hide, Qual Plano?
			GuiControl, Hide, Data do Plano
		}
	else
		{
			GuiControl, Show, datadoplano
			GuiControl, Show, qualplano
			GuiControl, Show, Qual Plano?
			GuiControl, Show, Data do Plano
		}
return


sentpme:
{
if (empresa==false) && (colaborador==false)
{
	Msgbox O campo "Fatura para:" não está selecionado.
}
else
{	
	Gui, 9: Submit
	StringUpper, plano, plano
	StringUpper, operadora, operadora
	StringUpper, leadmonday, leadmonday, T
	StringUpper, nometitular, nometitular, T
	MsgBox, 262193, Selecionar Janela , Selecione a janela que irá enviar a proposta e clique em Ok.
		IfMsgBox OK
		{
		WinActivate, "A"
		Sleep, 500
		SendInput, *%operadora%* - *%plano%*^`n*%tipodeplano%*^`n-------------^`n*Nome do Lead (Monday):* %leadmonday%^`n*Nome do Titular:* %nometitular%^`n*Estado Civil:* %estadocivil%^`n*E-mail:* %email%^`n*Telefone:* %telefone%^`n*Telefone Secundário:* %telefone2%^`n*Vigência:* %vigencia%^`n*Valor da Adesão:* %valoradesao%^`n*Já teve plano:* %jateveplano%^`n*Qual Plano?* %qualplano%^`n*Data do Plano:* %datadoplano%^`n*Nome da Empresa:* %nomeempresa%
			if (empresa==true)
			{
			SendInput, ^`n*Fatura para:* Empresa
			}
			else if (colaborador==true)
			{
			SendInput, ^`n*Fatura para:* Colaborador
			}
			else
			{
			Msgbox O campo "Fatura para:" não está selecionado.
			}
	;============================ Dependente 1
			if nome1 is not Space
			{
			Sendinput ^`n------------^`n*Vínculo 1:* %vinc1%^`n*Nome 1:* %nome1%^`n*E-mail 1*: %email1%^`n*Telefone 1: %telvinc1%
			}
			else
			{}
	;============================ Dependente 2
			if nome2 is not Space
			{
			Sendinput ^`n------------^`n*Vínculo 2:* %vinc2%^`n*Nome 2:* %nome2%^`n*E-mail 2*: %email2%^`n*Telefone 1: %telvinc2%
			}
			else
			{}
	;============================ Dependente 3
			if nome3 is not Space
			{
			Sendinput ^`n------------^`n*Vínculo 3:* %vinc3%^`n*Nome 3:* %nome3%^`n*E-mail 3*: %email3%^`n*Telefone 1: %telvinc3%
			}
			else
			{}
	;============================ Dependente 4
			if nome4 is not Space
			{
			Sendinput ^`n------------^`n*Vínculo 4:* %vinc4%^`n*Nome 4:* %nome4%^`n*E-mail 4*: %email4%^`n*Telefone 1: %telvinc4%
			}
			else
			{}
	;============================ Dependente 5
			if nome5 is not Space
			{
			Sendinput ^`n------------^`n*Vínculo 5:* %vinc5%^`n*Nome 5:* %nome5%^`n*E-mail 5*: %email5%^`n*Telefone 1: %telvinc5%
			}
			else
			{}
	;============================ Dependente 6
			if nome6 is not Space
			{
			Sendinput ^`n------------^`n*Vínculo 6:* %vinc6%^`n*Nome 6:* %nome6%^`n*E-mail 6*: %email6%^`n*Telefone 1: %telvinc6%
			}
			else
			{}
	;============================ Dependente 7
			if nome7 is not Space
			{
			Sendinput ^`n------------^`n*Vínculo 7:* %vinc7%^`n*Nome 7:* %nome7%^`n*E-mail 7*: %email7%^`n*Telefone 1: %telvinc7%
			}
			else
			{}
	;============================ Dependente 8
			if nome8 is not Space
			{
			Sendinput ^`n------------^`n*Vínculo 8:* %vinc8%^`n*Nome 8:* %nome8%^`n*E-mail 8*: %email8%^`n*Telefone 1: %telvinc8%
			}
			else
			{}
	;============================ Dependente 9
			if nome9 is not Space
			{
			Sendinput ^`n------------^`n*Vínculo 9:* %vinc9%^`n*Nome 9:* %nome9%^`n*E-mail 9*: %email9%^`n*Telefone 1: %telvinc9%
			}
			else
			{}
	;============================ Dependente 10
			if nome10 is not Space
			{
			Sendinput ^`n------------^`n*Vínculo 10:* %vinc10%^`n*Nome 10:* %nome10%^`n*E-mail 10*: %email10%^`n*Telefone 1: %telvinc10%
			}
			else
			{}
	;============================ Dependente 11
			if nome11 is not Space
			{
			Sendinput ^`n------------^`n*Vínculo 11:* %vinc11%^`n*Nome 11:* %nome11%^`n*E-mail 11*: %email11%^`n*Telefone 1: %telvinc11%
			}
			else
			{}
	;============================ Dependente 12
			if nome12 is not Space
			{
			Sendinput ^`n------------^`n*Vínculo 12:* %vinc12%^`n*Nome 12:* %nome12%^`n*E-mail 12*: %email12%^`n*Telefone 1: %telvinc12%
			}
			else
			{}
	;============================ Dependente 13
			if nome13 is not Space
			{
			Sendinput ^`n------------^`n*Vínculo 13:* %vinc13%^`n*Nome 13:* %nome13%^`n*E-mail 13*: %email13%^`n*Telefone 1: %telvinc13%
			}
			else
			{}
	;============================ Dependente 14
			if nome14 is not Space
			{
			Sendinput ^`n------------^`n*Vínculo 14:* %vinc14%^`n*Nome 14:* %nome14%^`n*E-mail 14*: %email14%^`n*Telefone 1: %telvinc14%
			}
			else
			{}
		Send {Enter}
		Gui, 9: Destroy
	}
	else
	{
		Reload
	}
}
}
return


enviarpme:
Gui, 9: Submit, Nohide
if (telefone = "") || (email = "") || (vigencia = "") || (operadora = "") || (plano = "") || (tipodeplano = "") || (valoradesao = "") || (jateveplano = "") || (nometitular = "") || (leadmonday = "")
{
	Msgbox Algum campo obrigatório não está preenchido.
}
else
{
	goto sentpme
}
return

cancelar9:
	Gui, 9: Destroy
return