--Observação: Existem diversas formas de alterar uma tabela, veja estes exemplos práticos

--Adicionar uma Coluna:
ALTER TABLE produtos
ADD marca VARCHAR(50) NOT NULL;

--Remover uma Coluna:
ALTER TABLE produtos
DROP COLUMN filial;

--Modificar o Tipo de Dados de uma Coluna:
ALTER TABLE produtos
MODIFY COLUMN valor DECIMAL(12,2);

--Renomear uma Coluna:
ALTER TABLE produtos
CHANGE COLUMN quantidade_estoque estoque INT NOT NULL;

--Adicionar uma Restrição (Constraint):
ALTER TABLE produtos
ADD CONSTRAINT valor_maior_que_zero CHECK (valor > 0);

--Remover uma Restrição (Constraint):
ALTER TABLE produtos
DROP CONSTRAINT valor_maior_que_zero;

--Renomear a Tabela:
ALTER TABLE produtos
RENAME TO produtos_novos;

--Adicionar uma Chave Estrangeira:
ALTER TABLE produtos
ADD CONSTRAINT fk_filial
FOREIGN KEY (filial_id) REFERENCES filiais(id);

--Remover uma Chave Estrangeira:
ALTER TABLE produtos
DROP CONSTRAINT fk_filial;