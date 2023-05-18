create table auditoria
(
    id             int identity
        primary key,
    tabla_afectada nvarchar(max) not null,
    accion         nvarchar(max) not null,
    fecha          datetime      not null,
    usuario        nvarchar(max) not null,
    detalles       nvarchar(max)
)
go

create table cliente
(
    id_cli   int identity
        constraint PK_cliente
            primary key,
    dni_cli  nchar(8)     not null,
    ruc_cli  nchar(11),
    nom_cli  nvarchar(50) not null,
    apat_cli nvarchar(60) not null,
    amat_cli nvarchar(60) not null,
    tel_cli  nchar(9)     not null,
    cor_cli  nvarchar(70) not null,
    dir_cli  nvarchar(80) not null
)
go

create trigger registro_auditoria_clientes
    on cliente
    for insert, update, delete
    as
-- missing source code
go

create table presentacion
(
    id_pres  int identity
        constraint PK_presentacion
            primary key,
    tip_pres nvarchar(50) not null
)
go

create trigger registro_auditoria_presentacion
    on presentacion
    for insert, update, delete
    as
-- missing source code
go

create table sysdiagrams
(
    name         sysname not null,
    principal_id int     not null,
    diagram_id   int identity
        primary key,
    version      int,
    definition   varbinary(max),
    constraint UK_principal_name
        unique (principal_id, name)
)
go

exec sp_addextendedproperty 'microsoft_database_tools_support', 1, 'SCHEMA', 'dbo', 'TABLE', 'sysdiagrams'
go

create table tipo_comprobante
(
    id_tip_comp int identity
        constraint PK_tipo_comprobante
            primary key,
    tipo_comp   nvarchar(20) not null
)
go

create table comprobante
(
    id_comp     int           not null
        constraint PK_comprobante
            primary key,
    nume_comp   nvarchar(50)  not null,
    igv         decimal(9, 2) not null,
    id_tip_comp int           not null
        constraint FK_comprobante_tipo_comprobante
            references tipo_comprobante
)
go

create trigger registro_auditoria_comprobante
    on comprobante
    for insert, update, delete
    as
-- missing source code
go

create trigger registro_auditoria_tipo_comprobante
    on tipo_comprobante
    for insert, update, delete
    as
-- missing source code
go

create table tipo_producto
(
    id_tip_pro int identity
        constraint PK_tipo_producto
            primary key,
    tipo_pro   nvarchar(20) not null
)
go

create table producto
(
    id_prod     int identity
        constraint PK_producto
            primary key,
    nom_prod    nvarchar(70)  not null,
    id_tip_pro  int           not null
        constraint FK_producto_tipo_producto
            references tipo_producto,
    precio_prod decimal(9, 1) not null,
    dur_prod    int           not null
)
go

create table inventario
(
    id_inv      int identity
        primary key,
    id_prod     int  not null
        constraint FK_inventario_producto
            references producto,
    fech_produc date not null,
    stok_pro    int  not null,
    id_present  int  not null
        constraint FK_inventario_presentacion
            references presentacion,
    estado_inv  int  not null
)
go

create trigger registro_auditoria_inventario
    on inventario
    for insert, update, delete
    as
-- missing source code
go

create trigger tr_descontar_stock
    on inventario
    for update
    as
-- missing source code
go

create trigger registro_auditoria_producto
    on producto
    for insert, update, delete
    as
-- missing source code
go

create trigger tr_no_eliminar_producto
    on producto
    for delete
    as
-- missing source code
go

create trigger registro_auditoria_tipo_producto
    on tipo_producto
    for insert, update, delete
    as
-- missing source code
go

create table usuario
(
    id_usu       int           not null
        constraint PK_usuario
            primary key,
    username     nvarchar(max) not null,
    pasw         nvarchar(max) not null,
    tipo_usuario nvarchar(20)
)
go

create trigger registro_auditoria_usuario
    on usuario
    for insert, update, delete
    as
-- missing source code
go

create table venta
(
    id_vent   int           not null
        constraint PK_venta
            primary key,
    id_cli    int           not null,
    fech_vent date          not null,
    tot_pre   decimal(9, 2) not null,
    id_comp   int           not null
        constraint FK_venta_comprobante
            references comprobante
)
go

create table detalle_venta
(
    id_vent  int not null
        constraint FK_detalle_venta_venta
            references venta,
    id_inv   int not null
        constraint FK_detalle_venta_inventario
            references inventario,
    can_vent int not null
)
go

create trigger registro_auditoria_detalle_venta
    on detalle_venta
    for insert, update, delete
    as
-- missing source code
go

create trigger registro_auditoria_venta
    on venta
    for insert, update, delete
    as
-- missing source code
go

create function fn_diagramobjects() returns int as
-- missing source code
go

exec sp_addextendedproperty 'microsoft_database_tools_support', 1, 'SCHEMA', 'dbo', 'FUNCTION', 'fn_diagramobjects'
go

grant execute on fn_diagramobjects to [public]
go

create procedure sp_alterdiagram(@diagramname sysname, @owner_id int, @version int, @definition varbinary(max)) as
-- missing source code
go

exec sp_addextendedproperty 'microsoft_database_tools_support', 1, 'SCHEMA', 'dbo', 'PROCEDURE', 'sp_alterdiagram'
go

grant execute on sp_alterdiagram to [public]
go

create procedure sp_creatediagram(@diagramname sysname, @owner_id int, @version int, @definition varbinary(max)) as
-- missing source code
go

exec sp_addextendedproperty 'microsoft_database_tools_support', 1, 'SCHEMA', 'dbo', 'PROCEDURE', 'sp_creatediagram'
go

grant execute on sp_creatediagram to [public]
go

create procedure sp_dropdiagram(@diagramname sysname, @owner_id int) as
-- missing source code
go

exec sp_addextendedproperty 'microsoft_database_tools_support', 1, 'SCHEMA', 'dbo', 'PROCEDURE', 'sp_dropdiagram'
go

grant execute on sp_dropdiagram to [public]
go

create procedure sp_helpdiagramdefinition(@diagramname sysname, @owner_id int) as
-- missing source code
go

exec sp_addextendedproperty 'microsoft_database_tools_support', 1, 'SCHEMA', 'dbo', 'PROCEDURE',
     'sp_helpdiagramdefinition'
go

grant execute on sp_helpdiagramdefinition to [public]
go

create procedure sp_helpdiagrams(@diagramname sysname, @owner_id int) as
-- missing source code
go

exec sp_addextendedproperty 'microsoft_database_tools_support', 1, 'SCHEMA', 'dbo', 'PROCEDURE', 'sp_helpdiagrams'
go

grant execute on sp_helpdiagrams to [public]
go

create procedure sp_renamediagram(@diagramname sysname, @owner_id int, @new_diagramname sysname) as
-- missing source code
go

exec sp_addextendedproperty 'microsoft_database_tools_support', 1, 'SCHEMA', 'dbo', 'PROCEDURE', 'sp_renamediagram'
go

grant execute on sp_renamediagram to [public]
go


