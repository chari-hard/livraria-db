# Atividade IV - BCD: Sistema de Gerenciamento de Livraria

## 1. Domínio do Banco de Dados
O domínio escolhido é o gerenciamento de uma **Livraria Online**, controlando o cadastro de clientes, categorias, catálogo de livros, pedidos realizados e os itens de cada pedido.

## 2. Contextualização (Problema sem SGBD)
Antes da implementação do SGBD relacional, a livraria utilizava planilhas eletrônicas locais e arquivos desconexos para gerenciar o estoque e as vendas. Isso gerava problemas graves como:
- **Duplicidade de dados:** Clientes cadastrados várias vezes com informações divergentes.
- **Inconsistência de estoque:** Livros vendidos sem baixa correta no estoque devido a erros humanos.
- **Falta de integridade:** Pedidos vinculados a clientes ou livros que não existiam mais no sistema.
- **Dificuldade de relatórios:** Impossibilidade de extrair cruzamentos rápidos de dados financeiros e de vendas.

## 3. Proposta de Melhoria (Solução com SGBD Relacional)
A implementação do banco de dados relacional MySQL centraliza as informações, garantindo:
- **Integridade Referencial:** Uso de chaves estrangeiras (`FOREIGN KEY`) para impedir dados órfãos.
- **Atomicidade e Segurança:** Transações controladas e dados estruturados.
- **Agilidade:** Consultas complexas (`JOIN`, `GROUP BY`, `SUM`) executadas em frações de segundo para tomada de decisão.

## 4. Modelagem Lógica do Banco de Dados
O banco de dados é composto por 5 tabelas interligadas:
- **categorias** (`id_categoria` [PK], `nome_categoria`)
- **clientes** (`id_cliente` [PK], `nome`, `email`, `telefone`, `cidade`)
- **livros** (`id_livro` [PK], `titulo`, `preco`, `estoque`, `id_categoria` [FK])
- **pedidos** (`id_pedido` [PK], `data_pedido`, `id_cliente` [FK], `status_pedido`)
- **itens_pedidos** (`id_item` [PK], `id_pedido` [FK], `id_livro` [FK], `quantidade`)
*(Relacionamentos: 1 para N entre Categorias e Livros, Clientes e Pedidos, Pedidos e Itens; e N para N resolvido por Itens_Pedidos entre Pedidos e Livros).*

## 5. Aplicação das Formas Normais
- **1FN (Primeira Forma Normal):** Todos os atributos contêm apenas valores atômicos e indivisíveis, e cada tabela possui uma chave primária definida. Não há grupos repetitivos.
- **2FN (Segunda Forma Normal):** O banco está na 1FN e todos os atributos não-chave dependem inteiramente da chave primária (sem dependência parcial).
- **3FN (Terceira Forma Normal):** O banco está na 2FN e não possui dependências transitivas (colunas não-chave dependem exclusivamente da chave primária).
- **4FN (Quarta Forma Normal):** O banco está na 3FN e não contém dependências multivaloradas independentes.
