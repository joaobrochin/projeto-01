-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2022-09-06 16:09:13 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_sgv_acesso (
    cod_acesso                    NUMBER(6) NOT NULL,
    dat_acesso                    DATE NOT NULL,
    t_sgv_cli_t_sgv_d_cdt_cod_cad NUMBER(6) NOT NULL,
    t_sgv_cli_cod_cli             NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_sgv_acesso.cod_acesso IS
    'PK código de acesso incremental';

COMMENT ON COLUMN t_sgv_acesso.dat_acesso IS
    'Data de acesso ao portal pelo funcionario';

COMMENT ON COLUMN t_sgv_acesso.t_sgv_cli_t_sgv_d_cdt_cod_cad IS
    'Nome: PF T_SGV_CLIENTE_T_SGV_DADOS_CADASTRAIS_cod_cadastro';

COMMENT ON COLUMN t_sgv_acesso.t_sgv_cli_cod_cli IS
    'Nome:PF  T_SGV_CLIENTE_cod_cliente ';

ALTER TABLE t_sgv_acesso
    ADD CONSTRAINT t_sgv_acss_pk PRIMARY KEY ( cod_acesso,
                                               t_sgv_cli_t_sgv_d_cdt_cod_cad,
                                               t_sgv_cli_cod_cli );

CREATE TABLE t_sgv_cargo (
    cod_cargo NUMBER(2) NOT NULL,
    des_cargo NVARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN t_sgv_cargo.cod_cargo IS
    'PK código de cargo incremental';

COMMENT ON COLUMN t_sgv_cargo.des_cargo IS
    'Descrição do cargo';

ALTER TABLE t_sgv_cargo ADD CONSTRAINT t_sgv_crg_pk PRIMARY KEY ( cod_cargo );

ALTER TABLE t_sgv_cargo ADD CONSTRAINT t_sgv_crg_un_des_crg UNIQUE ( des_cargo );

CREATE TABLE t_sgv_categoria_prod (
    cod_categoria         NUMBER(6) NOT NULL,
    des_categoria_produto NVARCHAR2(45) NOT NULL,
    sta_categoria         CHAR(1) NOT NULL,
    dat_inicio            DATE NOT NULL,
    dat_termino           DATE
);

COMMENT ON COLUMN t_sgv_categoria_prod.cod_categoria IS
    'PK código de categoria';

COMMENT ON COLUMN t_sgv_categoria_prod.des_categoria_produto IS
    'Categoria dos produtos';

COMMENT ON COLUMN t_sgv_categoria_prod.sta_categoria IS
    'Status da categoria
A - Ativo
I - Inativo';

COMMENT ON COLUMN t_sgv_categoria_prod.dat_inicio IS
    'Data de cadastro da categoria';

COMMENT ON COLUMN t_sgv_categoria_prod.dat_termino IS
    'Data de término da categoria';

ALTER TABLE t_sgv_categoria_prod
    ADD CONSTRAINT t_sgv_cat_prd_ck_sts_cat CHECK ( sta_categoria = upper('A')
                                                    OR sta_categoria = upper('I') );

ALTER TABLE t_sgv_categoria_prod ADD CONSTRAINT t_sgv_cat_prod_pk PRIMARY KEY ( cod_categoria );

ALTER TABLE t_sgv_categoria_prod ADD CONSTRAINT t_sgv_cat_prd__un_des_cat_prd UNIQUE ( des_categoria_produto );

CREATE TABLE t_sgv_categoria_video (
    cod_categoria_video NUMBER(6) NOT NULL,
    des_categoria_video VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN t_sgv_categoria_video.cod_categoria_video IS
    'PK código categoria vídeo incremental';

COMMENT ON COLUMN t_sgv_categoria_video.des_categoria_video IS
    'Descrição da categoria de video';

ALTER TABLE t_sgv_categoria_video ADD CONSTRAINT t_sgv_cat_vid_pk PRIMARY KEY ( cod_categoria_video );

ALTER TABLE t_sgv_categoria_video ADD CONSTRAINT t_sgv_cat_vid__un_des_cat_vid UNIQUE ( des_categoria_video );

CREATE TABLE t_sgv_chamado (
    cod_chamado                   NUMBER(6) NOT NULL,
    dat_abertura_chamado          DATE NOT NULL,
    dat_atendimento               DATE,
    dat_encerramento              DATE,
    num_satisfacao                NUMBER(2),
    tip_chamado                   CHAR(1) NOT NULL,
    des_chamado_cliente           VARCHAR2(4000) NOT NULL,
    des_chamado_funcionario       VARCHAR2(4000),
    sta_chamado                   CHAR(1) NOT NULL,
    t_sgv_prd_cod_prd             NUMBER(6) NOT NULL,
    t_sgv_fnc_t_sgv_d_cdt_cod_cad NUMBER(6),
    t_sgv_fnc_cod_rm_fnc          NUMBER(6),
    t_sgv_cli_t_sgv_d_cdt_cod_cad NUMBER(6) NOT NULL,
    t_sgv_cli_cod_cli             NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_sgv_chamado.cod_chamado IS
    'PK código chamado incremental';

COMMENT ON COLUMN t_sgv_chamado.dat_abertura_chamado IS
    'Data de abertura do chamado pelo cliente';

COMMENT ON COLUMN t_sgv_chamado.dat_atendimento IS
    'Data do primeiro atendimento do funcionario sobre o chamado';

COMMENT ON COLUMN t_sgv_chamado.dat_encerramento IS
    'Data de encerramento do chamado quando o mesmo é finalizado';

COMMENT ON COLUMN t_sgv_chamado.num_satisfacao IS
    'Indice de satisfação - 1 à 10

1 - menos satisfeito
10 - mais satisfeito';

COMMENT ON COLUMN t_sgv_chamado.tip_chamado IS
    '1 - Tipo 1 : Sugestão
2 - Tipo 2 : Reclamação';

COMMENT ON COLUMN t_sgv_chamado.des_chamado_cliente IS
    'Descricao do chamado aberto pelo cliente';

COMMENT ON COLUMN t_sgv_chamado.des_chamado_funcionario IS
    'Descricao do atendimento do funcionario';

COMMENT ON COLUMN t_sgv_chamado.sta_chamado IS
    'status de chamado
sts_chamado
A - aberto
C - cancelado
E - em atendimento
F - fechao com sucesso
X - fechando com instatisfacao';

COMMENT ON COLUMN t_sgv_chamado.t_sgv_prd_cod_prd IS
    'T_SGV_PRODUTOS_cod_produto';

COMMENT ON COLUMN t_sgv_chamado.t_sgv_fnc_t_sgv_d_cdt_cod_cad IS
    'F cod_cadastro.cod_rm_funcionario
Nome: FK  T_SGV_FUNCIONARIO_T_SGV_DADOS_CADASTRAIS_cod_cadastro';

COMMENT ON COLUMN t_sgv_chamado.t_sgv_fnc_cod_rm_fnc IS
    'Nome: FK T_SGV_FUNCIONARIO_cod_rm_funcionario';

COMMENT ON COLUMN t_sgv_chamado.t_sgv_cli_t_sgv_d_cdt_cod_cad IS
    'F cod_cadastro.cod_cliente
Nome: FK  T_SGV_CLIENTE_T_SGV_DADOS_CADASTRAIS_cod_cadastro';

COMMENT ON COLUMN t_sgv_chamado.t_sgv_cli_cod_cli IS
    'Nome: FK T_SGV_CLIENTE_cod_cliente';

ALTER TABLE t_sgv_chamado
    ADD CONSTRAINT t_sgv_cmd_ck_num_stfc CHECK ( num_satisfacao > 0
                                                 AND num_satisfacao < 11 );

ALTER TABLE t_sgv_chamado
    ADD CONSTRAINT t_sgv_chamados_ck_sta_cmd CHECK ( sta_chamado = upper('A')
                                                     OR sta_chamado = upper('C')
                                                     OR sta_chamado = upper('E')
                                                     OR sta_chamado = upper('F')
                                                     OR sta_chamado = upper('X') );

ALTER TABLE t_sgv_chamado
    ADD CONSTRAINT t_sgv_chamados_ck_tip_cmd CHECK ( tip_chamado = '1'
                                                     OR tip_chamado = '2' );

ALTER TABLE t_sgv_chamado ADD CONSTRAINT t_sgv_chamados_pk PRIMARY KEY ( cod_chamado );

CREATE TABLE t_sgv_cliente (
    cod_cliente            NUMBER(6) NOT NULL,
    t_sgv_d_cdt_cod_cad    NUMBER(6) NOT NULL,
    des_genero             CHAR(1) NOT NULL,
    tip_cliente            CHAR(1) NOT NULL,
    num_cpf                NUMBER(11),
    num_rg                 NUMBER(10),
    num_cnpj               NUMBER(14),
    num_inscricao_estadual NUMBER(9)
);

COMMENT ON COLUMN t_sgv_cliente.cod_cliente IS
    'PK código de cliente incremental';

COMMENT ON COLUMN t_sgv_cliente.t_sgv_d_cdt_cod_cad IS
    'Nome: PF  T_SGV_DADOS_CADASTRAIS_cod_cadastro';

COMMENT ON COLUMN t_sgv_cliente.des_genero IS
    'descricao de gênero
F - Feminino
M - Masculino
O - Outro';

COMMENT ON COLUMN t_sgv_cliente.tip_cliente IS
    'Tipo de cliente
F - Fisico
J - Juridico';

COMMENT ON COLUMN t_sgv_cliente.num_cpf IS
    'CPF do cliente fisico';

COMMENT ON COLUMN t_sgv_cliente.num_rg IS
    'RG do cliente fisico';

COMMENT ON COLUMN t_sgv_cliente.num_cnpj IS
    'código do CNPJ';

COMMENT ON COLUMN t_sgv_cliente.num_inscricao_estadual IS
    'Código de inscrição estadual empresa';

ALTER TABLE t_sgv_cliente
    ADD CONSTRAINT t_sgv_cli_ck_tip_cli CHECK ( tip_cliente = upper('F')
                                                OR tip_cliente = upper('J') );

ALTER TABLE t_sgv_cliente
    ADD CONSTRAINT t_sgv_cli_ck_des_gen CHECK ( des_genero = upper('F')
                                                OR des_genero = upper('M')
                                                OR des_genero = upper('O') );

ALTER TABLE t_sgv_cliente ADD CONSTRAINT t_sgv_cli_pk PRIMARY KEY ( t_sgv_d_cdt_cod_cad,
                                                                    cod_cliente );

ALTER TABLE t_sgv_cliente ADD CONSTRAINT t_sgv_cli__un_num_cpf UNIQUE ( num_cpf );

ALTER TABLE t_sgv_cliente ADD CONSTRAINT t_sgv_cli__un_num_rg UNIQUE ( num_rg );

ALTER TABLE t_sgv_cliente ADD CONSTRAINT t_sgv_cli__un_num_cnpj UNIQUE ( num_cnpj );

ALTER TABLE t_sgv_cliente ADD CONSTRAINT t_sgv_cli__un_num_ins_est UNIQUE ( num_inscricao_estadual );

CREATE TABLE t_sgv_dados_cadastral (
    cod_cadastro   NUMBER(6) NOT NULL,
    nom_cadastro   VARCHAR2(45) NOT NULL,
    dat_nascimento DATE NOT NULL,
    nom_login      VARCHAR2(20) NOT NULL,
    inf_senha      VARCHAR2(20) NOT NULL,
    des_email      VARCHAR2(20) NOT NULL
);

ALTER TABLE t_sgv_dados_cadastral
    ADD CONSTRAINT sgv_cad_cli_func_lov CHECK ( nom_cadastro IN ( 'T_SGV_FUNCIONARIO', 'T_SGV_CLIENTE' ) );

COMMENT ON COLUMN t_sgv_dados_cadastral.cod_cadastro IS
    'PK código de cadastro incremental';

COMMENT ON COLUMN t_sgv_dados_cadastral.nom_cadastro IS
    'Nome do cadastro';

COMMENT ON COLUMN t_sgv_dados_cadastral.dat_nascimento IS
    'Data de nascimento ou data de abertura CNPJ';

COMMENT ON COLUMN t_sgv_dados_cadastral.nom_login IS
    'Nome do login de acesso';

COMMENT ON COLUMN t_sgv_dados_cadastral.inf_senha IS
    'código de senha de acesso';

COMMENT ON COLUMN t_sgv_dados_cadastral.des_email IS
    'Email de cadastro para contato';

ALTER TABLE t_sgv_dados_cadastral ADD CONSTRAINT t_sgv_d_cdt_pk PRIMARY KEY ( cod_cadastro );

ALTER TABLE t_sgv_dados_cadastral ADD CONSTRAINT t_sgv_d_cdt__un_nom_lg UNIQUE ( nom_login );

ALTER TABLE t_sgv_dados_cadastral ADD CONSTRAINT t_sgv_d_cdt__un_des_email UNIQUE ( des_email );

CREATE TABLE t_sgv_departamento (
    cod_departamento NUMBER(2) NOT NULL,
    des_departamento NVARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN t_sgv_departamento.cod_departamento IS
    'pk código de departamento incremental';

COMMENT ON COLUMN t_sgv_departamento.des_departamento IS
    'Nome do departamento';

ALTER TABLE t_sgv_departamento ADD CONSTRAINT t_sgv_dpt_pk PRIMARY KEY ( cod_departamento );

ALTER TABLE t_sgv_departamento ADD CONSTRAINT t_sgv_dpt_un_des_dpt UNIQUE ( des_departamento );

CREATE TABLE t_sgv_funcionario (
    cod_rm_func         NUMBER(6) NOT NULL,
    t_sgv_d_cdt_cod_cad NUMBER(6) NOT NULL,
    t_sgv_crg_cod_crg   NUMBER(2) NOT NULL,
    t_sgv_dpt_cod_dpt   NUMBER(2) NOT NULL
);

COMMENT ON COLUMN t_sgv_funcionario.cod_rm_func IS
    'código de RM do funcionário';

COMMENT ON COLUMN t_sgv_funcionario.t_sgv_d_cdt_cod_cad IS
    'Nome: PF T_SGV_DADOS_CADASTRAIS_cod_cadastro';

COMMENT ON COLUMN t_sgv_funcionario.t_sgv_crg_cod_crg IS
    'Nome: FK T_SGV_CARGO_cod_cargo';

COMMENT ON COLUMN t_sgv_funcionario.t_sgv_dpt_cod_dpt IS
    'Nome: FK T_SGV_DEPARTAMENTO_cod_departamento';

ALTER TABLE t_sgv_funcionario ADD CONSTRAINT t_sgv_fnc_pk PRIMARY KEY ( t_sgv_d_cdt_cod_cad,
                                                                        cod_rm_func );

CREATE TABLE t_sgv_produto (
    cod_produto            NUMBER(6) NOT NULL,
    des_short_produto      VARCHAR2(20) NOT NULL,
    des_compl_produto      VARCHAR2(100) NOT NULL,
    num_ean13              NUMBER(13),
    val_preco              NUMBER(9, 2) NOT NULL,
    sta_produto            CHAR(1) NOT NULL,
    t_sgv_cat_prod_cod_cat NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_sgv_produto.cod_produto IS
    'código do produto automático do sistema SGV';

COMMENT ON COLUMN t_sgv_produto.des_short_produto IS
    'descrição breve do produto';

COMMENT ON COLUMN t_sgv_produto.des_compl_produto IS
    'descrição completa do produto';

COMMENT ON COLUMN t_sgv_produto.num_ean13 IS
    'código EAN 13 do produto - codigo de barras';

COMMENT ON COLUMN t_sgv_produto.val_preco IS
    'Preço do produto';

COMMENT ON COLUMN t_sgv_produto.sta_produto IS
    'Campo de status do produto
Valores A - Ativo, I - Inativo, P - prologado ';

COMMENT ON COLUMN t_sgv_produto.t_sgv_cat_prod_cod_cat IS
    'Nome: FK T_SGV_CATEGORIA_PROD_con_categoria';

ALTER TABLE t_sgv_produto
    ADD CONSTRAINT t_sgv_prod_ck_sta_prd CHECK ( sta_produto = upper('A')
                                                 OR sta_produto = upper('I')
                                                 OR sta_produto = upper('P') );

ALTER TABLE t_sgv_produto ADD CONSTRAINT t_sgv_prod_pk PRIMARY KEY ( cod_produto );

ALTER TABLE t_sgv_produto ADD CONSTRAINT t_sgv_prod_un_ean13 UNIQUE ( num_ean13 );

CREATE TABLE t_sgv_telefone (
    num_telefone_completo NUMBER(4) NOT NULL,
    num_telefone          NUMBER(9) NOT NULL,
    num_ddd               NUMBER(2) NOT NULL,
    t_sgv_d_cdt_cod_cad   NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_sgv_telefone.num_telefone_completo IS
    'Cod de identificacao do numero do telefone completo';

COMMENT ON COLUMN t_sgv_telefone.num_telefone IS
    'Número do telefone (até 9 digitos)';

COMMENT ON COLUMN t_sgv_telefone.num_ddd IS
    'DDD do telefone';

COMMENT ON COLUMN t_sgv_telefone.t_sgv_d_cdt_cod_cad IS
    'Nome: PF  T_SGV_DADOS_CADASTRAIS_cod_cadastro';

ALTER TABLE t_sgv_telefone ADD CONSTRAINT t_sgv_tel_pk PRIMARY KEY ( num_telefone_completo,
                                                                     t_sgv_d_cdt_cod_cad );

ALTER TABLE t_sgv_telefone ADD CONSTRAINT t_sgv_tel__un_num_tel UNIQUE ( num_telefone );

CREATE TABLE t_sgv_video_prod (
    cod_video                 NUMBER(6) NOT NULL,
    nom_video                 VARCHAR2(20) NOT NULL,
    sta_video                 CHAR(1) NOT NULL,
    ctd_video                 BLOB NOT NULL,
    t_sgv_prd_cod_prd         NUMBER(6) NOT NULL,
    t_sgv_cat_vid_cod_cat_vid NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_sgv_video_prod.cod_video IS
    'PK código de vídeo incremental';

COMMENT ON COLUMN t_sgv_video_prod.nom_video IS
    'Nome do vídeo';

COMMENT ON COLUMN t_sgv_video_prod.sta_video IS
    'Status do video 
A - Ativo
I - Inativo';

COMMENT ON COLUMN t_sgv_video_prod.ctd_video IS
    'Conteúdo do vídeo';

COMMENT ON COLUMN t_sgv_video_prod.t_sgv_prd_cod_prd IS
    'Nome: FK T_SGV_PRODUTOS_cod_produto';

COMMENT ON COLUMN t_sgv_video_prod.t_sgv_cat_vid_cod_cat_vid IS
    'Nome: FK T_SGV_CATEGORIA_VIDEO_cod_categoria_video';

ALTER TABLE t_sgv_video_prod
    ADD CONSTRAINT t_sgv_video_prod_ck_sts_vid CHECK ( sta_video = upper('A')
                                                       OR sta_video = upper('I') );

ALTER TABLE t_sgv_video_prod ADD CONSTRAINT t_sgv_vid_prod_pk PRIMARY KEY ( cod_video );

CREATE TABLE t_sgv_visualizacao_video (
    cod_visualizacao             NUMBER(6) NOT NULL,
    dat_visualizacao             DATE NOT NULL,
    t_sgv_vid_prod_cod_vid       NUMBER(6) NOT NULL,
    t_sgv_cli_t_sgv_d_cad_cd_cad NUMBER(6),
    t_sgv_cli_cod_cli            NUMBER(6)
);

COMMENT ON COLUMN t_sgv_visualizacao_video.cod_visualizacao IS
    'PK código de visualização incremental';

COMMENT ON COLUMN t_sgv_visualizacao_video.dat_visualizacao IS
    'Data de visualização do video';

COMMENT ON COLUMN t_sgv_visualizacao_video.t_sgv_vid_prod_cod_vid IS
    'Nome: FK T_SGV_VIDEO_PROD_cod_video';

COMMENT ON COLUMN t_sgv_visualizacao_video.t_sgv_cli_t_sgv_d_cad_cd_cad IS
    'Nome: FK T_SGV_CLIENTE_T_SGV_DADOS_CADASTRAIS_cod_cadastro';

COMMENT ON COLUMN t_sgv_visualizacao_video.t_sgv_cli_cod_cli IS
    'Nome: FK T_SGV_CLIENTE_cod_cliente';

ALTER TABLE t_sgv_visualizacao_video ADD CONSTRAINT t_sgv_visz_vid_pk PRIMARY KEY ( cod_visualizacao,
                                                                                    t_sgv_vid_prod_cod_vid );

ALTER TABLE t_sgv_acesso
    ADD CONSTRAINT t_sgv_acss_t_sgv_cli_fk FOREIGN KEY ( t_sgv_cli_t_sgv_d_cdt_cod_cad,
                                                         t_sgv_cli_cod_cli )
        REFERENCES t_sgv_cliente ( t_sgv_d_cdt_cod_cad,
                                   cod_cliente );

ALTER TABLE t_sgv_chamado
    ADD CONSTRAINT t_sgv_chmd_t_sgv_cli_fk FOREIGN KEY ( t_sgv_cli_t_sgv_d_cdt_cod_cad,
                                                         t_sgv_cli_cod_cli )
        REFERENCES t_sgv_cliente ( t_sgv_d_cdt_cod_cad,
                                   cod_cliente );

ALTER TABLE t_sgv_chamado
    ADD CONSTRAINT t_sgv_chmd_t_sgv_fnc_fk FOREIGN KEY ( t_sgv_fnc_t_sgv_d_cdt_cod_cad,
                                                         t_sgv_fnc_cod_rm_fnc )
        REFERENCES t_sgv_funcionario ( t_sgv_d_cdt_cod_cad,
                                       cod_rm_func );

ALTER TABLE t_sgv_chamado
    ADD CONSTRAINT t_sgv_chmd_t_sgv_prd_fk FOREIGN KEY ( t_sgv_prd_cod_prd )
        REFERENCES t_sgv_produto ( cod_produto );

ALTER TABLE t_sgv_cliente
    ADD CONSTRAINT t_sgv_cli_t_sgv_d_cdt_fk FOREIGN KEY ( t_sgv_d_cdt_cod_cad )
        REFERENCES t_sgv_dados_cadastral ( cod_cadastro );

ALTER TABLE t_sgv_funcionario
    ADD CONSTRAINT t_sgv_fnc_t_sgv_crg_fk FOREIGN KEY ( t_sgv_crg_cod_crg )
        REFERENCES t_sgv_cargo ( cod_cargo );

ALTER TABLE t_sgv_funcionario
    ADD CONSTRAINT t_sgv_fnc_t_sgv_d_cdt_fk FOREIGN KEY ( t_sgv_d_cdt_cod_cad )
        REFERENCES t_sgv_dados_cadastral ( cod_cadastro );

ALTER TABLE t_sgv_funcionario
    ADD CONSTRAINT t_sgv_fnc_t_sgv_dpt_fk FOREIGN KEY ( t_sgv_dpt_cod_dpt )
        REFERENCES t_sgv_departamento ( cod_departamento );

ALTER TABLE t_sgv_produto
    ADD CONSTRAINT t_sgv_prod_t_sgv_cat_prod_fk FOREIGN KEY ( t_sgv_cat_prod_cod_cat )
        REFERENCES t_sgv_categoria_prod ( cod_categoria );

ALTER TABLE t_sgv_telefone
    ADD CONSTRAINT t_sgv_tel_t_sgv_d_cdt_fk FOREIGN KEY ( t_sgv_d_cdt_cod_cad )
        REFERENCES t_sgv_dados_cadastral ( cod_cadastro );

ALTER TABLE t_sgv_video_prod
    ADD CONSTRAINT t_sgv_vid_prd_t_sgv_ct_vid_fk FOREIGN KEY ( t_sgv_cat_vid_cod_cat_vid )
        REFERENCES t_sgv_categoria_video ( cod_categoria_video );

ALTER TABLE t_sgv_video_prod
    ADD CONSTRAINT t_sgv_vid_prd_t_sgv_prd_fk FOREIGN KEY ( t_sgv_prd_cod_prd )
        REFERENCES t_sgv_produto ( cod_produto );

ALTER TABLE t_sgv_visualizacao_video
    ADD CONSTRAINT t_sgv_visz_vid_t_sgv_cli_fk FOREIGN KEY ( t_sgv_cli_t_sgv_d_cad_cd_cad,
                                                             t_sgv_cli_cod_cli )
        REFERENCES t_sgv_cliente ( t_sgv_d_cdt_cod_cad,
                                   cod_cliente );

ALTER TABLE t_sgv_visualizacao_video
    ADD CONSTRAINT t_sgv_visz_vid_t_sgv_vid_pd_fk FOREIGN KEY ( t_sgv_vid_prod_cod_vid )
        REFERENCES t_sgv_video_prod ( cod_video );

CREATE OR REPLACE TRIGGER arc_sgv_cad__t_sgv_funcionario BEFORE
    INSERT OR UPDATE OF t_sgv_d_cdt_cod_cad ON t_sgv_funcionario
    FOR EACH ROW
DECLARE
    d VARCHAR2(45);
BEGIN
    SELECT
        a.nom_cadastro
    INTO d
    FROM
        t_sgv_dados_cadastral a
    WHERE
        a.cod_cadastro = :new.t_sgv_d_cdt_cod_cad;

    IF ( d IS NULL OR d <> 'T_SGV_FUNCIONARIO' ) THEN
        raise_application_error(-20223, 'FK T_SGV_FNC_T_SGV_D_CDT_FK in Table T_SGV_FUNCIONARIO violates Arc constraint on Table T_SGV_DADOS_CADASTRAL - discriminator column nom_cadastro doesn''t have value ''T_SGV_FUNCIONARIO'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_sgv_cad_cli__t_sgv_cliente BEFORE
    INSERT OR UPDATE OF t_sgv_d_cdt_cod_cad ON t_sgv_cliente
    FOR EACH ROW
DECLARE
    d VARCHAR2(45);
BEGIN
    SELECT
        a.nom_cadastro
    INTO d
    FROM
        t_sgv_dados_cadastral a
    WHERE
        a.cod_cadastro = :new.t_sgv_d_cdt_cod_cad;

    IF ( d IS NULL OR d <> 'T_SGV_CLIENTE' ) THEN
        raise_application_error(-20223, 'FK T_SGV_CLI_T_SGV_D_CDT_FK in Table T_SGV_CLIENTE violates Arc constraint on Table T_SGV_DADOS_CADASTRAL - discriminator column nom_cadastro doesn''t have value ''T_SGV_CLIENTE'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE SEQUENCE t_sgv_categoria_video_cod_cate START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_sgv_categoria_video_cod_cate BEFORE
    INSERT ON t_sgv_categoria_video
    FOR EACH ROW
    WHEN ( new.cod_categoria_video IS NULL )
BEGIN
    :new.cod_categoria_video := t_sgv_categoria_video_cod_cate.nextval;
END;
/

CREATE SEQUENCE t_sgv_chamado_cod_chamado_seq START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_sgv_chamado_cod_chamado_trg BEFORE
    INSERT ON t_sgv_chamado
    FOR EACH ROW
    WHEN ( new.cod_chamado IS NULL )
BEGIN
    :new.cod_chamado := t_sgv_chamado_cod_chamado_seq.nextval;
END;
/

CREATE SEQUENCE t_sgv_produto_cod_produto_seq START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_sgv_produto_cod_produto_trg BEFORE
    INSERT ON t_sgv_produto
    FOR EACH ROW
    WHEN ( new.cod_produto IS NULL )
BEGIN
    :new.cod_produto := t_sgv_produto_cod_produto_seq.nextval;
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             0
-- ALTER TABLE                             48
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           5
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          3
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
