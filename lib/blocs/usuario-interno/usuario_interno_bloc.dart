import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pyd_eber/controladores/usuario-interno.dart';
import 'bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pyd_eber/all-exports.dart';

class UsuarioInternoBloc
    extends Bloc<UsuarioInternoEvent, UsuarioInternoState> {
  @override
  UsuarioInternoState get initialState => NoHayUsuarioInternoState();

  @override
  Stream<Transition<UsuarioInternoEvent, UsuarioInternoState>> transformEvents(
      Stream<UsuarioInternoEvent> events,
      TransitionFunction<UsuarioInternoEvent, UsuarioInternoState> transitionFn,
      ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 100)),
      transitionFn,
    );
  }

  @override
  Stream<UsuarioInternoState> mapEventToState(
    UsuarioInternoEvent event,
  ) async* {

    if (event is UsuarioInternoInicalizado) {

      await UsuarioInternoControlador.iniciarSesionUsuarioInterno();

      if (Sesion.usuarioFb == null) {
        add(UsuarioInternoSesionNoIniciada());
      } else {
        internalPrint('Sesion.usuarioFb.email: ${Sesion.usuarioFb.email}');
        add(UsuarioInternoSesionIniciada());
      }
    }
    if (event is UsuarioInternoSesionIniciada) {
      yield SesionUsuarioInternoState();
    }
    if (event is UsuarioInternoSesionNoIniciada) {
      yield ErrorUsuarioInternoState(mensaje: UsuarioInternoControlador.platformException.message);
      // TODO: Timer para chequeo recursivo hasta que haya conexión a internet y reintentar de nuevo el inicio de sesión
    }
  }
}
