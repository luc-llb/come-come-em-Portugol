Algoritmo "papa-papa"

Var

   tb: vetor [1..9,1..9] de caracter
   i,j,x,y,xf,yf,alimento,jg,v,r: inteiro

Inicio

   //instru��es para o jogador
   escreval("==============BEM VINDO AO PAPA-PAPA==============")
   escreval
   escreval("  O objetivo do jogo � pegar todos os alimentos ([-])")
   escreval("andando sempre em linhas verticais ou horizontais")
   escreval("apenas uma 'casa' do tabuleiro por vez.")
   escreval("  Cada alimento consede +1 de energia e cada vez que")
   escreval("entrar em uma 'casa' vazia � gasto -1 da energia.")
   escreval("  S�o distribuidos de forma aleatoria 40 alimentos.")
   escreval("Voc� pode tentar se mover 40 vezes, evite que sua")
   escreval("energia chegue a 0 e pegue todos os alimentos.")
   escreval("  O jogo acaba quando sua enrgia for igual a 0")
   escreval("ou quando o numero de jogadas atingir seu limite")
   escreval
   
   //processamento da matriz
   para i de 1 ate 9 faca
      para j de 1 ate 9 faca
         tb[i,j] <- "[ ]"
      fimpara
   fimpara
   tb[5,5] <- "[o]"  //adi��o do ponto inicial
   para x de 1 ate 40 faca  //adi��o dos alimentos
      i <- randi(9)+1
      j <- randi(9)+1
      enquanto (tb[i,j]="[-]") ou (tb[i,j]="[o]") faca
         i <- randi(9)+1
         j <- randi(9)+1
      fimenquanto
      tb[i,j] <- "[-]"
   fimpara

   //impress�o da matriz
   escreval("   1  2  3  4  5  6  7  8  9")
   para i de 1 ate 9 faca
      escreva(i)
      para j de 1 ate 9 faca
         escreva(tb[i,j])
      fimpara
      escreval
   fimpara

   //componentes para inicializa��o de forma correta

   //posi��o inicial do comil�o (usado para troca de dados)
   x <- 5
   y <- 5

   alimento <- 1 //valor inicial do alimento
   jg <- 0 //quantidade jogadas (zerada at� os comandos do jogador)
   r <- 1 //condi��o para gerar futuras jogadas
   v <- 0 //acumulo de alimentos para vitoria
   //informa��es para o usuario
   escreval("Movimenta��es:", jg, "  Energia:", alimento)

   //gerador de jogadas
   enquanto (r = 1) faca

      //comandos do usuario
      escreval("Informe a posi��o da linha: ")
      leia(xf)
      escreval("Informe a posi��o da coluna: ")
      leia(yf)

      //caso o usuario informe o ponto onde est� atualmente
      se (x=xf) e (y=yf) entao
         escreval("Voce j� esta nessa posi��o")
         jg <- jg+1
      senao

         //caso usuario informe um numero menor que 0 ou maior que 9
         se (xf <= 0) ou (yf <= 0) ou (xf > 9) ou (yf > 9) entao
            escreval("Jogada invalida! informe numeros presentes no tabuleiro")
            jg <- jg + 1
            alimento <- alimento-1
         senao

            //impedir movimenta��o diagonal
            se (x=xf) ou (y=yf) entao

               //movimenta��o horizontal
               se (x-xf=1) ou (xf-x=1) e (y-yf=0) ou (yf-y=0) entao

                  escreval //distanciamento para estetica

                  //gasto ou acrescimo de alimento
                  se (tb[xf,yf]="[-]") entao
                     alimento <- alimento+1
                     v <- v + 1
                  senao
                     alimento <- alimento-1
                  fimse

                  jg <- jg+1 //contabiliza��o da jogada
                  tb[x,y] <- "[ ]" //limpeza do cen�rio
                  tb[xf,yf] <- "[o]" //movimenta��o

                  //troca de dados para a proxima checagem
                  x <- xf
                  y <- yf

               senao
                  //movimenta��o vertical
                  se (x-xf=0) ou (xf-x=0) e (y-yf=1) ou (yf-y=1) entao

                     escreval
                     se (tb[xf,yf]="[-]") entao
                        alimento <- alimento+1
                        v <- v + 1
                     senao
                        alimento <- alimento-1
                     fimse

                     jg <- jg+1
                     tb[x,y] <- "[ ]"
                     tb[xf,yf] <- "[o]"

                     x <- xf
                     y <- yf

                  senao
                     escreval("Jogada invalida! S� pode andar uma casa por vez.")
                     jg <- jg+1
                     alimento <- alimento-1
                  fimse
               fimse
            senao
               escreval("Jogada invalida! N�o pode se mover em diagonais.")
               jg <- jg+1
               alimento <- alimento-1
            fimse

            //impress�o da jogada
            escreval("   1  2  3  4  5  6  7  8  9")
            para i de 1 ate 9 faca
               escreva(i)
               para j de 1 ate 9 faca
                  escreva(tb[i,j])
               fimpara
               escreval
            fimpara

            //checagem de game over ou vitoria
            se (v = 40) entao
               escreval("O Comil�o esta satisfeito!")
               escreval("<<<<<<<<<<<<<VITORIA!!>>>>>>>>>>>>>")
               r <- 0
            senao
               se (jg < 40) entao //checagem de game over por jogada

                  //checagem de game over ou vitoria por alimento
                  se (alimento > 0) e (alimento < 40) entao

                     //informa��es p�s-jogada
                     escreval("Movimenta��es:", jg, " Energia:", alimento)

                  senao
                     escreval("*O Comil�o desmaiou de fome*")
                     escreval("<<<<<<<<<<<<GAME OVER!!>>>>>>>>>>>>")
                     r <- 0
                  fimse
               senao
                  escreval("O Comil�o ficou com pregui�a de se alimentar.")
                  escreval("<<<<<<<<<<<<GAME OVER!!>>>>>>>>>>>>")
                  r <- 0
               fimse
            fimse
         fimse
      fimse
   fimenquanto

Fimalgoritmo
