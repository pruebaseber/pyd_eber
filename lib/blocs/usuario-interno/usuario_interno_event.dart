import 'package:meta/meta.dart';

@immutable
abstract class UsuarioInternoEvent {}

class UsuarioInternoInicalizado extends UsuarioInternoEvent {}

class UsuarioInternoSesionIniciada extends UsuarioInternoEvent {}

class UsuarioInternoSesionNoIniciada extends UsuarioInternoEvent {}
