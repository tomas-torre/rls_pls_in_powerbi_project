-- Consulta para combinar usuários com e sem código de filial
SELECT 
    usuario_nome, 
    usuario_cargo, 
    usuario_id, 
    usuario_email, 
    COALESCE(filial_codigo, 'central') AS tipo_acesso, 
    CASE 
        WHEN filial_codigo IS NULL THEN 'Acessar Relatório' 
        ELSE 'Nenhum' 
    END AS acesso,
    filial_codigo
FROM colaboradores
WHERE filial_codigo IS NOT NULL
UNION ALL
SELECT 
    u.usuario_nome, 
    u.usuario_cargo, 
    u.usuario_id,
    u.usuario_email, 
    'central' AS tipo_acesso, 
    'Acessar Relatório' AS acesso,
    f.filial_codigo
FROM colaboradores u
CROSS JOIN (
    SELECT DISTINCT codigo AS filial_codigo
    FROM filiais
) f
WHERE u.filial_codigo IS NULL
-- AND usuario_id = 'teste_usuario' -- filtro opcional para testar um usuário específico



-- Código M para a base de PLS_RLS
let
    Fonte = SQL.Database(banco_de_dados, schema, [ReturnSingleDatabase=true, Query="SELECT..."]),
    #"Duplicatas Removidas" = Table.Distinct(Fonte)
in
    #"Duplicatas Removidas"