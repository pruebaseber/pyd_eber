import 'package:pyd_eber/all-exports.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UsuarioInternoState extends Equatable {
  const UsuarioInternoState({this.mensaje});

  final String mensaje;

  @override
  List<Object> get props => [];
}

class NoHayUsuarioInternoState extends UsuarioInternoState {
  const NoHayUsuarioInternoState({
    mensaje = 'Inicializando Sesión Interna',
  }) : super(mensaje: mensaje);

//  final String mensaje;
}

class SesionUsuarioInternoState extends UsuarioInternoState {
  const SesionUsuarioInternoState({
    this.mensaje = 'Sesión Interna iniciada correctamente',
  });

  final String mensaje;
}

class ErrorUsuarioInternoState extends UsuarioInternoState {
  const ErrorUsuarioInternoState({
    this.mensaje = 'Error interno',
  });

  final String mensaje;

  @override
  List<Object> get props => [mensaje];

  @override
  String toString() => 'ErrorUsuarioInternoState $mensaje';
}
