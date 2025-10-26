# Levantamento de Requisitos (BUR - UFRPE)

<div align="center">
  <img src="https://github.com/user-attachments/assets/e2f35a68-8bef-4bce-95d3-74dcd45e9a95"
      width="300"
      height="300"
      >
</div>

## 1. Introdução
### 1.1 Propósito
- Este documento tem como objetivo descrever os requisitos funcionais e não funcionais do Sistema de Bicicleta Universitária da UFRPE (BUR), que será utilizado para ajudar a locomoção de pessoas ligadas à universidade para transitar entre pontos de interesse.
### 1.2 Escopo do Sistema
- O BUR permitirá a liberação de bicicletas somente às pessoas que são ligadas à UFRPE, a consulta de histórico de uso, por meio de um banco de dados criptografado, visto que garante a proteção de dados do usuário, e dependendo do seu uso, o usuário está sujeito a cobrança de multas. O sistema não fará cobrança de taxas para utilização das bicicletas e não poderá ser utilizado fora da área de influência da UFRPE.
### 1.3 Definições e Abreviações
- BUR: Bicicleta Universitária Rural
- UFRPE: Universidade Federal Rural de Pernambuco
### 1.4 Referências
- Lei nº 13.709/2018 – Lei Geral de Proteção de Dados (LGPD).
- Código de Trânsito Brasileiro (CTB), especialmente o Artigo 58, que estabelece que bicicletas devem usar ciclovias, ciclofaixas ou acostamentos quando disponíveis.
- Art. 186 e Art. 927 do Codigo Cívil Brasileiro (CCB).
## 2. Descrição Geral
### 2.1 Perspectiva do Produto
- O sistema tem como objetivo facilitar a locomoção entre pontos de interesse dentro da área da UFRPE e otimizar o tempo do usuário para realizar tais tarefas.  
### 2.2 Funções Principais
- Consulta de histórico.
- Registro de uso
	- Momento de cessão.
   	- Momento da devolução.
   	- Tempo máximo de uso.
- Geração de relatórios de frequência
	- Análise de locais com maior demanda de bicicletas.
	- Disponibilidade de bicicletas.
### 2.3 Tipos de Usuários
- Estudantes e Funcionários da UFRPE: utilizam as bicicletas.
- Administrador: configura o sistema e gerencia as permissões.
- Repositor: realoca as bicicletas para locais que precisam.
### 2.4 Restrições
- O sistema deve armazenar dados por no mínimo 1 mês, para análise de demanda.
- O sistema deve utilizar Wi-Fi e/ou Dados Móveis para conseguir ser utilizado.
### 2.5 Suposições e Dependências
- O sistema depende de conexão com a internet, de acesso a rede de localização e integração com o banco de dados de demanda.
- As bicicletas irao depender de uma manutenção constante para garantir a segurança do usuário.
## 3. Requisitos Funcionais (RF)
- RF01:
  	- O sistema deve permitir ao usuário escanear o QR Code de uma bicicleta utilizando a câmera do dispositivo para iniciar o processo de liberação.
- RF02:
  	- O sistema deve registrar a data de uso, o tempo, em que hora foi cedida e devolvida, a localização de onde foi devolvida, e rastrear o percuruso do usuário.
- RF03:
  	- O sistema deve permitir que usuários com vínculo ativo na UFRPE se cadastrem utilizando seu e-mail institucional.
- RF04:
  	- O sistema deve exibir um mapa do campus com a localização em tempo real das bicicletas disponíveis.
- RF05:
  	- O sistema deve permitir que o administrador visualize relatórios de uso por período.
- RF06:
  	- O sistema deve mostrar o tempo de uso da bicicleta, e o tempo máximo de uso.


## 4. Requisitos Não Funcionais (RNF)
- RNF01 (Usabilidade)
	- A interface deve ser intuitiva, permitindo que um novo usuário consiga liberar uma bicicleta em menos de 3 minutos no primeiro uso.
- RNF02 (Desempenho)
  	- A liberação de uma bicicleta após a leitura do QR Code deve ocorrer em no máximo 5 segundos.
- RNF03 (Segurança)
  	- O sistema deve criptografar todos os dados sensíveis dos usuários, em conformidade com a LGPD.
- RNF04 (Disponibilidade)
  	- O sistema deve operar das 5:00 até às 22:00, de Segunda à Sexta.



