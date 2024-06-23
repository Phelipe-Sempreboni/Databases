| Documentação elaborada por     | Data da última revisão |               Seguimentação            | Tipo do banco de dados| Ferramenta            | Ferramenta  |
| -----------------------------  |:----------------------:|:--------------------------------------:|:---------------------:|:---------------------:|:-----------:|
| Luiz Phelipe Utiama Sempreboni |       01/05/2021       | Modelagem e engenharia reversa de dados|Oracle (ora)           | SchemaSpy versão 6.1.0| Graphviz versão 2.47.0 EXE installer for Windows 10 (64-bit)|

---

## Abaixo temos as notas, observações, resultados e etapas para utilização do SchemaSpy e Graphviz.

---

Notas:
- O teste foi realizado com a versão 6.1.0 do SchemaSpy.
- O teste foi realizado com a versão 2.47.0 EXE installer for Windows 10 (64-bit) do Graphviz.
- O teste foi realizado com os bancos de dados Oracle versões 12c e 18c.
- O teste foi realizado com os drivers para conexão aos bancos de dados Oracle versões ojdbc7.jar para o banco versão 12c e ojdbc8.jar para o banco versão 18c. 
- O teste foi realizado com dois cenários. Um com acesso do banco por linha de comando com todas configurações e outro com um arquivo pré configurado com todas essas informações de configuração, com nome padrão de "schemaspy.properties".

---

Observação: No teste realizado com o SchemaSpy versão 6.1.0 e Graphviz, foi possível a geração de informações, como por exemplo, quantidade de tabelas, de views, de colunas, de chaves, de anomalias, rotinas, de relacionamentos entre tabelas, de tabelas que não possuem relacionamentos, onde toda essa informação pode ser utilizada em diversas frentes, segmentos e assuntos.

---

Resultado: Sucesso. No teste com o SchemaSpy versão 6.1.0 e Graphviz foi possível a geração de informações, como por exemplo, quantidade de tabelas, de views, de colunas, de chaves, de anomalias, rotinas, de relacionamentos entre tabelas, de tabelas que não possuem relacionamentos, logo, iremos utilizar essa versão para a geração das informações.

---

Atenção: Antes de iniciar as etapas de downloads e passos seguintes, por favor, verifique a configuração abaixo. Caso já esteja correta, é possível prosseguir para as próximas etapas, caso contrário, por favor, realize as etapas abaixo de configuração, visando garantir o funcionamento correto da ferramenta SchemaSpy.
	
Configuração da conexão do banco de dados Oracle no arquivo chamado "tnsnames.ora".

1º - Abra o SQL Developer.

2º - Ao abrir a página com nome "Página de Boas-Vindas", procure a aba "Banco de Dados Detectados", procure o texto "Clique para adicionar a conexão" e logo abaixo haverá o caminho de uma pasta, parecido com este -> "C:\oracleXE\18c\dbhomeXE\network\admin".

3º - Localizando esse caminho, o copie, abra qualquer pasta do sistema, cole o caminho e de enter para entrar neste repositório do Oracle.

4º - Entrando neste repositório, procure pelo arquivo nomeado como "tnsnames.ora".

5º - Abra este arquivo com bloco de notas ou notepad.

6º - Dentro deste arquivo haverá algumas conexões, onde será necessário criar uma conexão de acordo com seu banco de dados do Oracle/SQL Developer.

7º - Mesmo tendo um "modelo" dentro do arquivo, segue abaixo uma modelo pra preenchimento comentando os campos.

8º - Para conferir as informações para preenchimento, é só conferir no SQL Developer, clicando encima do banco de dados desejado e clicando em propriedades, onde haverá as informações.

Modelo:
	
	NOME_BANCO_DADOS =
	  (DESCRIPTION =
		(ADDRESS = (PROTOCOL = TCP)(HOST = ENDEREÇO DO HOST, PODENDO SER, POR EXEMPLO, "localhost" ou um caminho de servidor)(PORT = A PORTA, NORMALMENTE A 1521))
		(CONNECT_DATA =
		  (SERVER = DEDICATED)
		  (SERVICE_NAME = Este é o serviço, normalmente descrito no campo "SID" ou "Nome do Serviço" no SQL Developer)
		)
	  )
	 
9º - Após configurar o arquivo conforme modelo acima, copie e cole abaixo dos existentes. Salve e feche. Iremos verificar se a configuração do arquivo foi reconhecida no Oracle/SQL Developer.

10º - Feche o SQL Developer e abra novamente.

11º - Ao abrir a página com nome "Página de Boas-Vindas", procure a aba "Banco de Dados Detectados", procure o texto "Clique para adicionar a conexão", e logo abaixo do caminho que foi utilizado no 2º passo, verifique se a conexão criada aparece abaixo.

12º - Caso a conexão apareça, significa que foi reconhecida, podendo assim prosseguir para os próximos passos abaixo.
	
---

## Abaixo os downloads, configuração e execução do SchemaSpy e Graphviz.

---

1º - Entrar no site oficial do SchemaSpy pelo endereço http://schemaspy.org/.

2º - Realize o download do SchemaSpy versão 6.1.0, neste caso, a última versão.

3º - Entrar no site oficial do Graphviz pelo endereço http://www.graphviz.org/.

4º - Realizar o download do Graphviz versão 2.47.0 EXE installer for Windows 10 (64-bit), neste caso, a última versão.

5º - Entrar no site oficial da Oracle e realizar o dowload do driver que o ShcemaSpy utiliza para conexão ao banco de dados. Para versão do banco de dados 12c acesse o endereço https://www.oracle.com/database/technologies/jdbc-upc-downloads.html e para versão do banco de dados 18c acesso o endereço https://www.oracle.com/database/technologies/appdev/jdbc-ucp-183-downloads.html.

6º - Realizar o dowload do driver de acordo com a versão do banco de dados. Para versão 12c utilize o driver ojdbc7.jar e para a versão 18c utilize o driver ojdbc8.jar.

7º - Crie uma pasta no local que achar mais viável para alocar os arquivos dos quais foram realizados os dowloads. Evite utilizar pastas com espaços em branco, tente utilizar um único nome ou utilize o "_" para ligação do nome. Exemplo de caminho: C:\Desktop\Temp\Arquivos.

8º - Crie uma pasta no local que achar mais viável para alocar os arquivos que serão gerados pelo SchemaSpy referente ao seu banco de dados. Evite utilizar pastas com espaços em branco tente utilizar um único nome ou utilize o "_" para ligação do nome. Exemplo de caminho: C:\Desktop\Temp\Arquivos\Repositórios.

9º - Aloque os arquivos que foram realizados os dowloads na pasta/repositório que foi criado.

10º - Nesta etapa iremos deixar um arquivo pré configurado para utilização do SchemaSpy. Crie um arquivo e nomei com "schemaspy.properties" e abra esse arquivo, por exemplo, como um bloco de notas para ser configurado no passo abaixo.

11º - Com o arquivo aberto, copie e cole o modelo abaixo para preenchimento de acordo com suas configurações do banco de dados.

12º - Modelo para configuração do arquivo:

Nota: Abaixo deixarei o link do site com os descrições dos parâmetros abaixo, assim fica fácil saber o porquê dessa configuração.

Acesse: http://schemaspy.sourceforge.net/

	Modelo:
	
	#Tipo de banco de dados. Execute com "-dbhelp" para detalhes. No caso do Oracle poderá ser o tipo "ora" ou "orathin".
	schemaspy.t=ora
	#Caminho opcional para drivers jdbc alternativos. Neste caso será o "ojdbc8.jar" o driver, pois, neste exemplo, pensaremos no banco de dados versão 18c.
	schemaspy.dp=C:\Desktop\Temp\Arquivos\ojdbc8.jar
	#Propriedades do banco de dados: host, número da porta, nome do usuário, senha e catalogo.
	schemaspy.host=localhost
	schemaspy.port=1521
	schemaspy.db=PERSONAL
	schemaspy.u=SYSTEM
	schemaspy.p=Insira a senha
	schemaspy.cat=-cat %
	#Caminho de diretório para salvar os arquvivos que serão gerados pelo SchemaSpy, por exemplo, o abaixo.
	schemaspy.o=C:\Desktop\Temp\Arquivos\Repositórios
	#Esquema do db para o qual será gerado os diagramas.
	schemaspy.s=PRODUTOS

13º - Após ter configurado o arquivo, salve e feche. Esse arquivo que foi configurado, será o (2º método) para utilização do SchemaSpy.

14º - (1º método) - Abra o Prompt de Comando (CMD). Ao lado a linha de comando de exemplo do site oficial do SchemaSpy para utilizar a ferramenta com o (CMD). Lembre-se que é necessário indicar o repositório que os arquivos de download foram alocados e depois utilizar o comando ao lado -> "java -jar schemaspy.jar -t ora -dp C:/sqljdbc4-3.0.jar -db dbName -host server -port 1433 [-s schema] -u user [-p password] -o outputDir".

15º - (1º método) - Com o (CMD) aberto, vamos configurar o caminho do repositório que estão os arquivos alocados dos downloads. Utilizando exemplo, indique o caminho da seguinte maneira "cd C:\Desktop\Temp\Arquivos" e aperte enter, onde você estará no repositório pelo CMD.

16º - (1º método) - Estando dentro do repositório dos arquivos alocados dos downloads, iremos construir o comando para executar o SchemaSpy. Seguindo o exemplo, neste caso seria o seguindo comando -> "java -jar schemaspy-6.1.0.jar -t ora -dp C:\Desktop\Temp\Arquivos\ojdbc8.jar -db PERSONAL -host localhost -port 1521 -u SYSTEM -p "Insira a senha" -c -cat % -o C:\Desktop\Temp\Arquivos\Repositórios".

17º - (1º método) - Após configurar a linha, a copie e cole dentro do (CMD) e tente rodar. Caso os passos tenham sido realizados corretamente, confira o local do caminho dos repositórios, neste caso, o caminho "C:\Desktop\Temp\Arquivos\Repositórios" , onde teremos a pasta com os arquivos. Confira o arquivo "index.html" que terá todas as informações geradas com o SchemaSpy do seu banco de dados.

18º - (1º método) - Caso queira executar estes comando de uma única vez diretamente no (CMD), utilize o '&' conforme o exemplo abaixo:

Linha de comando: "cd C:\Desktop\Temp\Arquivos&java -jar schemaspy-6.1.0.jar -t ora -dp C:\Desktop\Temp\Arquivos\ojdbc8.jar -db PERSONAL -host localhost -port 1521 -u SYSTEM -p "Insira a senha" -c -cat % -o C:\Desktop\Temp\Arquivos\Repositórios"

19º - (2º método) - Agora iremos utilizar o arquivo que foi configurado no 12º passo e configurar a linha de comando para acessar este arquivo pelo CMD e geração das informações para seu banco de dados, igual o 17º passo.

20º - (2º método) - Exclua os arquivos da pasta do repositório, que foram gerados pelos passos 16º e 17º.

21º - (2º método) - Feche e abra novamente o CMD.

22º - (2º método) - Com o (CMD) aberto, vamos configurar o caminho do repositório que estão os arquivos alocados dos downloads. Utilizando exemplo, indique o caminho da seguinte maneira "cd C:\Desktop\Temp\Arquivos" e aperte enter, onde você estará no repositório pelo CMD.

23º - (2º método) - Estando dentro do repositório dos arquivos alocados dos downloads, iremos construir o comando para executar o SchemaSpy. Seguindo o exemplo, neste caso seria o seguindo comando, onde executaremos o arquivo pré configurado no 12º passo -> java -jar schemaspy-6.1.0.jar C:\Desktop\Temp\Arquivos\schemaspy.properties.

24º - (2º método) - Após configurar a linha, a copie e cole dentro do (CMD) e tente rodar. Caso os passos tenham sido realizados corretamente, confira o local do caminho dos repositórios, neste caso, o caminho "C:\Desktop\Temp\Arquivos\Repositórios" , onde teremos a pasta com os arquivos. Confira o arquivo "index.html" que terá todas as informações geradas com o SchemaSpy do seu banco de dados.

25º - (2º método) - Caso queira executar estes comando de uma única vez diretamente no (CMD), utilize o '&' conforme o exemplo abaixo:

Linha de comando: "cd C:\Desktop\Temp\Arquivos&java -jar schemaspy-6.1.0.jar C:\Desktop\Temp\Arquivos\schemaspy.properties"

26º - Utilize o arquivo da maneira mais apropriada para sua linha de negócio, apresentações, consultas, etc.

---

## Métodos para execução do SchemaSpy com Python.

Para execução do do SchemaSpy e pensando na automatização deste processo com Pyhon, pode-ser realizar os seguintes passos, tanto no VSCode, PyCharm ou alguma IDLE de escolha do desenvolvedor.

	# Método para execução do SchemaSpy com Python e direcionando os arquivos para o diretório principal.
	# Utilizando a bilioteca nativa (os) para acessar objetos do sistema.
	
	import os
	os.system('cd Desktop\Temp\Arquivos&java -jar schemaspy-6.1.0.jar C:\Desktop\Temp\Arquivos\schemaspy.properties')
	
	# Outro teste executado em pasta temp da área de trabalho.
	import os
	os.system('cd Desktop\Temp\Modelagem_de_dados\SchemaSpy\Executaveis\PERSONAL&java -jar schemaspy-6.1.0.jar Desktop\Temp\Modelagem_de_dados\SchemaSpy\Executaveis\PERSONAL\schemaspy.properties')
	
---

## Abaixo os testes realizados com banco de dados Oracle de forma local.

---

-- Teste com banco de dados Oracle local:

-- Exemplo de utilização do SchemaSpy com um banco de dados local e repositório de pasta local.

-- Neste caso foi criada uma pasta temporária na área de trabalho e conexão com um banco de dados local que foi criado para testes.

-- Neste caso não utilizamos o comando -s para apontar o schema, pois, neste teste não temos um schema apontado.
	
-- Comando:

cd C:\Desktop\Temp\Arquivos

java -jar schemaspy-6.1.0.jar -t ora -dp C:\Desktop\Temp\Arquivos\ojdbc8.jar -db PERSONAL -host localhost -port 1521 -u SYSTEM -p 'Insira a senha' -c -cat % -o C:\Desktop\Temp\Arquivos\Repositórios

---

-- Teste com banco de dados Oracle local:

-- Exemplo de utilização do SchemaSpy com um banco de dados local e repositório de pasta local.

-- Neste caso foi criada uma pasta temporária na área de trabalho e conexão com um banco de dados local que foi criado para testes.

-- Neste caso não utilizamos o comando -s para apontar o schema, pois, neste teste não temos um schema apontado.

-- Neste caso utilizamos um arquivo pré configurado "schemaspy.properties" ao invés de apontar as configuraçãoes em linha de comando.
	
-- Comando:

cd C:\Desktop\Temp\Arquivos

java -jar schemaspy-6.1.0.jar C:\Desktop\Temp\Arquivos\schemaspy.properties

Ou

cd C:\Desktop\Temp\Arquivos&java -jar schemaspy-6.1.0.jar C:\Desktop\Temp\Arquivos\schemaspy.properties

-- Abaixo um exemplo do arquivo pré configurado nomeado como "schemaspy.properties" que foi utilizado neste teste.

	schemaspy.t=ora
	schemaspy.dp=C:\Desktop\Temp\Arquivos\ojdbc8.jar
	schemaspy.host=localhost
	schemaspy.port=1521
	schemaspy.db=PERSONAL
	schemaspy.u=SYSTEM
	schemaspy.p='Insira a senha'
	schemaspy.cat=-cat %
	schemaspy.o=C:\Desktop\Temp\Arquivos\Repositórios
	#schemaspy.s=PRODUTOS -> Neste caso está comentado, pois, não foi apontado um schema no banco de dados.

---

_Espero que ajude na utilização do SchemaSpy com o banco de dados da Oracle_ :smiley:
