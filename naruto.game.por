programa
{    inclua biblioteca Graficos --> g
	inclua biblioteca Util --> u
	inclua biblioteca Sons --> s
	inclua biblioteca Tipos --> tp
	inclua biblioteca Teclado --> tc
	inclua biblioteca Mouse --> m
	
	//Vetores para guardar os valores de ataque dos herois
	inteiro ataque_pain[2],ataque_naruto[2],ataque_gaara[2],ataque_rocklee[2],ataque_itachi[2]
	//Vetores para guardar os valores de defesa dos herois
	//Vetores para guardar os valores de ataque e defesa do primeiro heroi escolhido
	inteiro ataque_ninja1[2]
	//Vetores para guardar os valores de ataque e defesa do segundo heroi escolhido
	inteiro ataque_ninja2[2]
	//Variáveis que guardam os herois escolhidos
	inteiro ninja_escolhido1 = 0, ninja_escolhido2 = 0, vencedor = 0
	//Variáveis para controle de tela
	inteiro tela_atual = 0
	//Vetores para guardar os nomes dos herois
	cadeia nome_ninja[5] = {"pain","naruto","gaara","rock lee","itachi"}
	cadeia nome_ninja1 = "",nome_ninja2 = ""
	const inteiro pain = 1,naruto = 2,gaara = 3,rocklee = 4,itachi = 5, empate = 30
	const inteiro menu_principal = 11,tela_ninja1 = 13, tela_ninja2 = 14,sair = 12, tela_luta = 15,tela_novo_jogo = 20
	const inteiro altura = 910, largura = 512
	const inteiro ESC_NINJA1 = 195, ESC_NINJA2 = 245, ESC_LUTAR = 16
	//Vetores para cores RGB
	inteiro castanho[3] = {165,42,42}, branco[3] = {255,255,255},preto[3] = {0,0,0}, ciano_escuro[3] = {0,139,139},
	vermelho_escuro[3] = {139,0,0}, cor_barra_vida1[3] = {0,255,0}, cor_barra_vida2[3] = {0,255,0}, cor_msg_painel = 0
	inteiro VERMELHO_MAXIMO = 250,VERDE_MAXIMO = 250
	inteiro posy_seletor = 195,largura_seletor = 40,selecao = 0
	logico escolheu_ninja1 = falso,escolheu_ninja2 = falso
	cadeia campo1 = "", campo2 = "",campo3 = "Lutar" ,campo4 = "Sair", campo_painel = ""
	inteiro imagem_pain = g.carregar_imagem("pain.jpg"),imagem_naruto = g.carregar_imagem("naruto.jpg"),
	imagem_gaara = g.carregar_imagem("gaara.jpg"),imagem_rocklee = g.carregar_imagem("rocklee.jpg"),
	imagem_itachi = g.carregar_imagem("itachi.jpg"),fundo_principal = g.carregar_imagem("fundo.jpg")
	inteiro imagem_ninja1 = 0, imagem_ninja2 = 0, imagem_selecao_ninja = 0, imagem_selecao_menu = 0, imagem_selecao_menu2 = 0,
	nova_imagem1 = 0, nova_imagem2 = 0, imagem_empate1 = 0, imagem_empate2 = 0
	inteiro vida_atual1 = 0,vida_atual2 = 0
	const inteiro vida_maxima = 100
	cadeia info_barra1 = " ", info_barra2 = ""
	inteiro tamanho_barra1 = 0,tamanho_barra2 = 0,taxa1 = 0,taxa2 = 0
	const inteiro tamanho_barra_maxima = 400
	inteiro dano1 = 0,dano2 = 0
	inteiro contagem_ataque_ninja1 = 0,contagem_ataque_ninja2 = 0
	logico ninja1_atacando = falso, ninja2_atacando = falso
	inteiro botao_som = s.carregar_som("som_botao.mp3"),playbotao = 0,musica_fundo = s.carregar_som("music.mp3"),som_de_fundo,
	volume = 0
	
	funcao inicio()
	{
	tela_atual = menu_principal
	inicializar()
	tocar_musica_fundo()
	enquanto(tela_atual != sair){
	aumentar_volume_musica_fundo()	
	escolha(tela_atual){
	caso menu_principal:     imagem_menu_principalA() pare
	caso tela_ninja1: 		imagem_ninja1A()      	 pare
	caso tela_ninja2:	     imagem_ninja2A ()    	  pare
	caso tela_luta:		tela_lutaA() 			   pare
	caso tela_novo_jogo:	imagem_novo_jogoA()	 	    pare
		
		}
	   }
	}
	funcao gerar_poderes_ninjas(){
	ataque_pain[0]	= u.sorteia(5,20)
	ataque_pain[1] = u.sorteia(5,20)

	ataque_naruto[0] = u.sorteia(5,20)
	ataque_naruto[1] = u.sorteia(5,20)

	ataque_gaara[0] = u.sorteia(5,20)
	ataque_gaara[1] = u.sorteia(5,20)

	ataque_rocklee[0] = u.sorteia(5,20)
	ataque_rocklee[1] = u.sorteia(5,20)

	ataque_itachi[0] = u.sorteia(5,20)
	ataque_itachi[1] = u.sorteia(5,20)
}
	funcao criar_ninja1(inteiro at1, inteiro at2){
	ataque_ninja1[0] = at1
     ataque_ninja1[1] = at2
}
	funcao criar_ninja2(inteiro at1, inteiro at2){
	ataque_ninja2[0] = at1
     ataque_ninja2[1] = at2
}
	funcao inicializar(){
	g.iniciar_modo_grafico(verdadeiro)	
	g.definir_dimensoes_janela(altura, largura)
	g.definir_titulo_janela("naruto cards")
	}
	funcao pintar_tela(inteiro red,inteiro green,inteiro blue){
	inteiro nova_cor	
	nova_cor = g.criar_cor(red, green, blue)
	g.definir_cor(nova_cor)
	g.limpar()
	}
	funcao criar_ataques_ninja1(inteiro escolha1){
	escolha(escolha1){
	caso pain: criar_ninja1(ataque_pain[0], ataque_pain[1])

	pare
	
	caso naruto: criar_ninja1(ataque_naruto[0], ataque_naruto[1])

	pare

	caso gaara: criar_ninja1(ataque_gaara[0], ataque_gaara[1])

	pare
	
	caso rocklee: criar_ninja1(ataque_rocklee[0], ataque_rocklee[1])

	pare

	caso itachi: criar_ninja1(ataque_itachi[0], ataque_itachi[1])

	pare


		
	}
}

	funcao criar_ataques_ninja2(inteiro escolha2){
	escolha(escolha2){
	caso pain: criar_ninja2(ataque_pain[0], ataque_pain[1])

	pare
	
	caso naruto: criar_ninja2(ataque_naruto[0], ataque_naruto[1])

	pare

	caso gaara: criar_ninja2(ataque_gaara[0], ataque_gaara[1])

	pare
	
	caso rocklee: criar_ninja2(ataque_rocklee[0], ataque_rocklee[1])

	pare

	caso itachi: criar_ninja2(ataque_itachi[0], ataque_itachi[1])

	pare	
	}
}
	funcao desenhar_texto_rgb(inteiro x ,inteiro y , real tamanho_texto,inteiro vermelho,inteiro verde,inteiro azul,cadeia texto){
	inteiro nova_cor = g.criar_cor(vermelho,verde,azul)	
	g.definir_estilo_texto(falso, verdadeiro, falso)
	g.definir_cor(nova_cor)
	g.definir_tamanho_texto(tamanho_texto)
	g.desenhar_texto(x ,y ,texto)
}
	funcao  imagem_menu_principalA(){
	aumentar_volume_musica_fundo()	
	restaurar_cor_barra()
	pintar_tela(castanho[0],castanho[1],castanho[2])
	mover_seletor_menu()
	selecionar_opcao_menu_p()	
	definir_campos()
	definir_imagem_selecao_menu()
	g.desenhar_imagem(0, 0, imagem_selecao_menu)
	desenhar_seletor(vermelho_escuro[0],vermelho_escuro[1],vermelho_escuro[2])
	desenhar_texto_rgb(10, 200, 40.0, branco[0], branco[1], branco[2],campo1)
	desenhar_texto_rgb(10, 250, 40.0, branco[0], branco[1], branco[2],campo2)
	desenhar_texto_rgb(10, 300, 40.0, branco[0], branco[1], branco[2],campo3)
	desenhar_texto_rgb(10, 350, 40.0, branco[0], branco[1], branco[2],campo4)
			
     g.renderizar()
	}		
	funcao desenhar_seletor(inteiro r,inteiro g,inteiro b){
	inteiro nova_cor
	nova_cor = g.criar_cor(r, g, b)
	g.desenhar_retangulo(0, posy_seletor, altura, 40 ,verdadeiro, verdadeiro)
}
	funcao mover_seletor_menu(){
	se(tela_atual == menu_principal){

	se(tc.tecla_pressionada(tc.TECLA_ESPACO)){
	posy_seletor = posy_seletor +	50
	u.aguarde(300)	
	}
	se(posy_seletor > 350){
	posy_seletor = 195
}
	defenir_item_selecionado()
}
	}	
	funcao mover_seletor_ninja1(){
	
	se(tela_atual == tela_ninja1){
	se(tc.tecla_pressionada(tc.TECLA_ESPACO)){
	posy_seletor = posy_seletor + 50	
	u.aguarde(300)
	}
	se(posy_seletor > 450){
	posy_seletor = 245	
			}
	defenir_item_selecionado()		
		}
	  }

	funcao mover_seletor_ninja2(){
	
	se(tela_atual == tela_ninja2){
	se(tc.tecla_pressionada(tc.TECLA_ESPACO)){
	posy_seletor = posy_seletor + 50	
	u.aguarde(300)
	}
	se(posy_seletor > 450){
	posy_seletor = 245	
			}
	defenir_item_selecionado()	
		}
	
	}
	funcao selecionar_opcao_menu_p(){
	se(tc.tecla_pressionada(tc.TECLA_ENTER) e selecao == ESC_NINJA1){
	tela_atual = tela_ninja1
	posy_seletor = 245
	u.aguarde(300)
	}	
	se(tc.tecla_pressionada(tc.TECLA_ENTER) e selecao == ESC_NINJA2){
	tela_atual = tela_ninja2
	posy_seletor = 245
	u.aguarde(300)
	}
	
	se(tc.tecla_pressionada(tc.TECLA_ENTER) e selecao == ESC_LUTAR e escolheu_ninja1 e escolheu_ninja2){
			tela_atual = tela_luta
			posy_seletor = 245
			u.aguarde(300)
		}
	se(tc.tecla_pressionada(tc.TECLA_ENTER) e selecao == ESC_LUTAR e (nao escolheu_ninja1 ou nao escolheu_ninja2)){
			mostrar_alerta()
			u.aguarde(300)
		}
		
	se(tc.tecla_pressionada(tc.TECLA_ENTER) e selecao == sair){
			u.aguarde(300)
			g.fechar_janela()
		}
}
	funcao selecionar_opcao_ninja1(){
	se(tela_atual == tela_ninja1){
	se(tc.tecla_pressionada(tc.TECLA_ENTER)e selecao == pain){
	ninja_escolhido1 = pain			
	escolheu_ninja1 = verdadeiro
	nome_ninja1 = nome_ninja[0]
	u.aguarde(300)
	posy_seletor = 195
	tela_atual = menu_principal
		}
		se(tc.tecla_pressionada(tc.TECLA_ENTER)e selecao == naruto){
	ninja_escolhido1 = naruto		
	escolheu_ninja1 = verdadeiro
	nome_ninja1 = nome_ninja[1]
	u.aguarde(300)
	posy_seletor = 195
	tela_atual = menu_principal
		}	se(tc.tecla_pressionada(tc.TECLA_ENTER)e selecao == gaara){
	ninja_escolhido1 = gaara		
	escolheu_ninja1 = verdadeiro
	nome_ninja1 = nome_ninja[2]
	u.aguarde(300)
	posy_seletor = 195
	tela_atual = menu_principal
		}
		se(tc.tecla_pressionada(tc.TECLA_ENTER)e selecao == rocklee){
	ninja_escolhido1 = rocklee		
	escolheu_ninja1 = verdadeiro
	nome_ninja1 = nome_ninja[3]
	u.aguarde(300)
	posy_seletor = 195
	tela_atual = menu_principal
		}
		se(tc.tecla_pressionada(tc.TECLA_ENTER)e selecao == itachi){
	ninja_escolhido1 = itachi			
	escolheu_ninja1 = verdadeiro
	nome_ninja1 = nome_ninja[4]
	u.aguarde(300)
	posy_seletor = 195
	tela_atual = menu_principal
		}
	}
}
	funcao selecionar_opcao_ninja2(){
	se(tela_atual == tela_ninja2){
	se(tc.tecla_pressionada(tc.TECLA_ENTER)e selecao == pain){
	ninja_escolhido2 = pain			
	escolheu_ninja2 = verdadeiro
	nome_ninja2 = nome_ninja[0]
	u.aguarde(300)
	posy_seletor = 195
	tela_atual = menu_principal
		}
		se(tc.tecla_pressionada(tc.TECLA_ENTER)e selecao == naruto){
	ninja_escolhido2 = naruto		
	escolheu_ninja2 = verdadeiro
	nome_ninja2 = nome_ninja[1]
	u.aguarde(300)
	posy_seletor = 195
	tela_atual = menu_principal
		}	se(tc.tecla_pressionada(tc.TECLA_ENTER)e selecao == gaara){
	ninja_escolhido2 = gaara		
	escolheu_ninja2 = verdadeiro
	nome_ninja2 = nome_ninja[2]
	u.aguarde(300)
	posy_seletor = 195
	tela_atual = menu_principal
		}
		se(tc.tecla_pressionada(tc.TECLA_ENTER)e selecao == rocklee){
	ninja_escolhido2 = rocklee		
	escolheu_ninja2 = verdadeiro
	nome_ninja2 = nome_ninja[3]
	u.aguarde(300)
	posy_seletor = 195
	tela_atual = menu_principal
		}
		se(tc.tecla_pressionada(tc.TECLA_ENTER)e selecao == itachi){
	ninja_escolhido2 = itachi			
	escolheu_ninja2 = verdadeiro
	nome_ninja2 = nome_ninja[4]
	u.aguarde(300)
	posy_seletor = 195
	tela_atual = menu_principal
		}
	}
}	
	funcao imagem_ninja1A(){
		aumentar_volume_musica_fundo()
		pintar_tela(castanho[0],castanho[1],castanho[2])
		mover_seletor_ninja1()
		selecionar_opcao_ninja1()
		definir_campos()
		definir_imagem_selecao_ninjas()
		g.desenhar_imagem(0, 0, imagem_selecao_ninja)
		desenhar_seletor(vermelho_escuro[0],vermelho_escuro[1],vermelho_escuro[2])
		desenhar_texto_rgb(10, 250, 40.0, branco[0],branco[0],branco[0],nome_ninja[0])
		desenhar_texto_rgb(10, 300, 40.0, branco[0],branco[0],branco[0],nome_ninja[1])
		desenhar_texto_rgb(10, 350, 40.0, branco[0],branco[0],branco[0],nome_ninja[2])
		desenhar_texto_rgb(10, 400, 40.0, branco[0],branco[0],branco[0],nome_ninja[3])
		desenhar_texto_rgb(10, 450, 40.0, branco[0],branco[0],branco[0],nome_ninja[4])
		se(tela_atual == tela_ninja1 e tc.tecla_pressionada(tc.TECLA_ESC)){
			tela_atual = menu_principal
			posy_seletor = 195
		}
		g.renderizar()
	}	
	funcao imagem_ninja2A(){
		aumentar_volume_musica_fundo()
		pintar_tela(castanho[0],castanho[1],castanho[2])
		mover_seletor_ninja2()
		selecionar_opcao_ninja2()
		definir_campos()
		definir_imagem_selecao_ninjas()
		g.desenhar_imagem(0, 0, imagem_selecao_ninja)
		desenhar_seletor(vermelho_escuro[0],vermelho_escuro[1],vermelho_escuro[2])
		desenhar_texto_rgb(10, 250, 40.0, branco[0],branco[0],branco[0],nome_ninja[0])
		desenhar_texto_rgb(10, 300, 40.0, branco[0],branco[0],branco[0],nome_ninja[1])
		desenhar_texto_rgb(10, 350, 40.0, branco[0],branco[0],branco[0],nome_ninja[2])
		desenhar_texto_rgb(10, 400, 40.0, branco[0],branco[0],branco[0],nome_ninja[3])
		desenhar_texto_rgb(10, 450, 40.0, branco[0],branco[0],branco[0],nome_ninja[4])
		se(tela_atual == tela_ninja2 e tc.tecla_pressionada(tc.TECLA_ESC)){
			tela_atual = menu_principal
			posy_seletor = 195
		}
		g.renderizar()
	}	
		
	funcao defenir_item_selecionado(){
		se(tela_atual == menu_principal){
			se(posy_seletor == 195){
				selecao = ESC_NINJA1 				
			}
			senao se(posy_seletor == 245){
				selecao = ESC_NINJA2
			}
			senao se(posy_seletor == 295){
				selecao = ESC_LUTAR
			}
			senao se(posy_seletor == 345){
				selecao = sair
			}
				
		}
		se(tela_atual == tela_ninja1){
			se(posy_seletor == 245){
				selecao = pain
			}
			se(posy_seletor == 295){
				selecao = naruto
			}
			se(posy_seletor == 345){
				selecao = gaara
			}
			se(posy_seletor == 395){
				selecao = rocklee
			}
			se(posy_seletor == 445){
				selecao = itachi
			}
			
		}
	
	
		se(tela_atual == tela_ninja2){
			se(posy_seletor == 245){
				selecao = pain
			}
			se(posy_seletor == 295){
				selecao = naruto
			}
			se(posy_seletor == 345){
				selecao = gaara
			}
			se(posy_seletor == 395){
				selecao = rocklee
			}
			se(posy_seletor == 445){
				selecao = itachi
			}
			
		}
				
	}	
			funcao definir_campos(){
		se(escolheu_ninja1  ){
			campo1 = "Você escolheu o " + nome_ninja1 
		}senao{
		campo1 = "Escolha o primeiro ninja."
		}
		se(escolheu_ninja2 ){
			campo2 = "Você escolheu o " + nome_ninja2
		}senao{
			campo2 = "Escolha o segundo ninja."
		}
	}
		funcao mostrar_alerta(){
		pintar_tela(preto[0],preto[1],preto[2])
		desenhar_texto_rgb(5, 150, 130.0,branco[0],branco[1],branco[2],"Não pode!")
		g.renderizar()
	}	
		funcao definir_imagem_selecao_ninjas(){
		se(tela_atual == tela_ninja1 ou tela_atual == tela_ninja2){
			se(selecao == pain){
			imagem_selecao_ninja = imagem_pain
		}
		senao se(selecao == naruto){
			imagem_selecao_ninja = imagem_naruto
		}
		senao se(selecao == gaara){
			imagem_selecao_ninja = imagem_gaara
		}
		senao se(selecao == rocklee){
			imagem_selecao_ninja = imagem_rocklee
		}
		senao se(selecao == itachi){
			imagem_selecao_ninja = imagem_itachi
		}
		}
}
		funcao definir_imagem_selecao_menu(){
		se(selecao == ESC_NINJA1 e escolheu_ninja1){
		se(ninja_escolhido1 == pain){
      	imagem_selecao_menu = imagem_pain
		}
		}senao se(selecao == ESC_NINJA1){
		imagem_selecao_menu = fundo_principal
		}

		se(selecao == ESC_NINJA2 e escolheu_ninja2){
		se(ninja_escolhido2 == pain){
		imagem_selecao_menu = imagem_pain
			}
		se(ninja_escolhido2 == naruto){
		imagem_selecao_menu = imagem_naruto
			}
			se(ninja_escolhido2 == gaara){
		imagem_selecao_menu = imagem_gaara
			}
			se(ninja_escolhido2 == rocklee){
		imagem_selecao_menu = imagem_rocklee
			}
			se(ninja_escolhido2 == itachi){
		imagem_selecao_menu = imagem_itachi
			}
		}senao{
			imagem_selecao_menu = fundo_principal
		}
	}
		
		funcao tela_lutaA(){
		aumentar_volume_musica_fundo() 
		atualizar_ataques() 
		definir_imagem_ninja1() 
		definir_imagem_ninja2() 
		
		vida_atual1 = vida_maxima
		tamanho_barra1 = tamanho_barra_maxima
		vida_atual2 = vida_maxima
		tamanho_barra2 = tamanho_barra_maxima
		
		enquanto(tela_atual == tela_luta e nao alguem_venceu()){

				enquanto(contagem_ataque_ninja1 < 2 e tela_atual == tela_luta e nao alguem_venceu()){
				aumentar_volume_musica_fundo()
				ninja1_atacando = verdadeiro
			
				ninja2_atacando = falso
	    		     contagem_ataque_ninja2 = 0
				limpar_tela(25,25,112)	
				atacar_o_ninja2()
				definir_barra_vida1()
				definir_barra_vida2()
				mostrar_ninjas()
				desenhar_barra1()
				desenhar_barra2()				
				desenhar_painel()
				desenhar_botoes1()
				desenhar_botoes2()
				desenhar_bloqueio()
				mostrar_msg_painel(cor_msg_painel,campo_painel)
				g.renderizar()
				u.aguarde(200)
				zerar_danos()
				voltar_para_menu()
				campo_painel = ""			
				}
			enquanto(contagem_ataque_ninja2 < 2 e tela_atual == tela_luta e nao alguem_venceu()){
			aumentar_volume_musica_fundo()
				ninja2_atacando = verdadeiro
				ninja1_atacando = falso
				contagem_ataque_ninja1 = 0
				limpar_tela(25,25,112)	
				atacar_o_ninja1()
				definir_barra_vida1()
				definir_barra_vida2()
				mostrar_ninjas()
				desenhar_barra1()
				desenhar_barra2()				
				desenhar_painel()
				desenhar_botoes1()
				desenhar_botoes2()
				desenhar_bloqueio()
				mostrar_msg_painel(cor_msg_painel,campo_painel)
				g.renderizar()
				u.aguarde(200)
				zerar_danos()
				voltar_para_menu()
				campo_painel = ""			
			}
			}
				
				se(tela_atual != menu_principal){
				tela_atual = tela_novo_jogo	
		}
	
	}
				funcao definir_imagem_ninja1(){
		se(ninja_escolhido1 == pain){
			imagem_ninja1 = imagem_pain
			nova_imagem1 = g.redimensionar_imagem(imagem_ninja1, 400, 300, falso)
		}
		senao se(ninja_escolhido1 == naruto){
			imagem_ninja1 = imagem_naruto
			nova_imagem1 = g.redimensionar_imagem(imagem_ninja1, 400, 300, falso)
		}
		senao se(ninja_escolhido1 == gaara){
			imagem_ninja1 = imagem_gaara
			nova_imagem1 = g.redimensionar_imagem(imagem_ninja1, 400, 300, falso)
		}
		senao se(ninja_escolhido1 == rocklee){
			imagem_ninja1 = imagem_rocklee
			nova_imagem1 = g.redimensionar_imagem(imagem_ninja1, 400, 300, falso)
		}
		senao se(ninja_escolhido1 == itachi){
			imagem_ninja1 = imagem_itachi
			nova_imagem1 = g.redimensionar_imagem(imagem_ninja1, 400, 300, falso)
		}
	}
			funcao definir_imagem_ninja2(){
		se(ninja_escolhido2 == pain){
			imagem_ninja2 = imagem_pain
			nova_imagem2 = g.redimensionar_imagem(imagem_ninja2, 400, 300, falso)
		}
		senao se(ninja_escolhido2 == naruto){
			imagem_ninja2 = imagem_naruto
			nova_imagem2 = g.redimensionar_imagem(imagem_ninja2, 400, 300, falso)
		}
		senao se(ninja_escolhido2 == gaara){
			imagem_ninja2 = imagem_gaara
			nova_imagem2 = g.redimensionar_imagem(imagem_ninja2, 400, 300, falso)
		}
		senao se(ninja_escolhido2 == rocklee){
			imagem_ninja2 = imagem_rocklee
			nova_imagem2 = g.redimensionar_imagem(imagem_ninja2, 400, 300, falso)
		}
		senao se(ninja_escolhido2 == itachi){
			imagem_ninja2 = imagem_itachi
			nova_imagem2 = g.redimensionar_imagem(imagem_ninja2, 400, 300, falso)
		}
	}
		
		funcao mostrar_ninjas(){
		desenhar_ninja1()
		desenhar_ninja2()
		}
		funcao desenhar_ninja1(){
		g.desenhar_imagem(-10,0,nova_imagem1)	
		}
		funcao desenhar_ninja2(){
		g.desenhar_imagem(410,0,nova_imagem2)
		}
		funcao voltar_para_menu(){
		se(tc.tecla_pressionada(tc.TECLA_ESC) e tela_atual == tela_luta){
			tela_atual = menu_principal
			}
		}
		
		funcao definir_barra_vida1(){
		info_barra1 = tp.inteiro_para_cadeia(vida_atual1, 10)
		se(vida_atual1 > 0){
			vida_atual1 = vida_atual1 - dano2
		}
		senao{
			vida_atual1 = 0
		}
		taxa1 = (100 * dano2) / 100
		tamanho_barra1 = tamanho_barra1 -((taxa1 * tamanho_barra_maxima) / 100)
	}
		
		funcao definir_barra_vida2(){
		info_barra2 = tp.inteiro_para_cadeia(vida_atual2, 10)
		se(vida_atual2 > 0){
			vida_atual2 = vida_atual2 - dano1
		}
		senao{
			vida_atual2 = 0
		}
		taxa2 = (100 * dano1) / 100
		tamanho_barra2 = tamanho_barra2 -((taxa2 * tamanho_barra_maxima) / 100)
	}
	
		funcao desenhar_barra1(){
		g.definir_cor(definir_cor_barra_vida1(taxa1))
		g.desenhar_retangulo(0, 310, tamanho_barra1, 30, falso, verdadeiro)
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(0, 310, tamanho_barra1, 30, falso, falso)
		g.definir_tamanho_texto(20.0)
		g.desenhar_texto(20, 316,info_barra1)
	}
		funcao desenhar_barra2(){
		g.definir_cor(definir_cor_barra_vida2(taxa2))
		g.desenhar_retangulo(400, 310, tamanho_barra2, 30, falso, verdadeiro)
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(400, 310, tamanho_barra2, 30, falso, falso)
		g.definir_tamanho_texto(20.0)
		g.desenhar_texto(425, 316,info_barra2)
	}
		funcao atacar_o_ninja2(){
		se(m.botao_pressionado(0) e mouse_no_botao(1) e ataque_ninja1[0] <= 10 ){
			dano1 = 10
			tocar_botao_som()
			campo_painel = "Ataque fraco!"
			cor_msg_painel = g.COR_VERMELHO
			u.aguarde(400)
		
			contagem_ataque_ninja1 ++
			
		}

		se(m.botao_pressionado(0) e mouse_no_botao(1) e ataque_ninja1[0] <= 15 ){
			dano1 = 20
			tocar_botao_som()
			campo_painel = "Ataque forte!"
			cor_msg_painel = g.COR_AMARELO
			u.aguarde(400)
			contagem_ataque_ninja1 ++
		}

		se(m.botao_pressionado(0) e mouse_no_botao(1) e ataque_ninja1[0] <= 20){
			dano1 = 30
			tocar_botao_som()
			campo_painel = "Ataque fatal!"
			cor_msg_painel = g.COR_VERDE
			u.aguarde(600)
			contagem_ataque_ninja1 ++
		}		
		se(m.botao_pressionado(0) e mouse_no_botao(2) e ataque_ninja1[1] <= 15 ){
			dano1 = 10
			tocar_botao_som()
			campo_painel = "Ataque fraco!"
			cor_msg_painel = g.COR_VERMELHO
			u.aguarde(400)
		
			contagem_ataque_ninja1 ++
		}
		se(m.botao_pressionado(0) e mouse_no_botao(2) e ataque_ninja1[1] <= 20){
			dano1 = 30
			tocar_botao_som()
			campo_painel = "Ataque fatal!"
			cor_msg_painel = g.COR_VERDE
			u.aguarde(600)
			contagem_ataque_ninja1 ++
		}
}
	funcao atacar_o_ninja1(){
		se(m.botao_pressionado(0) e mouse_no_botao(3) e ataque_ninja2[0] >= 10){
			dano2 = 10
			tocar_botao_som()
			campo_painel = "Ataque fraco!"
			cor_msg_painel = g.COR_VERMELHO
			u.aguarde(400)
		
			contagem_ataque_ninja2 ++
		}

		se(m.botao_pressionado(0) e mouse_no_botao(3) e ataque_ninja2[1] >= 15){
			dano2 = 20
			tocar_botao_som()
			campo_painel = "Ataque forte!"
			cor_msg_painel = g.COR_AMARELO
			u.aguarde(400)
			contagem_ataque_ninja2 ++
		}

		se(m.botao_pressionado(0) e mouse_no_botao(3) e ataque_ninja2[2] >= 20){
			dano2 = 30
			tocar_botao_som()
			campo_painel = "Ataque fatal!"
			cor_msg_painel = g.COR_VERDE
			u.aguarde(600)
			contagem_ataque_ninja2 ++
		}

	se(m.botao_pressionado(0) e mouse_no_botao(4) e ataque_ninja1[1] <= 15 ){
			dano2 = 10
			tocar_botao_som()
			campo_painel = "Ataque fraco!"
			cor_msg_painel = g.COR_VERMELHO
			u.aguarde(400)
		
			contagem_ataque_ninja1 ++
		}
		se(m.botao_pressionado(0) e mouse_no_botao(4) e ataque_ninja1[1] <= 20){
			dano2 = 30
			tocar_botao_som()
			campo_painel = "Ataque fatal!"
			cor_msg_painel = g.COR_VERDE
			u.aguarde(600)
			contagem_ataque_ninja1 ++
		}
		}
		funcao zerar_danos(){
		dano1 = 0
		dano2 = 0
		}
		funcao inteiro definir_cor_barra_vida1(inteiro taxa_vida1){
		inteiro cor = 0
		se(cor_barra_vida1[0] <= 255 e cor_barra_vida1[1] >= dano2){
		cor_barra_vida1[0] = cor_barra_vida1[0] + ((taxa_vida1 * VERMELHO_MAXIMO) / 100) 	
		cor_barra_vida1[1] = cor_barra_vida1[1] - ((taxa_vida1 * VERDE_MAXIMO) / 100) 	
		}
		se(cor_valida_rgb1(cor_barra_vida1[0],cor_barra_vida1[1],cor_barra_vida1[2])){
		cor = g.criar_cor(cor_barra_vida1[0],cor_barra_vida1[1],cor_barra_vida1[2])	
		}senao{
		cor = g.criar_cor(255,0,0)	
		}
		retorne cor
}
		funcao inteiro definir_cor_barra_vida2(inteiro taxa_vida2){
		inteiro cor = 0
		se(cor_barra_vida2[0] <= 255 e cor_barra_vida2[1] >= dano1){
		cor_barra_vida2[0] = cor_barra_vida2[0] + ((taxa_vida2 * VERMELHO_MAXIMO) / 100)
		cor_barra_vida2[1] = cor_barra_vida2[1] - ((taxa_vida2 * VERDE_MAXIMO) / 100)
		}
		se(cor_valida_rgb2(cor_barra_vida2[0],cor_barra_vida2[1],cor_barra_vida2[2])){
			cor = g.criar_cor(cor_barra_vida2[0],cor_barra_vida2[1],cor_barra_vida2[2])
		}
		senao{
			cor = g.criar_cor(255, 0, 0)
		}
			
		retorne cor
	}
		funcao desenhar_botoes1(){
		inteiro cor = g.criar_cor(106,90,205)	
		g.definir_cor(cor)
		g.desenhar_retangulo(20, 405, 360, 55, verdadeiro, verdadeiro)
		g.desenhar_retangulo(20, 470, 360, 55, verdadeiro, verdadeiro)
		g.desenhar_retangulo(20, 535, 360, 55, verdadeiro, verdadeiro)
		}
		funcao desenhar_botoes2(){
		inteiro cor = g.criar_cor(106,90,205)
		g.definir_cor(cor)
		g.desenhar_retangulo(420, 405, 360, 55, verdadeiro, verdadeiro)
		g.desenhar_retangulo(420, 470, 360, 55, verdadeiro, verdadeiro)
		g.desenhar_retangulo(420, 535, 360, 55, verdadeiro, verdadeiro)	
		}
		funcao desenhar_painel(){
		inteiro cor = g.criar_cor(49,79,79)	
		g.definir_cor(cor)
		g.desenhar_retangulo(0,345,altura,50,falso,verdadeiro)
		}
		funcao limpar_tela(inteiro r ,inteiro g ,inteiro b){
		inteiro cor = g.criar_cor(r,g,b)
		g.definir_cor(cor)
		g.limpar()	
		}
	funcao logico mouse_no_botao(inteiro numero_botao){
		logico apertou = falso
		//Botões que controlam o Heroi1
		se((m.posicao_x() >= 20 e m.posicao_x() <= 380) e (m.posicao_y() >= 405 e m.posicao_y() <= 460) e numero_botao == 1){
			apertou = verdadeiro
		}

		senao se((m.posicao_x() >= 20 e m.posicao_x() <= 380) e (m.posicao_y() >= 470 e m.posicao_y() <= 525) e numero_botao == 2){
			apertou = verdadeiro
		}

		
		//Botões que controlam o Heroi2
		 se((m.posicao_x() >= 420 e m.posicao_x() <= 780) e (m.posicao_y() >= 405 e m.posicao_y() <= 460) e numero_botao == 3 ){
			apertou = verdadeiro
		}

		 se((m.posicao_x() >= 420 e m.posicao_x() <= 780) e (m.posicao_y() >= 470 e m.posicao_y() <= 535) e numero_botao == 3 ){
			apertou = verdadeiro
		}
		

		retorne  apertou
	}
		funcao restaurar_cor_barra(){
		
		cor_barra_vida1[0] = 0
		cor_barra_vida1[1] = 255
		cor_barra_vida1[2] = 0

		cor_barra_vida2[0] = 0
		cor_barra_vida2[1] = 255
		cor_barra_vida2[2] = 0
	}

	funcao atualizar_ataques(){
		//Gera valores aleatórios de ataque dos herois
		gerar_poderes_ninjas()
		//Atribui os valores gerados ao heoi1 escolhido pelo usuário
		criar_ataques_ninja1(ninja_escolhido1)
		//Atribui os valores gerados ao heoi2 escolhido pelo usuário
		criar_ataques_ninja2(ninja_escolhido2)
	}

	funcao logico cor_valida_rgb2(inteiro r,inteiro g,inteiro b){
		logico cor_valida2 = falso
		se((r >= 0 e r <= 255) e (g >= 0 e g <= 255) e (b >= 0 e b <= 255)){
			cor_valida2 = verdadeiro
		}

		retorne cor_valida2
	}

	funcao logico cor_valida_rgb1(inteiro r,inteiro g,inteiro b){
		logico cor_valida1 = falso
		se((r >= 0 e r <= 225) e (g >= 0 e g <= 255) e (b >= 0 e b <= 255)){
			cor_valida1 = verdadeiro
		}

		retorne cor_valida1
	}
		funcao desenhar_bloqueio(){
		se(ninja1_atacando){
			inteiro cor = g.criar_cor(255,255,0)
			g.definir_cor(cor)
			g.desenhar_retangulo(400, 395, 400, 800, falso, verdadeiro)
			g.definir_cor(g.COR_PRETO)
			g.definir_tamanho_texto(30.0)
			g.desenhar_texto(440, 485, "Botões Bloqueados")
		}senao se(ninja2_atacando){
			inteiro cor = g.criar_cor(255,255,0)
			g.definir_cor(cor)
			g.desenhar_retangulo(0, 395, 400, 800, falso, verdadeiro)
			g.definir_cor(g.COR_PRETO)
			g.definir_tamanho_texto(30.0)
			g.desenhar_texto(40, 485, "Botões Bloqueados")
		}
	}
			funcao tocar_botao_som(){
			playbotao = s.reproduzir_som(botao_som, falso)
			s.definir_volume_reproducao(botao_som, 100)
	}
	
			funcao tocar_musica_fundo(){
			som_de_fundo = s.reproduzir_som(musica_fundo, verdadeiro)
			s.definir_volume_reproducao(musica_fundo, 50)
	}

			funcao mostrar_msg_painel(inteiro cor,cadeia msg){
			g.definir_cor(cor)
			g.definir_tamanho_texto(40.0)
			g.desenhar_texto(210, 355, msg)
	}

			funcao logico alguem_venceu(){
			logico venceu = falso
			se(vida_atual1 > 0 e vida_atual2 <= 0){
			venceu = verdadeiro
		}
			senao se(vida_atual2 > 0 e vida_atual1 <= 0){
			venceu = verdadeiro
		}

			retorne venceu
	}
			funcao imagem_novo_jogoA(){
			enquanto(tela_atual == tela_novo_jogo){
			aumentar_volume_musica_fundo()
			pintar(sorteio_cores())	
			msg_novo_jogo()
			msg_voltar()
			jogar_de_novo()
	    	     g.renderizar()
	    	     u.aguarde(200)	
		}
}
			funcao msg_novo_jogo(){
			g.definir_tamanho_texto(50.0)
			se(ninja1_venceu()){
			se(ninja_escolhido1 == pain){
			g.definir_cor(g.COR_PRETO)
			g.desenhar_texto(100, 200, "O ninja " + nome_ninja[0] + " venceu! ")
			}
			
			senao se(ninja_escolhido1 == naruto){
			g.definir_cor(g.COR_PRETO)
			g.desenhar_texto(100,200, " O ninja " + nome_ninja[1] + " venceu! ")
		
			}
			senao se(ninja_escolhido1 == gaara){
			g.definir_cor(g.COR_PRETO)
			g.desenhar_texto(100,200," O ninja " + nome_ninja[2] + " venceu!" )
			
			}
			senao se(ninja_escolhido1 == rocklee){
			g.definir_cor(g.COR_PRETO)
			g.desenhar_texto(100,200," O ninja " + nome_ninja[3] + " venceu!" )
		
			}
			senao se(ninja_escolhido1 == itachi){
			g.definir_cor(g.COR_PRETO)
			g.desenhar_texto(100,200," O ninja " + nome_ninja[4] + " venceu!" )
			}
		}	
			se(ninja2_venceu()){
			se(ninja_escolhido2 == pain){
			g.definir_cor(g.COR_PRETO)
			g.desenhar_texto(100, 200, "O ninja " + nome_ninja[0] + " venceu! ")
			}
			
			senao se(ninja_escolhido2 == naruto){
			g.definir_cor(g.COR_PRETO)
			g.desenhar_texto(100,200, " O ninja " + nome_ninja[1] + " venceu! ")
		
			}
			senao se(ninja_escolhido2 == gaara){
			g.definir_cor(g.COR_PRETO)
			g.desenhar_texto(100,200," O ninja " + nome_ninja[2] + " venceu!" )
			
			}
			senao se(ninja_escolhido2 == rocklee){
			g.definir_cor(g.COR_PRETO)
			g.desenhar_texto(100,200," O ninja " + nome_ninja[3] + " venceu!" )

			}senao se(ninja_escolhido2 == itachi){
			g.definir_cor(g.COR_PRETO)
			g.desenhar_texto(100,200," O ninja " + nome_ninja[4] + " venceu!" )
			}
			}	
			}
			
			funcao logico ninja1_venceu(){
			logico venceu1 = falso
			se(vida_atual1 > 0 e vida_atual2 <= 0){
			venceu1 = verdadeiro
			}

			retorne venceu1
			}

			funcao logico ninja2_venceu(){
			logico venceu2 = falso
			se(vida_atual2 > 0 e vida_atual1 <= 0){
			venceu2 = verdadeiro
			}

			retorne venceu2
			}

			funcao jogar_de_novo(){
			se(tela_atual == tela_novo_jogo e tc.tecla_pressionada(tc.TECLA_ENTER)){
			restaurar_cor_barra()
			tela_atual = menu_principal
			}
		}
			
			
			
			funcao inteiro sorteio_cores(){
			inteiro r = u.sorteia(0, 255)
			inteiro g = u.sorteia(0, 255)
			inteiro b = u.sorteia(0, 255)

			inteiro cor3 =g.criar_cor(r, g, b)

			retorne cor3
			}

			funcao pintar(inteiro cor4){
			g.definir_cor(cor4)
			g.limpar()
			}

			funcao msg_voltar(){
			g.desenhar_texto(10, 300, "Aperte ENTER para voltar")
			}

			funcao aumentar_volume_musica_fundo(){
			inteiro volume1 = volume
			se(tc.tecla_pressionada(tc.TECLA_SETA_ACIMA)){
			s.definir_volume_reproducao(musica_fundo,volume++)
			u.aguarde(200)	
			}

			se(tc.tecla_pressionada(tc.TECLA_SETA_ABAIXO)){
			s.definir_volume_reproducao(musica_fundo,volume --)
			u.aguarde(200)	
		}
		
	}













































			











































































































}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 24343; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */