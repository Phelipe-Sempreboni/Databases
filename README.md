# Databases

---

#### Repositório para informações e apoio sobre banco de dados, onde inicialmente era somente para um tipo, porém, virou um repositório variado!

#### Também será abordado assuntos como Data Warehouses, Data Marts, Datalakes, ETL/ETC, Modelagem de dados, entre outros.

---

Como sempre busco na web informações sobre banco de dados quando preciso continuar um projeto ou assunto que desconheço, na própria documentação ou no Stack Overflow, criei esse repositório visando tentar ajudar (quem chegar até aqui) com informações sobre databases, Data Warehouses, Data Marts, Datalakes, ETL/ETC, Modelagem de dados, entre outros, com querys, consultas, tipos e/ou divisões __(DQL, DML, DDL, DCL, DTL)__ e até onde for possível ajudar e de acordo com avanço dos meus conhecimentos, estudos, trabalho e tudo que puder agregar para a comunidade.

Neste arquivo README.md serão mantidas diversas informações e que julgar mais importantes para este mundo incrível de database, dados, modelagem de dados e todos assuntos que nos cercam!

---

#### Abaixo os tipos e/ou divisões e significados das siglas para quem não souber e são importantes dentro das ferramentas de banco de dados.

* DDL - Data Definition Language (Linguagem de Definição de Dados) - É um conjunto de instruções usado para criar e modificar as estrutudas dos objetos armazenados no banco de dados.

* DQL - Data Query Language (Linguagem de Consulta de dados) - É um conjunto de instruções usar para consultar dados nas estruturas dos objetos armazenados no banco de dados.

* DML - Data Manipulation Language (Linguagem de Manipulação de Dados) - É um conjunto de instruções usada nas consultas e modificações dos dados armazenados nas tabelas do banco de dados.

* DCL - Data Control Language (Linguagem de Controle de Dados) - São usados para controle de acesso e gerenciamento de permissões para usuários no banco de dados.

* DTL - Data Transaction Language (Linguagem de Controle de Transação de Dados) - São usados para gerenciar as mudanças feitas por instruções DML e permite as declarações serem agrupadas em transações lógicas.

* PL/SQL - Procedural Language extensions to SQL (Extensões de linguagem procedural para SQL) - Comandos nativos para Oracle Database.

---

#### Abaixo conceitos importantes sobre JOINS (Junções) em bancos de Dados.

* INNER JOIN - Retorna registros que possuem valores correspondentes nas duas tabelas.

* LEFT OUTER JOIN - Retorna todos os registros da tabela a esquerda e registros correspondentes da tabela a direita.

* RIGHT OUTER JOIN - Retorna todos os registros da tabela da direita e os registros correspondentes da tabela da esquerda.

* FULL OUTER JOIN - Retorna todos os registros quando houver uma correspondência na tabela esquerda ou direta.

---

#### Abaixo conceitos importantes sobre Data Warehouse.

* É uma base de dados que facilita a execução de consultas de apoio à decisão.

* Fornece uma imagem global da realidade do negócio a partir de suas operações.

* Exibe informações em niveís apropriados e variados de detalhes.

* Otimizar o processamento de consultas complexas.

* Orientado por assunto.

* Integrado.

* Dados históricos.

* Não volátil.

- Exemplo abaixo para um melhor entendimento.

![image](https://user-images.githubusercontent.com/57469401/130877850-ff5fe427-31a6-4e71-a44c-bd8ca41c9932.png)

---

#### Abaixo conceitos importantes sobre Data Mart.

* Visão setorial para tratar um assunto específico (área) ou diferentes niveís de sumarização.

* Atene às necessidades de informações de uma determinada comunidade de usuários.

---

Data Warehouse vs Data Mart.

* Data Marts são subconjuntos departamentais focados em assuntos selecionados.

* Quando falamos em Data Marts, seria falar sobre setorização do Data Warehouse, onde o DW realiza o armazenamento e com os Data Marts podemos setorizar os assuntos, como por exemplo, financeiro, compras, vendas, atendimento ao cliente, entre outros.

---

#### Abaixo conceitos importantes sobre ETL/ETC.


* Realizamos o processo de ETL (Extract, transform e load) ou ETC (Extração, trasnformação e carga) para extrair informações das mais diversas fontes de dados, tratamos os dados deixando em formatos amigáveis e carregamos esses dados para o Data Warehouse.

- Exemplo abaixo para um melhor entendimento.

![image](https://user-images.githubusercontent.com/57469401/130878452-877d431d-1af7-49a3-b81e-abb246daf144.png)

---

#### Abaixo conceitos importantes sobre Data Warehousing.

* Data Warehousing é o processo de extrair dados de sistemas transacionais e transformá-los em informação organizada em um formato amigável.

- Exemplo abaixo para um melhor entendimento.

![image](https://user-images.githubusercontent.com/57469401/130878684-36f3eba4-3b72-41a8-a312-c439c552e7ef.png)

---

#### Abaixo conceitos importantes sobre OLTP (Online Transaction Processing - Nível Operacional) e OLAP (OnlineAnalytica Processing - Nível Estratégico).

* OLTP (Online Transaction Processing - Nível Operacional):
  - Finalidade é controlar e executar tarefas empresariais fundamentais.
  - Dados Operacioais, atuais, refletem o presente.
  - São a fonte original dos dados.

* OLAP (Online Analytical Processing - Nível Estratégico):
  - Finalidade é ajudar no planejamento, resolução de problemas e suporte à decisão.
  - Dados de consolidação, históricos.
  - Originários de vários bancos de dados OLTP.

---

* Abaixo deixo uma animação/imagem que a Semantix fez sobre o funcionamento de um processo de ETL/ETC, que ficou show:

![image](https://user-images.githubusercontent.com/57469401/130879284-6c80a48a-f8f3-4e4b-bc85-dd6a68bebc97.png)

---


[Acesse meu GitHub :cat:](https://github.com/Phelipe-Sempreboni)

[Acesse meu LinkedIn :computer:](https://www.linkedin.com/in/luiz-phelipe-utiama-sempreboni-319902169/)

---

_Espero ajudar_ :smiley:
