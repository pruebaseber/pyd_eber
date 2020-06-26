
/*
 Tipo de Usuario
 Interno = Colectores, Despachadores, Administradores y Supersuario
 Externo = Clientes
*/

import '../all-exports.dart';

enum TipoUsuario {Interno, Externo}

String tipoUsuario2String(e) {
  return describeEnum(e);
}

TipoUsuario string2TipoUsuario(String s) {
  if ((s == null) | (s == '')) return TipoUsuario.Externo;
  s = s.replaceAll(' ', '');
  TipoUsuario e = TipoUsuario.values.firstWhere((v) => describeEnum(v) == s);
  return e;
}

List<String> tipoUsuario2List() {
  List<String> lista = List<String>();
  TipoUsuario.values.forEach((n) {
    lista.add(describeEnum(n));
  });
  return lista;
}

Map<String, TipoUsuario> tipoUsuario2Map() {
  Map<String, TipoUsuario> mapa = Map<String, TipoUsuario>();
  TipoUsuario.values.forEach((n) {
    mapa.putIfAbsent(tipoUsuario2String(n), () => n);
  });
  return mapa;
}

//------------------------------------------------------------------------------
/*
 Nivel de Usuario Pedidos y Domicilios
 Niveles de Usuarios de un Registro
*/
enum NivelUsuario {
  Cliente,
  Colector,
  Despachador,
  Promociones,
  Administrador,
  SuperUsuario,
}

String nivelUsuario2String(e) {
  String retorno = describeEnum(e);
  retorno = retorno.split(new RegExp(r"(?<=[a-z])(?=[A-Z])")).join(' ');
  return retorno;
}

NivelUsuario string2NivelUsuario(String s) {
  if ((s == null) | (s == '')) return NivelUsuario.Cliente;
  s = s.replaceAll(' ', '');
  NivelUsuario e = NivelUsuario.values.firstWhere((v) => describeEnum(v) == s);
  return e;
}

List<String> nivelUsuario2List() {
  List<String> lista = List<String>();
  NivelUsuario.values.forEach((n) {
    lista.add(nivelUsuario2String(n));
  });
  return lista;
}

Map<String, NivelUsuario> nivelUsuario2Map() {
  Map<String, NivelUsuario> mapa = Map<String, NivelUsuario>();
  NivelUsuario.values.forEach((n) {
    mapa.putIfAbsent(nivelUsuario2String(n), () => n);
  });
  return mapa;
}

//------------------------------------------------------------------------------
/*
 Estados de Pedidos y Domicilios
*/
enum EstadoPedido {
  Abierto,
  Pendiente,
  Preparando,
  Facturando,
  EnDomicilio,
  Entregado,
  CanceladoPorCliente,
  CanceladoPorTienda,
}

String estadoPedido2String(e) {
  String retorno = describeEnum(e);
  retorno = retorno.split(new RegExp(r"(?<=[a-z])(?=[A-Z])")).join(' ');
  return retorno;
}

EstadoPedido string2EstadoPedido(String s) {
  if ((s == null) | (s == '')) return EstadoPedido.Abierto;
  s = s.replaceAll(' ', '');
  EstadoPedido e = EstadoPedido.values.firstWhere((v) => describeEnum(v) == s);
  return e;
}

List<String> estadoPedido2List() {
  List<String> lista = List<String>();
  EstadoPedido.values.forEach((n) {
    lista.add(estadoPedido2String(n));
  });
  return lista;
}

Map<String, EstadoPedido> estadoPedido2Map() {
  Map<String, EstadoPedido> mapa = Map<String, EstadoPedido>();
  EstadoPedido.values.forEach((n) {
    mapa.putIfAbsent(estadoPedido2String(n), () => n);
  });
  return mapa;
}

//------------------------------------------------------------------------------
/*
 Repetir Publicidad y Promociones
*/
enum RepetirPromocion {
  IntervaloDias,
  CadaDiaDeLaSemana,
  CadaDiaDelMes,
}

String repetirPromocion2String(e) {
  String retorno = describeEnum(e);
  retorno = retorno.split(new RegExp(r"(?<=[a-z])(?=[A-Z])")).join(' ');
  return retorno;
}

RepetirPromocion string2RepetirPromocion(String s) {
  if ((s == null) | (s == '')) return RepetirPromocion.IntervaloDias;
  s = s.replaceAll(' ', '');
  RepetirPromocion e = RepetirPromocion.values.firstWhere((v) => describeEnum(v) == s);
  return e;
}

List<String> repetirPromocion2List() {
  List<String> lista = List<String>();
  RepetirPromocion.values.forEach((n) {
    lista.add(repetirPromocion2String(n));
  });
  return lista;
}

Map<String, RepetirPromocion> repetirPromocion2Map() {
  Map<String, RepetirPromocion> mapa = Map<String, RepetirPromocion>();
  RepetirPromocion.values.forEach((n) {
    mapa.putIfAbsent(repetirPromocion2String(n), () => n);
  });
  return mapa;
}

//------------------------------------------------------------------------------