# Levantamento de Requisitos (BUR - UFRPE)

<div align="center">
  <img src="https://github.com/user-attachments/assets/54622bbd-cb40-483a-843d-2b4b1046ce0f" 
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
- Lei nº 13.709/2018 – Lei Geral de Proteção de Dados (LGPD)
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
- O sistema deve utilizar Wi-Fi ou Dados Móveis para conseguir ser utilizado.
### 2.5 Suposições e Dependências
- O sistema depende de conexão com a internet, de acesso a rede de localização e integração com o banco de dados de demanda.
- As bicicletas irao depender de uma manutenção constante para garantir a segurança do usuário.
## 3. Requisitos Funcionais (RF)
- RF01:
  	- O sistema deve permitir ao usuário escanear o QR Code de uma bicicleta utilizando a câmera do dispositivo para iniciar o processo de liberação.
- RF02:
  	- O sistema deve registrar a data de uso, o tempo, em que hora foi cedida e devolvida, e a localização de onde foi devolvida.

## 4.Requisitos Não Funcionais (RNF)



