use ejercicios;

-- Ejercicio 1 Crear una query que regrese las facturas de egreso entre dos fechas de emisión:
select iddocumento as ID, vendedor_rfc as "RFC Vendedor", monto as 'Monto',  fecha_emision as "Fecha Emision", (select nombre from documentotipo where iddocumentotipo = tipo_nombre) as 'Tipo Doc'
from documento
where tipo_nombre = '1' and
fecha_emision between 
STR_TO_DATE('01-10-2022 01:20:01' , '%d-%m-%Y %H:%i:%s') and STR_TO_DATE('01-12-2022 01:20:01' , '%d-%m-%Y %H:%i:%s');

-- Ejercicio 2 Crear una query la cual regrese la sumatoria de todos los documentos de ingreso agrupados por comprador, 
-- el nombre del comprador debe de estar en mayúsculas aun cuando en el registro no lo esté.
SET @row_number = 0;
select  (@row_number:=@row_number + 1) AS ID, e.razon_social as 'Razon social comprador', e.rfc as 'RFC', dt.nombre as 'Tipo Doc', sum(d.monto) as 'Suma'
from documento d inner join documentotipo dt on d.tipo_nombre = dt.iddocumentotipo inner join entidad e on e.rfc = d.comprador_rfc
where dt.iddocumentotipo=1
group by e.rfc, dt.nombre , e.razon_social
;

