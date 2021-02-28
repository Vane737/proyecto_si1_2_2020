use restaurante5_db;
select * from proveedor_tb;


insert into accion_tb (acc_nombre) values 
('iniciar sesion'),
('cerrar sesion');

insert into accion_tb (acc_nombre) values 
('registrar empleado'),
('registrar cargo'),
('registrar proveedor'),
('registrar usuario');

insert into accion_tb (acc_nombre) values 
('registrar nit');


insert into accion_tb (acc_nombre) values 
('registrar producto');

insert into accion_tb (acc_nombre) values 
('registrar notaCompra');

insert into accion_tb (acc_nombre) values 
('eliminar notaCompra');

insert into accion_tb (acc_nombre) values 
('regist notEntrada');

insert into accion_tb (acc_nombre) values 
('eliminar notEntrada');

insert into accion_tb (acc_nombre) values 
('registrar almacen');

select * from accion_tb;

select * from bitacora_tb;
select * from cargo_tb;

select * from producto_tb where prod_id = 5;
select * from ncompraxproducto_tb;

select * from notaentrada_tb;
select * from nentradaxproducto_tb;

alter table ncompraxproducto_tb add ncp_id int not null auto_increment primary key first;

-- ==============================
-- MODIFYING COMPRAXPRODUCTOS TABLE
-- ==============================
show create table ncompraxproducto_tb;
select * from ncompraxproducto_tb;

alter table ncompraxproducto_tb drop foreign key ncompraxproducto_tb_ibfk_1;
alter table ncompraxproducto_tb drop foreign key ncompraxproducto_tb_ibfk_2;

alter table ncompraxproducto_tb drop primary key;
alter table ncompraxproducto_tb add ncp_id int not null auto_increment primary key first;

ALTER TABLE ncompraxproducto_tb ADD CONSTRAINT fk_nc_id FOREIGN KEY (nc_id) REFERENCES notaCompra_tb(notC_id);
ALTER TABLE ncompraxproducto_tb ADD CONSTRAINT fk_prd_id FOREIGN KEY (prod_id) REFERENCES producto_tb(prod_id);

show columns from ncompraxproducto_tb;


-- ==============================
-- MODIFYING ENTRADAXPRODUCTOS TABLE
-- ==============================
drop table movimientoLote_tb;
drop table lote_tb;
DROP TABLE nEntradaXProducto_tb;
CREATE TABLE nEntradaXProducto_tb (
	nep_id int auto_increment,
    nep_cantidad INT,
    prod_id INT,
    ne_id INT,
    primary key(nep_id),
    FOREIGN KEY (prod_id) REFERENCES producto_tb (prod_id),
    FOREIGN KEY (ne_id) REFERENCES notaEntrada_tb (notE_id)
);

CREATE TABLE lote_tb (
	lot_id  INT AUTO_INCREMENT,
    lot_cantI INT,
    lot_fecha DATE,
    prod_id INT,	
    alm_id INT,
	nep_id INT,
    
    PRIMARY KEY (lot_id),
    FOREIGN KEY (alm_id) REFERENCES almacen_tb (alm_id),
    foreign key (prod_id) references producto_tb (prod_id),
    foreign key (nep_id) references nEntradaXProducto_tb(nep_id)
);

CREATE TABLE movimientoLote_tb (
	lot_id INT,
    cant INT,
    
    FOREIGN KEY (lot_id) REFERENCES lote_tb (lot_id)
);




