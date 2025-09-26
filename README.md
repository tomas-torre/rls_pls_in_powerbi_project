# Projeto de RLS e PLS no Power BI - modelo para grandes corporações
## Objetivo

Demonstrar a aplicação prática de Row-Level Security (RLS) e Page-Level Security (PLS) em um modelo de dados no Power BI, voltado para ambientes corporativos. O projeto garante que cada usuário visualize apenas as informações pertinentes ao seu perfil, podendo ser aplicado a diferentes áreas, subáreas e filiais.

.
## Metodologia
### RLS (Row-Level Security)

- Filtra dados automaticamente com base no usuário logado (via USERPRINCIPALNAME()).
- Regras aplicam filtros de linha conforme perfil ou grupo de usuários.
- Usuários de filiais veem apenas os dados correspondentes à sua unidade.

### PLS (Page-Level Security)

- Controla navegação e visualização de páginas do relatório.
- Perfil do usuário determina quais páginas podem ser acessadas.
- Administradores têm acesso completo; usuários restritos veem apenas páginas específicas.
- Implementado com botões de navegação e DAX para visibilidade de elementos.


.
## Funcionamento do Modelo

- Usuário acessa o relatório no Power BI Service.
- Power BI identifica o e-mail corporativo via USERPRINCIPALNAME().
- Regras de RLS aplicam filtros de linha automaticamente.=
- Regras de PLS controlam a navegação e exibem páginas permitidas.
- Usuário obtém experiência personalizada e segura.


.
## Benefícios

- **Segurança de dados:** acesso restrito conforme perfil.
- **Governança corporativa:** alinhamento às regras internas.
- **Escalabilidade:** aplicável a diferentes áreas, filiais e perfis.
- **Experiência do usuário:** interface ajustada conforme necessidade.


.
## Estrutura do Projeto

- **Dataset:** preparado para suportar filtros de segurança. -- quando num banco SQL, use o código disponibilizado em .sql
- **Tabela de Controle (PLS_RLS):** armazena perfis de usuário e regras de acesso.
- **Regras DAX:** implementadas em RLS e PLS.
- **Relatórios e Páginas:** configurados para variar conforme perfil do usuário.


.
## Gerenciamento de Relacionamentos

- Relacionamento entre a tabela de PLS_RLS e tabelas de apoio para aplicação das regras.
- Modelagem permite controle eficiente de acessos e navegação.


.
## Exemplos de Usuários
**Usuário 1** – Cargo: Presidente, Central – acesso completo.
**Usuário 17** – Cargo: Coordenador, Filial 3 – acesso restrito.
