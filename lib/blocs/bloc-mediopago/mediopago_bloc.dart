// Delfin API
// BLoC de Medios de Pago

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pyd_eber/all-exports.dart';

class BlocMedioPago extends Bloc<MedioPagoEvento, MedioPagoEstado> {

  ProcesosBlocMedioPago medioPagoProcesosBloc;

  @override
  MedioPagoEstado get initialState {
    medioPagoProcesosBloc = ProcesosBlocMedioPago(this);
    medioPagoProcesosBloc.inicializarMedioPago();
    return EstadoInicialMedioPago(ResultadoProceso(
      codigo: 999,
      mensaje: 'Medios de Pago sin Inicializar.'
    ));
  } 

//  @override
//  Stream<Transition<MedioPagoEvento, MedioPagoEstado>> transformEvents(
//    Stream<MedioPagoEvento> events,
//    TransitionFunction<MedioPagoEvento, MedioPagoEstado> transitionFn,
//  ) {
//    return super.transformEvents(
//      events.debounceTime(const Duration(milliseconds: 150)),
//      transitionFn,
//    );
//  }

  @override
  Stream<MedioPagoEstado> mapEventToState(
    MedioPagoEvento event,
  ) async* {

    if (event is EventoInicializadoMedioPago) {
      yield EstadoProcesosIniciadosMedioPago(event.resultadoProceso);
    }

    if (event is EventoProcesosIniciadosMedioPago) {
      if ( event.resultadoProceso.error ) {
          yield EstadoErrorEnProcesosMedioPago(event.resultadoProceso);
      } else {
          yield EstadoProcesosIniciadosMedioPago(event.resultadoProceso);
      }
    }

    if (event is EventoErroresEncontradosMedioPago) {
        yield EstadoErrorEnProcesosMedioPago(event.resultadoProceso);
    }

    if (event is EventoProgresandoMedioPago) {
      yield EstadoProgresandoMedioPago(event.resultadoProceso);
    }

    if (event is EventoProcesosTerminadosMedioPago) {
      yield EstadoResultadoProcesosTerminadosMedioPago(event.resultadoProceso);
    }
  }
}

