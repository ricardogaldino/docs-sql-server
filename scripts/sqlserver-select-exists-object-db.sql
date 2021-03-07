/******************************************************************************************
** SQL SERVER - SCRIPTS PARA VERIFICAR A EXISTENCIA DE OBJETOS DE BANCO DE DADOS
******************************************************************************************/

-------------------------------------------------------------------------------------------
-- TABELA e VIEW
-------------------------------------------------------------------------------------------

IF EXISTS( SELECT TOP 1
                  c.TABLE_NAME                    
             FROM nomeBD.INFORMATION_SCHEMA.COLUMNS c
            WHERE UPPER( c.TABLE_NAME ) = UPPER('nomeTabela'))
BEGIN
  -- comandos
END

-------------------------------------------------------------------------------------------
-- CAMPO
-------------------------------------------------------------------------------------------

IF EXISTS( SELECT c.TABLE_NAME
                , c.COLUMN_NAME
             FROM nomeBD.INFORMATION_SCHEMA.COLUMNS c
            WHERE UPPER( c.TABLE_NAME ) = UPPER('nomeTabela')
              AND UPPER( c.COLUMN_NAME ) = UPPER('nomeCampo'))
BEGIN
  -- comandos
END

-------------------------------------------------------------------------------------------
-- CONSTRAINT
-------------------------------------------------------------------------------------------

IF EXISTS( SELECT TABLE_NAME
                , CONSTRAINT_NAME
			 , CONSTRAINT_TYPE
             FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
            WHERE UPPER(CONSTRAINT_NAME) = UPPER('nomeRestricao'))
BEGIN
  -- comandos
END

-------------------------------------------------------------------------------------------
-- DEFAULT CONSTRAINT
-------------------------------------------------------------------------------------------

IF EXISTS( SELECT c.name as constraint_name
                , t.name as table_name
                , cl.name as column_name	
             FROM sysconstraints cn
                  INNER JOIN sysobjects c on cn.constid = c.id
                  INNER JOIN sysobjects t on cn.id = t.id
                  INNER JOIN syscolumns cl on t.id = cl.id and cn.colid = cl.colid
            WHERE c.xtype = 'D'
		    AND UPPER(c.name) = UPPER('nomeValorPadrao'))         
BEGIN
  -- comandos
END

-------------------------------------------------------------------------------------------
-- STORED PROCEDURE
-------------------------------------------------------------------------------------------

IF EXISTS ( SELECT  *
              FROM sys.objects
             WHERE object_id = OBJECT_ID(N'nomeStoredProcedure')
               AND type IN ( N'P', N'PC' ) ) 
BEGIN
  -- comandos
END

-------------------------------------------------------------------------------------------
-- FUNCTION
-------------------------------------------------------------------------------------------

IF EXISTS ( SELECT  *
              FROM sys.objects
             WHERE object_id = OBJECT_ID(N'nomeFunction')
               AND type IN ( N'FN', N'FS' ) ) 
BEGIN
  -- comandos
END