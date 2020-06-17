/*
 Proyecto: Eventos de Orientación Empresarial
 Version: 0.0.7
 Autor: Alse Desarrollos
 Unidad: Enumeradores
 Todos los Enumeradores utilizados en los modelos del proyecto
*/

import 'package:flutter/foundation.dart';

/*
 Nivel de Autorización
 Nivel de Autorización de un Registro
*/
enum NivelAutorizacion {NoVerificado, Cliente, Colector, Despachador, Administrador, Senior}

String nivelAutorizacion2String(e) {
  String s = describeEnum(e);
//  if (s == 'Lider') {
//    s = 'Líder';
//  }
  return s;
}

NivelAutorizacion string2NivelAutorizacion(String s) {
//  if (s == 'Líder') {
//    s = 'Lider';
//  }
  NivelAutorizacion e = NivelAutorizacion.values.firstWhere((v) => describeEnum(v) == s);
  return e;
}

List<String> nivelAutorizacion2List() {
  List<String> lista = List<String>();
  NivelAutorizacion.values.forEach((n) {
    lista.add(describeEnum(n));
  });
  return lista;
}

Map<String, NivelAutorizacion> nivelAutorizacion2Map() {
  Map<String, NivelAutorizacion> mapa = Map<String, NivelAutorizacion>();
  NivelAutorizacion.values.forEach((n) {
    mapa.putIfAbsent(describeEnum(n), () => n);
  });
  return mapa;
}

//------------------------------------------------------------------------------
/*
 Invitados
 Invitados de un Registro
*/
enum Invitados {Publico, Grupo, Invitacion, Niveles} //
/*
Existen 4 tipos de Eventos:
Público:
  Aquellos eventos a los que puede asistir cualquier persona, abierto a todos los Empresarios sin importar su nivel.
  El cupo debe ser limitado a cierto número de personas.
  Se podría solicitar la confirmación de asistencia.
  Puede ser gratuito o pago.
Grupo:
  Sólo pueden verlo los Empresarios que estén en el Grupo que administra el Empresario-Líder que ha creado el Evento.
  Pueden asistir todos los Empresarios que pertenezcan al Grupo.
  Se podría solicitar la confirmación de asistencia.
  El cupo debe ser limitado a cierto número de personas.
  Puede ser gratuito o pago.
Invitación:
  Sólo verán este tipo de Eventos los Empresarios que han sido Invitados directamente por el Empresario-Líder que ha creado el Evento.
  Se debe solicitar la confirmación de asistencia.
  El cupo debe ser limitado a cierto número de personas.
  Puede ser gratuito o pago.
Nivel:
  Sólo verán este tipo de Eventos los Empresarios que estén en el o los niveles que el Empresario-Líder que ha creado el Evento haya definido.
  Se debe solicitar la confirmación de asistencia.
  El cupo debe ser limitado a cierto número de personas.
  Puede ser gratuito o pago.
 */
String invitados2String(e) {
  return describeEnum(e);
}

Invitados string2Invitados(String s) {
  Invitados e = Invitados.values.firstWhere((v) => describeEnum(v) == s);
  return e;
}

List<String> invitados2List() {
  List<String> lista = List<String>();
  Invitados.values.forEach((n) {
    lista.add(describeEnum(n));
  });
  return lista;
}

Map<String, Invitados> invitados2Map() {
  Map<String, Invitados> mapa = Map<String, Invitados>();
  Invitados.values.forEach((n) {
    mapa.putIfAbsent(describeEnum(n), () => n);
  });
  return mapa;
}

//------------------------------------------------------------------------------
/*
 Nivel de Usuario Eventos
 Niveles de Usuarios de un Registro
*/
enum NivelUsuario {NoVerificado, Cliente, Colector, Despachador, Administrador, SuperUsuario}

String nivelUsuario2String(e) {
  return describeEnum(e);
}

NivelUsuario string2NivelUsuario(String s) {
  NivelUsuario e = NivelUsuario.values.firstWhere((v) => describeEnum(v) == s);
  return e;
}

List<String> nivelUsuario2List() {
  List<String> lista = List<String>();
  NivelUsuario.values.forEach((n) {
    lista.add(describeEnum(n));
  });
  return lista;
}

Map<String, NivelUsuario> nivelUsuario2Map() {
  Map<String, NivelUsuario> mapa = Map<String, NivelUsuario>();
  NivelUsuario.values.forEach((n) {
    mapa.putIfAbsent(describeEnum(n), () => n);
  });
  return mapa;
}

//------------------------------------------------------------------------------
